---
title: "Block 4 -- Session 1"
subtitle: "Data Centers \\& Network Virtualization"
author: "Arquitectura de Xarxes"
institute: "Universitat Pompeu Fabra"
theme: "Madrid"
colortheme: "dolphin"
fonttheme: "structurebold"
aspectratio: 169
navigation: horizontal
toc: true
header-includes:
  - \usepackage{booktabs}
  - \usepackage[table]{xcolor}
  - \usepackage{tikz}
  - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, shapes.symbols, fit}
  - \setbeamerfont{footnote}{size=\tiny}
  - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
---

# Introduction

## What Is the Cloud and How Is It Formed?

\begin{center}
\Large\textit{Every time you use Netflix, Gmail, or ChatGPT,\\your request travels to a building full of servers.\\What happens inside that building?}
\end{center}

\vfill

**Learning objectives:**

1. Understand why data centers exist and what they contain
2. Explain virtualization and distinguish VMs, hypervisors, and containers
3. Describe how networks are virtualized (vNICs, vSwitches, overlays)

<!-- nota: esta pregunta conecta con la experiencia diaria de los alumnos — todos usan servicios cloud sin saberlo -->

## Block 4 Roadmap

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Session 1 (today)} & \textbf{Session 2} \\
\hline
Theme & \textit{The infrastructure} & \textit{The business model} \\
\hline
Topics & Data centers & From virtualization to cloud \\
& VMs \& hypervisors & NIST cloud definition \\
& VMs vs containers (overview) & IaaS / PaaS / SaaS \\
& vNICs, vSwitches, vRouters & VPC architecture \\
& Multi-tenancy \& VLANs & Security groups \& ACLs \\
& Overlay networks (VXLAN) & Governance \& GDPR \\
\hline
\end{tabular}
\end{center}

<!-- nota: dejar claro que hoy construimos la base técnica; la sesión 2 la convierte en negocio -->

# Data Centers

## What Is a Data Center?

- A **data center** is a facility housing computer systems and networking equipment
- Purpose: run applications and store data **reliably, at scale, 24/7**
- Ranges from small server rooms to **warehouse-scale** buildings

\vfill

Who operates them?

- **Enterprises**: banks, hospitals, universities (their own IT)
- **Cloud providers**: AWS, Azure, GCP (sell capacity to others)
- **Colocation**: you rent space; provider handles power and cooling

\footnotesize Source: Barroso, Clidaras \& Hölzle, *The Datacenter as a Computer*, 3rd ed., Morgan \& Claypool, 2019.

## A Data Center from the Inside

\begin{center}
\includegraphics[width=0.50\textwidth]{img/datacenter.jpg}
\end{center}

\vfill

\footnotesize
Rows of server racks, each containing dozens of servers, connected by structured cabling. Source: Cisco, \textit{What Is a Data Center?}, cisco.com.

<!-- nota: señalar los racks, el cableado estructurado, y la refrigeración visible en el techo -->

## Inside a Data Center: Five Pillars

\begin{center}
\begin{tikzpicture}[
    pillar/.style={draw, thick, rounded corners, minimum width=2.2cm, minimum height=0.9cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[pillar, fill=blue!15] (compute) at (0,0) {Compute\\(CPUs)};
\node[pillar, fill=red!15] (gpu) at (2.8,0) {Accelerators\\(GPUs/TPUs)};
\node[pillar, fill=green!15] (storage) at (5.6,0) {Storage\\(SSDs/HDDs)};
\node[pillar, fill=orange!15] (network) at (8.4,0) {Network\\(switches, cabling)};
\node[pillar, fill=gray!20] (facility) at (11.2,0) {Facilities\\(power, cooling)};
\end{tikzpicture}
\end{center}

\vfill

- **Compute**: CPUs that execute workloads (web servers, databases, analytics)
- **Accelerators**: GPUs and TPUs for AI/ML training and inference
  - The explosive growth of AI has made GPUs a critical data center resource
- **Storage**: SSDs and HDDs holding persistent data
- **Network**: switches, routers, and structured cabling connecting everything
- **Facilities**: redundant power supplies, cooling systems, physical security

<!-- nota: preguntar a los alumnos si saben por qué NVIDIA vale más que muchos países — es por los GPUs en data centers -->

## The Problem with Physical Infrastructure

- Traditional model (1990s--early 2000s): **one server = one application**
- Typical server utilization: only **10--15\%** of capacity
- Adding capacity means buying, racking, cabling $\rightarrow$ **weeks or months**
- Hardware failure takes down the entire service
- No way to scale down when demand drops

\vfill

\footnotesize
Key insight: most servers sit idle most of the time. We are paying for hardware we barely use.

<!-- nota: preguntar a los alumnos cuántos servidores creen que tiene Google (~1M+). AWS tiene data centers en ~30 regiones -->

## The Cloud: From Waste to Efficiency

- **1990s--early 2000s**: one application per server; most capacity wasted
- **2001**: VMware makes it possible to run **multiple systems on one machine**
  - Technology: **Virtual Machines (VMs)**
- **Mid-2000s**: enterprises consolidate servers (60--80\% utilization)
- **2006--2010**: Amazon, Google, and Microsoft start **renting computing capacity** online
  - Technology: **Cloud Computing** (AWS, Azure, GCP)
- **2010s--today**: lightweight alternatives emerge; automation at massive scale
  - Technologies: **Containers** (Docker) and **orchestration** (Kubernetes)

\vfill

\footnotesize
We will explore each of these technologies step by step throughout Blocks 4 and 5.

## Scalability and Elasticity

- **Scalability**: ability to grow resources as demand increases
- **Elasticity**: ability to grow \textit{and shrink} automatically
- Physical infrastructure provides **neither** in practice:
  - Cannot add servers in minutes
  - Cannot return servers when demand drops
- Virtualization enables both $\rightarrow$ foundation of **cloud computing** (Session 2)

<!-- nota: ejemplo Netflix — escala servidores en horas pico, reduce de madrugada. Sin virtualización esto sería imposible -->

## Discussion: Data Centers

\begin{center}
\Large\textit{A company runs 50 servers, each at 10 percent utilization.\\That is 50 machines doing the work of 5.\\What would you do to reduce waste?}
\end{center}

\vfill

Hints: consolidation, fewer physical machines, higher utilization, isolation between workloads.

<!-- nota: guiar hacia la idea de virtualización como solución natural al desperdicio de recursos -->

# Virtualization Concepts

## What Is Virtualization?

- **Virtualization** makes it possible for a single computer to act like many
- A software layer called **hypervisor** divides the physical resources (CPU, RAM, disk, NIC) into isolated **virtual machines**
- Each VM gets its own share and believes it owns dedicated hardware

\vfill

\begin{center}
\footnotesize
\textit{One physical machine, many virtual ones:\\each believes it has the hardware all to itself.}
\end{center}

## Virtual Machines (VMs)

- A VM is an **isolated computing environment** with its own CPU, memory, network interface, and storage
- Runs a **full operating system** (Linux, Windows, etc.)
- Completely **isolated** from other VMs on the same host

\vfill

Key properties:

- **Encapsulation**: entire VM state stored as files $\rightarrow$ easy to copy, move, backup
- **Hardware independence**: the VM does not care about the underlying hardware
- **Snapshotting**: save and restore VM state at any point in time

\footnotesize Source: Popek \& Goldberg, "Formal Requirements for Virtualizable Third Generation Architectures," *CACM*, 1974.

## Host and Guest Systems

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=3cm, minimum height=0.8cm, font=\small},
    >=Stealth
]
\node[box, fill=gray!20, minimum width=7.8cm] (hw) at (0,0) {Physical Hardware (Host)};
\node[box, fill=blue!15, minimum width=7.8cm] (hyp) at (0,1.2) {Hypervisor / Host OS};
\node[box, fill=green!15, minimum width=2.5cm] (g1) at (-2.6,2.4) {Guest OS 1};
\node[box, fill=green!15, minimum width=2.5cm] (g2) at (0,2.4) {Guest OS 2};
\node[box, fill=green!15, minimum width=2.5cm] (g3) at (2.6,2.4) {Guest OS 3};
\node[box, fill=red!15, minimum width=2.5cm] (a1) at (-2.6,3.6) {App A};
\node[box, fill=teal!15, minimum width=2.5cm] (a2) at (0,3.6) {App B};
\node[box, fill=olive!15, minimum width=2.5cm] (a3) at (2.6,3.6) {App C};
\end{tikzpicture}
\end{center}

- **Host**: physical machine providing CPU, RAM, disk, NIC
- **Guest**: virtual machine running its own OS on the host
- Each guest believes it has **dedicated hardware** (abstraction)

## Hypervisors: The Key Enabler

- A **hypervisor** (or VMM) manages and allocates physical resources to VMs
- Two types:

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Type 1 (Bare-metal)} & \textbf{Type 2 (Hosted)} \\
\hline
Runs on & Directly on hardware & On top of a host OS \\
\hline
Performance & Near-native & Some overhead \\
\hline
Use case & Data centers, production & Development, testing \\
\hline
Examples & VMware ESXi, KVM, Hyper-V & VirtualBox, VMware Workstation \\
\hline
\end{tabular}
\end{center}

\footnotesize Source: Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.

## Type 1 vs Type 2: Visual Comparison

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2.8cm, minimum height=0.7cm, font=\scriptsize},
    >=Stealth
]
% Type 1
\node[font=\small\bfseries] at (-3.5,4.5) {Type 1 (Bare-metal)};
\node[box, fill=gray!20, minimum width=5.8cm] (hw1) at (-3.5,0) {Hardware};
\node[box, fill=blue!25, minimum width=5.8cm] (hyp1) at (-3.5,1) {Hypervisor};
\node[box, fill=green!15] (vm1a) at (-4.8,2) {VM 1};
\node[box, fill=purple!15] (vm1b) at (-2.2,2) {VM 2};
\node[box, fill=red!15] (a1a) at (-4.8,3) {App};
\node[box, fill=teal!15] (a1b) at (-2.2,3) {App};

% Type 2
\node[font=\small\bfseries] at (3.5,4.5) {Type 2 (Hosted)};
\node[box, fill=gray!20, minimum width=5.8cm] (hw2) at (3.5,0) {Hardware};
\node[box, fill=yellow!15, minimum width=5.8cm] (os2) at (3.5,1) {Host OS};
\node[box, fill=blue!25, minimum width=5.8cm] (hyp2) at (3.5,2) {Hypervisor};
\node[box, fill=green!15] (vm2a) at (2.2,3) {VM 1};
\node[box, fill=purple!15] (vm2b) at (4.8,3) {VM 2};
\node[box, fill=red!15] (a2a) at (2.2,4) {App};
\node[box, fill=teal!15] (a2b) at (4.8,4) {App};
\end{tikzpicture}
\end{center}

- Type 1: hypervisor **replaces** the OS $\rightarrow$ less overhead, used in production
- Type 2: hypervisor runs **as an application** $\rightarrow$ easier to set up, used for dev/testing

## VMs vs Containers: Overview

:::::::::::::: {.columns}
::: {.column width="50%"}

**Virtual Machines**

- Include a **full guest OS** per instance
- Size: **GBs** (full OS image)
- Boot time: **minutes**
- Strong isolation (hardware level)
- Can run **different operating systems**

:::
::: {.column width="50%"}

**Containers**

- **No guest OS**; share the host kernel
- Size: **MBs** (app + dependencies only)
- Boot time: **seconds**
- Good isolation (kernel namespaces/cgroups)
- All containers share the **same OS kernel**

:::
::::::::::::::

\vfill
\footnotesize
This is just an overview. We will do a deep dive into container internals and networking in \textbf{Block 5}.

Source: Red Hat, \textit{Containers vs VMs}, redhat.com.

## When to Use VMs vs Containers

- **Use VMs when:**
  - You need **different operating systems** (Linux + Windows on the same host)
  - Strong **security isolation** is critical (e.g., different tenants)
  - Legacy applications that require a specific OS environment

- **Use containers when:**
  - Running **many instances** of similar applications
  - **Fast startup** and scaling matters
  - **Microservices** architecture (each service in its own container)

- **In practice**: most organizations use **both** together
  - Containers run inside VMs for defense in depth

\vfill
\footnotesize
Microservices and container networking: \textbf{Block 5}.

## Discussion: Virtualization

\begin{center}
\Large\textit{You need to deploy 200 instances of the same web application\\that must scale up and down every few minutes.\\Would you use VMs, containers, or both? Why?}
\end{center}

\vfill

Hints: boot time, resource overhead, isolation needs, how fast you need to scale.

<!-- nota: no hay una respuesta única correcta — la clave es que razonen sobre los trade-offs -->

# Virtual Network Infrastructure

## From Physical to Virtual Networks

- You already know how physical networks work (Blocks 1 to 3):
  - NICs, switches, routers, VLANs, routing protocols
- When we virtualize servers, we also need to **virtualize the network**
- The same concepts apply, but implemented **in software** instead of hardware

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|}
\hline
\rowcolor{blue!10} \textbf{Physical} & \textbf{Virtual equivalent} \\
\hline
NIC (network interface card) & \textbf{vNIC} (virtual NIC) \\
\hline
Switch & \textbf{vSwitch} (virtual switch) \\
\hline
Router & \textbf{vRouter} (virtual router) \\
\hline
Cable & Internal software path \\
\hline
\end{tabular}
\end{center}

\vfill
\footnotesize
Key idea: if VMs think they have real hardware, they also need a \textbf{real-looking network}.

## Physical vs Virtual: Side by Side

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.4cm, minimum height=0.6cm, font=\scriptsize},
    lbl/.style={font=\scriptsize\bfseries},
    >=Stealth
]
% Physical side
\node[lbl] at (-4,3.8) {Physical Network};
\node[box, fill=green!15] (srv1) at (-5.5,2.8) {Server 1};
\node[box, fill=purple!15] (srv2) at (-2.5,2.8) {Server 2};
\node[box, fill=orange!15] (nic1) at (-5.5,1.8) {NIC};
\node[box, fill=orange!15] (nic2) at (-2.5,1.8) {NIC};
\node[box, fill=blue!20, minimum width=4cm] (psw) at (-4,0.6) {Physical Switch};
\draw[thick] (srv1) -- (nic1);
\draw[thick] (srv2) -- (nic2);
\draw[thick] (nic1) -- (-5.5,0.9);
\draw[thick] (nic2) -- (-2.5,0.9);

% Virtual side
\node[draw, thick, rounded corners, fill=gray!5, minimum width=4.5cm, minimum height=4cm] (host) at (4,1.8) {};
\node[lbl] at (4,3.6) {Host};
\node[box, fill=green!15] (vm1) at (2.5,2.8) {VM 1};
\node[box, fill=purple!15] (vm2) at (5.5,2.8) {VM 2};
\node[box, fill=orange!15] (vnic1) at (2.5,1.8) {vNIC};
\node[box, fill=orange!15] (vnic2) at (5.5,1.8) {vNIC};
\node[box, fill=blue!20, minimum width=4cm] (vsw) at (4,0.6) {vSwitch};
\draw[thick] (vm1) -- (vnic1);
\draw[thick] (vm2) -- (vnic2);
\draw[thick] (vnic1) -- (2.5,0.9);
\draw[thick] (vnic2) -- (5.5,0.9);
\end{tikzpicture}
\end{center}

- Left: two physical servers connected by a physical switch and cables
- Right: two VMs connected by a virtual switch, all inside **one physical host**

## Example: VM-to-VM Communication

- Linux can act as a **Layer 2 switch** using a **bridge** (`br0`)
- VMs on the same bridge share a subnet: frames forwarded by MAC address

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=8cm, minimum height=5.2cm] (host) at (0,2.2) {};
\node[font=\scriptsize\bfseries] at (0,4.7) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-2.5,3.8) {VM 1};
\node[box, fill=purple!15] (vm2) at (2.5,3.8) {VM 2};
\node[lbl] at (-2.5,3.3) {`eth0`: 192.168.1.10};
\node[lbl] at (2.5,3.3) {`eth0`: 192.168.1.20};
\node[box, fill=blue!20, minimum width=6cm] (br) at (0,2.4) {br0 (Linux bridge)};
\node[box, fill=yellow!20] (rtr) at (0,1.4) {vRouter / NAT};
\node[box, fill=orange!15] (pnic) at (0,0.4) {Physical NIC};
\draw[thick] (-2.5,3.0) -- (-2.5,2.7);
\draw[thick] (2.5,3.0) -- (2.5,2.7);
\draw[thick] (0,2.1) -- (0,1.7);
\draw[thick] (0,1.1) -- (0,0.7);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-0.8) {Internet};
\draw[thick] (0,0.1) -- (0,-0.3);
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
How does VM 1 reach VM 2? And how does it reach the Internet?

## Example: VM-to-VM Communication (Solution)

- Same subnet, same bridge $\rightarrow$ **L2 forwarding** (no routing needed)

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=8cm, minimum height=5.2cm] (host) at (0,2.2) {};
\node[font=\scriptsize\bfseries] at (0,4.7) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-2.5,3.8) {VM 1};
\node[box, fill=purple!15] (vm2) at (2.5,3.8) {VM 2};
\node[lbl] at (-2.5,3.3) {`eth0`: 192.168.1.10};
\node[lbl] at (2.5,3.3) {`eth0`: 192.168.1.20};
\node[box, fill=blue!20, minimum width=6cm] (br) at (0,2.4) {br0 (Linux bridge)};
\node[box, fill=yellow!20] (rtr) at (0,1.4) {vRouter / NAT};
\node[box, fill=orange!15] (pnic) at (0,0.4) {Physical NIC};
\draw[thick] (-2.5,3.0) -- (-2.5,2.7);
\draw[thick] (2.5,3.0) -- (2.5,2.7);
\draw[thick] (0,2.1) -- (0,1.7);
\draw[thick] (0,1.1) -- (0,0.7);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-0.8) {Internet};
\draw[thick] (0,0.1) -- (0,-0.3);
\draw[->, thick, dashed, red!60] (-2.5,3.5) -- (-2.5,2.7) -- (2.5,2.7) -- (2.5,3.5);
\node[font=\tiny, text=red!60] at (0,2.9) {VM-to-VM (L2)};
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
To reach the Internet: traffic goes through the vRouter/NAT and the physical NIC.

## Example: VMs on Different Subnets

- What if VM 1 and VM 2 are on **different subnets**?
- The host needs to act as a **router**: enable IP forwarding between bridges

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=10cm, minimum height=4.8cm] (host) at (0,1.8) {};
\node[font=\scriptsize\bfseries] at (0,4.1) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-3,3.3) {VM 1};
\node[box, fill=purple!15] (vm2) at (3,3.3) {VM 2};
\node[lbl] at (-3,2.8) {`10.0.1.10/24`};
\node[lbl] at (3,2.8) {`10.0.2.20/24`};
\node[box, fill=blue!20, minimum width=3cm] (br1) at (-3,1.8) {br0};
\node[box, fill=blue!20, minimum width=3cm] (br2) at (3,1.8) {br1};
\node[lbl] at (-3,1.3) {`10.0.1.1`};
\node[lbl] at (3,1.3) {`10.0.2.1`};
\node[box, fill=yellow!20, minimum width=2cm] (rtr) at (0,0.8) {vRouter};
\node[box, fill=orange!15] (pnic) at (0,0.0) {Physical NIC};
\draw[thick] (-3,2.5) -- (-3,2.1);
\draw[thick] (3,2.5) -- (3,2.1);
\draw[thick] (-1.5,1.8) -- (-0.8,1.1);
\draw[thick] (1.5,1.8) -- (0.8,1.1);
\draw[thick] (0,0.5) -- (0,0.3);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.1) {Internet};
\draw[thick] (0,-0.3) -- (0,-0.6);
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
How does VM 1 (10.0.1.10) reach VM 2 (10.0.2.20)? What components are involved?

## Example: VMs on Different Subnets (Solution)

- Different subnets $\rightarrow$ traffic must go through the **vRouter** (L3 forwarding)

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=10cm, minimum height=4.8cm] (host) at (0,1.8) {};
\node[font=\scriptsize\bfseries] at (0,4.1) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-3,3.3) {VM 1};
\node[box, fill=purple!15] (vm2) at (3,3.3) {VM 2};
\node[lbl] at (-3,2.8) {`10.0.1.10/24`};
\node[lbl] at (3,2.8) {`10.0.2.20/24`};
\node[box, fill=blue!20, minimum width=3cm] (br1) at (-3,1.8) {br0};
\node[box, fill=blue!20, minimum width=3cm] (br2) at (3,1.8) {br1};
\node[lbl] at (-3,1.3) {`10.0.1.1`};
\node[lbl] at (3,1.3) {`10.0.2.1`};
\node[box, fill=yellow!20, minimum width=2cm] (rtr) at (0,0.8) {vRouter};
\node[box, fill=orange!15] (pnic) at (0,0.0) {Physical NIC};
\draw[thick] (-3,2.5) -- (-3,2.1);
\draw[thick] (3,2.5) -- (3,2.1);
\draw[thick] (-1.5,1.8) -- (-0.8,1.1);
\draw[thick] (1.5,1.8) -- (0.8,1.1);
\draw[thick] (0,0.5) -- (0,0.3);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.1) {Internet};
\draw[thick] (0,-0.3) -- (0,-0.6);
\draw[->, thick, dashed, red!60] (-3,3.0) -- (-3,2.1) -- (-0.8,1.1) -- (0,0.8) -- (0.8,1.1) -- (3,2.1) -- (3,3.0);
\node[font=\tiny, text=red!60] at (0,0.4) {VM-to-VM (L3)};
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
Each VM has a default gateway pointing to its bridge IP. The host routes packets between subnets, just like a physical router.

## Virtual Network Interfaces (vNICs)

- A **vNIC** is a software-emulated network interface card
- From the guest's perspective: behaves exactly like a real NIC
- Each VM gets **one or more vNICs**

Key characteristics:

- Has its own **MAC address** (software-assigned by the hypervisor)
- Has its own **IP address** configuration
- Connected to a **virtual switch** on the host
- Multiple vNICs per VM enable **multi-network** connectivity

\vfill

\footnotesize
Same MAC/IP concepts from Blocks 1 to 3, now virtualized inside the hypervisor.

## Types of Virtual Switches

\begin{center}
\renewcommand{\arraystretch}{1.3}
\small
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Type} & \textbf{Scope} & \textbf{Example} \\
\hline
Standard vSwitch & Single host & VMware vSS, Linux bridge \\
\hline
Distributed vSwitch & Multiple hosts, central mgmt & VMware vDS, Hyper-V \\
\hline
SDN-based vSwitch & Programmable, software-defined & OVS, VMware NSX \\
\hline
\end{tabular}
\end{center}

- All types support **VLANs** (same 802.1Q from Block 3, now inside the hypervisor)
- OVS is open source and **programmable via software** $\rightarrow$ deep dive in **Block 5** (SDN)

\vfill
\footnotesize
Source: Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.

## Bridging Modes

Three ways to connect a VM to the outside world:

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Mode} & \textbf{VM visibility} & \textbf{External access?} & \textbf{Use case} \\
\hline
Bridged & Same subnet as host & Yes (direct) & Production servers \\
\hline
NAT & Hidden behind host IP & Outbound only & Dev/testing \\
\hline
Host-only & Only sees the host & No & Isolated labs \\
\hline
\end{tabular}
\end{center}

- **Bridged**: VM appears directly on the physical network
- **NAT**: VM traffic translated through the host's IP (same NAT from Block 3)
- **Host-only**: completely isolated from external networks

## Virtual Routing and NAT

- A **virtual router** forwards traffic between virtual subnets
- Same function as a physical router, implemented **in software**
- Handles:
  - Routing between VMs on **different subnets**
  - **NAT** for VMs accessing external networks
  - Acting as **default gateway** for VMs

\vfill

\footnotesize
Same NAT concept from Block 3, now managed by the hypervisor instead of a physical device.

In Session 2 we will see how cloud providers offer NAT as a \textbf{managed service} (NAT Gateway).

## Packet Flow: Virtual to Physical

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.6cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[box, fill=green!15] (vm) at (0,0) {VM};
\node[box, fill=orange!10] (vnic) at (2.5,0) {vNIC};
\node[box, fill=blue!15] (vsw) at (5,0) {vSwitch};
\node[box, fill=yellow!20] (vr) at (7.5,0) {vRouter};
\node[box, fill=gray!20] (pnic) at (10,0) {pNIC};
\node[box, fill=yellow!10] (ext) at (12.5,0) {Network};

\draw[->, thick] (vm) -- (vnic);
\draw[->, thick] (vnic) -- (vsw);
\draw[->, thick] (vsw) -- (vr);
\draw[->, thick] (vr) -- (pnic);
\draw[->, thick] (pnic) -- (ext);
\end{tikzpicture}
\end{center}

1. VM generates packet with **virtual MAC/IP** as source
2. vNIC passes frame to **vSwitch** (L2 forwarding)
3. If destination is another subnet $\rightarrow$ **vRouter** (L3 forwarding)
4. vRouter may apply **NAT** (replace private IP with host IP)
5. Frame exits through **physical NIC** to the external network

## Discussion: Virtual Networks

\begin{center}
\Large\textit{Two VMs on the same host want to communicate.\\Does their traffic ever leave the physical machine?\\What if they are on different subnets?}
\end{center}

\vfill

Hints: vSwitch handles same-subnet traffic locally; vRouter needed for different subnets; traffic may still stay inside the host.

<!-- nota: esta pregunta refuerza la diferencia entre L2 (vSwitch) y L3 (vRouter), y que el tráfico intra-host no pasa por la red física -->

# Network Isolation and Multi-Tenancy

## Why Isolation Matters

- Data centers host workloads from **multiple tenants** (users, departments, companies)
- **Multi-tenancy**: shared infrastructure, but each tenant expects:
  - **Performance isolation**: my traffic is not affected by yours
  - **Security isolation**: you cannot see or access my data
  - **Address independence**: we can both use `10.0.0.0/24`

\vfill

\footnotesize
Without isolation: broadcast storms, ARP spoofing, IP conflicts, resource starvation.

<!-- nota: analogía — apartamentos en un edificio: misma estructura, cada uno es privado -->

## VLANs in Virtual Environments

- Same **802.1Q** concept from Block 3, now applied to virtual switches
- Hypervisors assign VMs to specific VLANs via **vSwitch port groups**
- Traffic tagged with VLAN IDs: tenants separated at L2

\vfill

**Limitation**: VLAN ID is 12 bits $\rightarrow$ max **4,096 VLANs**

\vfill

Problem: 4,096 VLANs is **not enough** for a large cloud with thousands of tenants.

\footnotesize Source: IEEE 802.1Q-2022, "Bridges and Bridged Networks."

## Micro-Segmentation

- Beyond VLANs: **per-VM or per-workload firewall policies**
- Goal: **least privilege**, each VM should only reach what it strictly needs
- Key concept in modern **zero trust** security architectures

\vfill

\footnotesize
In Session 2 we will see how cloud providers implement this with \textbf{Security Groups} (per-instance) and \textbf{Network ACLs} (per-subnet).

## Overlay Networks: Concept

- An **overlay network** is a virtual network built **on top of** the physical one
- Uses **encapsulation**: wrap virtual frames inside physical packets

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, font=\scriptsize, minimum height=0.6cm},
    >=Stealth
]
\node[box, fill=green!15, minimum width=2cm] (inner) at (0,0) {Original Frame};
\node[box, fill=blue!15, minimum width=1.5cm] (hdr) at (-2.2,0) {Overlay Hdr};
\node[box, fill=gray!20, minimum width=1.2cm] (outer) at (-4,0) {Outer IP/UDP};

\node[draw, thick, dashed, rounded corners, fit=(outer)(hdr)(inner), inner sep=4pt, label=above:{\scriptsize Encapsulated Packet}] {};
\end{tikzpicture}
\end{center}

- The physical network only sees the **outer headers**
- The virtual (tenant) traffic is hidden inside $\rightarrow$ **full isolation**

## VXLAN: Overview

- **VXLAN** (Virtual eXtensible LAN): most widely used overlay protocol
- Encapsulates L2 frames in **UDP packets** over the physical network
- Uses a **24-bit VNI** (VXLAN Network Identifier)
  - $2^{24}$ = **16 million** virtual networks (vs 4,096 VLANs!)
- Endpoints: **VTEPs** (VXLAN Tunnel Endpoints)
  - Encapsulate at source, decapsulate at destination

\footnotesize Source: IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.

## VXLAN: How It Works

\begin{center}
\begin{tikzpicture}[
    vm/.style={draw, thick, rounded corners, fill=green!15, minimum width=1.2cm, minimum height=0.6cm, font=\scriptsize},
    vm2/.style={draw, thick, rounded corners, fill=purple!15, minimum width=1.2cm, minimum height=0.6cm, font=\scriptsize},
    vtep/.style={draw, thick, fill=blue!20, minimum width=1.5cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[vm] (vm1) at (0,1.5) {VM A};
\node[vtep] (v1) at (0,0) {VTEP 1};
\node[vtep] (v2) at (8,0) {VTEP 2};
\node[vm2] (vm2) at (8,1.5) {VM B};

\draw[thick] (vm1) -- (v1);
\draw[thick] (vm2) -- (v2);
\draw[thick, dashed, blue] (v1) -- node[above, font=\scriptsize] {UDP tunnel over physical network} (v2);

\node[font=\tiny, text=gray] at (0,-0.8) {Encapsulates frame};
\node[font=\tiny, text=gray] at (8,-0.8) {Decapsulates frame};
\node[font=\tiny, text=gray] at (4,-0.5) {VNI identifies the virtual network};
\end{tikzpicture}
\end{center}

- VM A sends a frame $\rightarrow$ VTEP 1 wraps it in UDP with a VNI
- Travels over the physical network as a regular UDP packet
- VTEP 2 strips outer headers, delivers original frame to VM B
- VMs on the **same VNI** form an isolated L2 domain

## Overlay Benefits for Scalability

- **16 million virtual networks** (vs 4,096 VLANs)
- Physical network does not need to know about tenants
- VMs can **migrate** across hosts without reconfiguring the underlay
- Decouples **virtual topology** from physical topology

\vfill

\footnotesize
This is the foundation of cloud networking. In \textbf{Session 2} we will see how providers build \textbf{VPCs} (Virtual Private Clouds) on top of overlays.

Source: IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

# Session Summary

## Key Takeaways

1. **Data centers** house compute, accelerators (GPUs), storage, network, and facilities
2. Physical infrastructure is **rigid, underutilized, and slow to scale**
3. **Hypervisors** (Type 1 and 2) enable multiple VMs on one host
4. **Containers** are lighter than VMs but share the kernel (deep dive in Block 5)
5. Virtual networks mirror physical ones: **vNICs, vSwitches, vRouters**
6. **Multi-tenancy** requires isolation $\rightarrow$ VLANs, overlays, micro-segmentation
7. **VXLAN** extends VLANs from 4K to 16M networks using encapsulation

## Next Session: Preview

In **Session 2** we build on today's foundation:

- Virtualization is the technology; cloud is the **business model**
- NIST definition and **5 essential characteristics**
- Service models: **IaaS / PaaS / SaaS**
- **VPC** architecture: subnets, route tables, gateways
- Cloud security: **Security Groups + Network ACLs**
- Governance, **data sovereignty**, GDPR

## Discussion

\begin{center}
\Large\textit{You manage a data center with 5,000 tenants.\\Each tenant wants their own isolated network.\\Why can't you use VLANs alone?\\What would you use instead, and why?}
\end{center}

\vfill

<!-- nota: guiar hacia: 4096 VLAN limit, overlapping IPs, VXLAN con 16M VNIs, y la necesidad de desacoplar red virtual de física -->

Hints: VLAN ID limit, overlapping IP ranges, VM mobility.

## References

\footnotesize

1. Popek \& Goldberg, "Formal Requirements for Virtualizable Third Generation Architectures," *CACM*, vol. 17, no. 7, 1974.
2. Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.
3. VMware, "Understanding Full Virtualization, Paravirtualization, and Hardware Assist," 2007.
4. Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.
5. IEEE 802.1Q-2022, "Bridges and Bridged Networks."
6. IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
7. IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.
8. Barroso, Clidaras \& Hölzle, *The Datacenter as a Computer*, 3rd ed., Morgan \& Claypool, 2019.
9. NIST SP 800-125, "Guide to Security for Full Virtualization Technologies," 2011.
10. Kurose \& Ross, *Computer Networking: A Top-Down Approach*, 8th ed., Pearson, 2021.
11. Red Hat, "What is a Virtual Machine?", redhat.com/en/topics/virtualization/what-is-a-virtual-machine.
12. Red Hat, "Containers vs VMs," redhat.com/en/topics/containers/containers-vs-vms.
13. Cisco, "What Is a Data Center?", cisco.com/site/us/en/learn/topics/computing/what-is-a-data-center.html.
