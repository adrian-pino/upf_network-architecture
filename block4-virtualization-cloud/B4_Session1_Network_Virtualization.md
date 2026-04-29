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
  - \logo{\includegraphics[height=0.6cm]{img/upf-logo.png}}
  - \titlegraphic{\includegraphics[height=1.2cm]{img/upf-logo.png}\\[0.3cm]\scriptsize Adrián Pino \texttt{<adrian.pino@upf.edu>}}
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
Topics & Data centers & Cloud \& Container platforms \\
& VMs \& hypervisors & Overlay networks (VXLAN) \\
& VMs vs containers (overview) & NIST cloud definition \\
& vNICs, vSwitches, vRouters & IaaS / PaaS / SaaS \\
& Multi-tenancy \& VLANs & Security groups \& ACLs \\
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

\vspace{0.2cm}

- **2001**: VMware makes it possible to run **multiple systems on one machine**
  - Technology: **Virtual Machines (VMs)**

\vspace{0.2cm}

- **Mid-2000s**: enterprises consolidate servers (60--80\% utilization)

\vspace{0.2cm}

- **2006--2010**: Amazon, Google, and Microsoft start **renting computing capacity** online
  - Technology: **Cloud Computing** (AWS, Azure, GCP)

\vspace{0.2cm}

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

\vspace{0.2cm}

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
- A software layer called **hypervisor** divides the physical resources (CPU, RAM, disk, Network Interface Card (NIC)) into isolated **virtual machines (VMs)**
- Each VM gets its own share and believes it owns dedicated hardware

\vfill

\begin{center}
\Large
\textit{Why virtualize?}
\end{center}

\vspace{0.2cm}

- **Resource efficiency**: consolidate workloads instead of one app per server
- **Cost savings**: fewer servers, less power, cooling, and space
- **Flexibility**: create or destroy environments in minutes
- **Isolation**: VMs are independent; failures do not propagate

## Virtual Machines (VMs)

- A VM is an **isolated computing environment** with its own CPU, memory, network interface, and storage
- Runs a **full operating system** (Linux-based OSs such as Ubuntu, Windows, etc.)
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
    vmbox/.style={draw, thick, rounded corners, minimum width=2.5cm, minimum height=2.2cm},
    >=Stealth
]
\node[box, fill=gray!20, minimum width=7.8cm] (hw) at (0,0) {Physical Hardware (Host)};
\node[box, fill=blue!15, minimum width=7.8cm] (hyp) at (0,1.2) {Hypervisor / Host OS};
% VM 1
\node[vmbox, fill=green!15] (vm1) at (-2.6,3) {};
\node[font=\small] at (-2.6,2.2) {VM 1};
\node[box, fill=green!30, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (-2.6,2.8) {Guest OS 1};
\node[box, fill=red!15, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (-2.6,3.6) {App 1};
% VM 2
\node[vmbox, fill=purple!15] (vm2) at (0,3) {};
\node[font=\small] at (0,2.2) {VM 2};
\node[box, fill=purple!25, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (0,2.8) {Guest OS 2};
\node[box, fill=teal!15, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (0,3.6) {App 2};
% VM 3
\node[vmbox, fill=orange!15] (vm3) at (2.6,3) {};
\node[font=\small] at (2.6,2.2) {VM 3};
\node[box, fill=orange!25, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (2.6,2.8) {Guest OS 3};
\node[box, fill=olive!15, minimum width=2cm, minimum height=0.6cm, font=\scriptsize] at (2.6,3.6) {App 3};
\end{tikzpicture}
\end{center}

- **Host**: physical machine providing CPU, RAM, disk, NIC
- **Guest**: virtual machine running its own OS on the host
- Each guest believes it has **dedicated hardware** (abstraction)

## Hypervisors: The Key Enabler

- A **hypervisor** manages and allocates physical resources to VMs
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
Examples & VMware ESXi, KVM (Kernel-based VM) & VirtualBox, VMware Workstation \\
\hline
\end{tabular}
\end{center}

\footnotesize Source: Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.

## Hypervisors Type 1 vs Type 2: Visual Comparison

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2.5cm, minimum height=0.7cm, font=\scriptsize},
    vmbox/.style={draw, thick, rounded corners, minimum width=2.7cm, minimum height=1.8cm, font=\scriptsize},
    >=Stealth
]
% Type 1
\node[font=\small\bfseries] at (-3.5,4.2) {Type 1 (Bare-metal)};
\node[box, fill=gray!20, minimum width=5.8cm] (hw1) at (-3.5,0) {Hardware};
\node[box, fill=blue!25, minimum width=5.8cm] (hyp1) at (-3.5,1) {Hypervisor};
\node[vmbox, fill=green!15] (vm1a) at (-5,2.5) {};
\node[font=\scriptsize] at (-5,2.1) {VM 1};
\node[box, fill=red!15, minimum width=2.1cm] (a1a) at (-5,2.9) {App};
\node[vmbox, fill=purple!15] (vm1b) at (-2,2.5) {};
\node[font=\scriptsize] at (-2,2.1) {VM 2};
\node[box, fill=red!15, minimum width=2.1cm] (a1b) at (-2,2.9) {App};

% Type 2
\node[font=\small\bfseries] at (3.5,5.2) {Type 2 (Hosted)};
\node[box, fill=gray!20, minimum width=5.8cm] (hw2) at (3.5,0) {Hardware};
\node[box, fill=yellow!15, minimum width=5.8cm] (os2) at (3.5,1) {Host OS};
\node[box, fill=blue!25, minimum width=5.8cm] (hyp2) at (3.5,2) {Hypervisor};
\node[vmbox, fill=green!15] (vm2a) at (2,3.5) {};
\node[font=\scriptsize] at (2,3.1) {VM 1};
\node[box, fill=red!15, minimum width=2.1cm] (a2a) at (2,3.9) {App};
\node[vmbox, fill=purple!15] (vm2b) at (5,3.5) {};
\node[font=\scriptsize] at (5,3.1) {VM 2};
\node[box, fill=red!15, minimum width=2.1cm] (a2b) at (5,3.9) {App};
\end{tikzpicture}
\end{center}

- Type 1: hypervisor runs **directly on hardware** (no host OS) $\rightarrow$ less overhead (faster)
- Type 2: hypervisor runs **on top of a host OS** $\rightarrow$ easier to set up

## Discussion: Virtualization Concepts

\begin{center}
\Large\textit{You want to learn about virtualization at home.\\Would you install a Type 1 or a Type 2 hypervisor?\\What if you were setting up a production server?}
\end{center}

\vfill

Hints: Type 2 runs on your existing OS (easy to try); Type 1 replaces the OS entirely (better performance, but dedicated hardware).

<!-- nota: la mayoría elegirán Type 2 para aprender (VirtualBox) y Type 1 para producción (ESXi, KVM). Refuerza la diferencia práctica -->

# VMs vs Containers

## What Is a Container?

- A **container** is a lightweight, isolated environment that runs an application
- Unlike a VM, it does **not** include a full operating system
  - It shares the **host's kernel** and only packages the app + its dependencies

\vspace{0.3cm}

- Key characteristics:
  - **Fast**: starts in seconds (no OS to boot)
  - **Small**: measured in MBs, not GBs
  - **Portable**: same container runs identically on any machine with a container runtime
  - **Ephemeral**: designed to be created, destroyed, and replaced quickly

\vfill

\footnotesize
The most popular container engine is **Docker** (2013). Container orchestration (managing thousands of containers) is handled by **Kubernetes** (2014). Deep dive in \textbf{Block 5}.

## Containers Share the Same... Kernel?

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2.8cm, minimum height=1cm, font=\scriptsize, align=center},
    cmd/.style={font=\scriptsize\ttfamily},
    lbl/.style={font=\scriptsize\bfseries, align=center},
    >=Stealth
]
% Containers
\node[lbl] at (-4.5,4.5) {Container A\\(Ubuntu)};
\node[lbl] at (0,4.5) {Container B\\(Alpine)};
\node[lbl] at (4.5,4.5) {Container C\\(Debian)};

\node[cmd] at (-4.5,3.5) {cat dog.txt};
\node[cmd] at (0,3.5) {ls /home};
\node[cmd] at (4.5,3.5) {ps aux};

% Lines down
\draw[thick] (-4.5,3.2) -- (-4.5,2.0);
\draw[thick] (0,3.2) -- (0,2.0);
\draw[thick] (4.5,3.2) -- (4.5,2.0);

% Merge point
\draw[thick] (-4.5,2.0) -- (0,2.0);
\draw[thick] (4.5,2.0) -- (0,2.0);
\draw[->, thick] (0,2.0) -- (0,1.5);

\node[font=\scriptsize, text=gray, anchor=west] at (1.0,1.7) {(all are just syscalls!)};

% Kernel
\node[box, fill=blue!15, minimum width=5cm] (kernel) at (0,0.7) {Linux Kernel\\\textit{"ok, I'll handle it"}};

% Hardware
\draw[->, thick] (0,-0.1) -- (0,-0.6);
\node[box, fill=gray!20, minimum width=5cm] (hw) at (0,-1.4) {Hardware / Infrastructure \\(Disk, CPU, RAM)};
\end{tikzpicture}
\end{center}

\vfill

\footnotesize
- Every command inside any container is a **syscall** to the one shared kernel.
- The kernel uses **linux namespaces** to ensure each container only sees its own files, processes, and network.

## VMs vs Containers: Overview

:::::::::::::: {.columns}
::: {.column width="50%"}
**Virtual Machines**

- Include a **full guest OS** per instance
\vspace{0.2cm}
- Size: **GBs** (OS + app + dependencies)
\vspace{0.2cm}
- Boot time: usually **minutes**
\vspace{0.2cm}
- Each VM has its own kernel; a compromised VM cannot affect others
\vspace{0.2cm}
- Can run **different operating systems**

:::
::: {.column width="50%"}
**Containers**

- **No guest OS**; share the host kernel
\vspace{0.2cm}
- Size: **MBs** (app + dependencies only)
\vspace{0.2cm}
- Boot time: usually **seconds**
\vspace{0.2cm}
- Shared kernel means a kernel vulnerability can affect all containers
\vspace{0.2cm}
- No hypervisor needed to run. Instead a container engine/runtime is required

:::
::::::::::::::

\vfill
\footnotesize
Reminder: OS = Kernel + userspace (libraries, tools, shell, etc.). Deep dive into container internals and networking in \textbf{Block 5}.

## VMs vs Containers: Visual Comparison

\begin{center}
\includegraphics[width=0.6\textwidth]{img/vm-vs-container.png}
\end{center}

\footnotesize
- Containers share the same Kernel
- **Bins/Libs** = binaries and libraries: the dependencies each app needs to run (e.g., Python, OpenSSL, libc).

\vfill
\footnotesize Source: Aqueduct Technologies, "Containers and Virtual Machines," aqueducttech.com.

## When to Use VMs vs Containers

- **Use VMs when** the app requires it:
  - Needs a **different OS** than the host (e.g., Windows app on a Linux host)
  - Requires **strong tenant isolation** (e.g., multi-tenant cloud)
  - **Legacy software** tied to a specific OS version

\vspace{0.3cm}

- **Use containers when** the app allows it:
  - Cloud-native or **microservices** applications
  - Need for **fast scaling** (seconds, not minutes)
  - **CI/CD (Continuous Integration / Continuous Deployment) pipelines**: build, test, deploy in identical environments

\vspace{0.3cm}

- **Evolution**: infrastructure has evolved from pure VMs to today's hybrid VM+container model
  - Most new applications are designed for containers
  - VMs remain for legacy workloads and strong isolation
  - The future points toward a **container-first** approach, where VMs become the exception

## Discussion: Virtualization

\begin{center}
\Large\textit{You need to deploy 200 instances of the same web application\\that must scale up and down every few minutes.\\Would you use VMs, containers, or both? Why?}
\end{center}

\vfill

Hints: boot time, resource overhead, isolation needs, how fast you need to scale.

<!-- nota: no hay una respuesta única correcta — la clave es que razonen sobre los trade-offs -->

# Virtual Networking

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
NIC (network interface card) & \textbf{Virtual NIC} (vNIC) \\
\hline
Switch & \textbf{Virtual Switch} (bridge) \\
\hline
Router & \textbf{Virtual Router} \\
\hline
Cable & Internal software path \\
\hline
\end{tabular}
\end{center}

\vfill
\footnotesize
\textbf{Note:} This section focuses on VMs. Containers follow similar principles (Block 5).

## Virtual NIC, Virtual Switch, Virtual Router

- **Virtual NIC (vNIC)**: software-emulated network interface card
  - Has its own **MAC address** (assigned by the hypervisor) and **IP address**
  - From the guest's perspective, behaves exactly like a real NIC

\vspace{0.3cm}

- **Virtual Switch**: connects VMs at **L2** (same subnet)
  - Ranges from simple (Linux bridge) to programmable (Open vSwitch)
  - We will explore SDN-based switches in Block 5

\vspace{0.3cm}

- **Virtual Router**: forwards traffic between **different subnets** (L3)
  - Acts as **default gateway** for VMs
  - Can apply **NAT** for external access

\vfill

\footnotesize
Same MAC/IP/NAT concepts from Blocks 1--3, now virtualized inside the hypervisor.

## Physical vs Virtual: Side by Side (Same Network)

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.4cm, minimum height=0.6cm, font=\scriptsize},
    lbl/.style={font=\scriptsize\bfseries},
    >=Stealth
]
% Physical side
\node[lbl] at (-4,3.8) {Physical Network};
\node[draw, thick, rounded corners, fill=green!15, minimum width=2cm, minimum height=1.2cm] (srv1) at (-5.5,2.6) {};
\node[font=\scriptsize] at (-5.5,2.95) {Server 1};
\node[box, fill=orange!15, minimum width=1.4cm] (nic1) at (-5.5,2.35) {NIC};
\node[draw, thick, rounded corners, fill=purple!15, minimum width=2cm, minimum height=1.2cm] (srv2) at (-2.5,2.6) {};
\node[font=\scriptsize] at (-2.5,2.95) {Server 2};
\node[box, fill=orange!15, minimum width=1.4cm] (nic2) at (-2.5,2.35) {NIC};
\node[box, fill=blue!20, minimum width=4cm] (psw) at (-4,0.6) {Physical Switch};
\draw[thick] (nic1) -- (-5.5,0.9);
\draw[thick] (nic2) -- (-2.5,0.9);

% Virtual side
\node[draw, thick, rounded corners, fill=gray!5, minimum width=6.5cm, minimum height=4cm] (host) at (4,1.8) {};
\node[lbl] at (4,3.6) {Server / Host};
\node[draw, thick, rounded corners, fill=green!15, minimum width=2cm, minimum height=1.2cm] (vm1) at (2.8,2.6) {};
\node[font=\scriptsize] at (2.8,2.95) {VM 1};
\node[box, fill=orange!15, minimum width=1.4cm] (vnic1) at (2.8,2.35) {Virtual NIC};
\node[draw, thick, rounded corners, fill=purple!15, minimum width=2cm, minimum height=1.2cm] (vm2) at (5.2,2.6) {};
\node[font=\scriptsize] at (5.2,2.95) {VM 2};
\node[box, fill=orange!15, minimum width=1.4cm] (vnic2) at (5.2,2.35) {Virtual NIC};
\node[box, fill=blue!20, minimum width=4cm] (vsw) at (4,0.6) {Virtual Switch};
\draw[thick] (vnic1) -- (2.8,0.9);
\draw[thick] (vnic2) -- (5.2,0.9);
\end{tikzpicture}
\end{center}

- Left: two physical servers connected by a physical switch and cables
- Right: two VMs connected by a virtual switch, all inside **one physical host**

## Physical vs Virtual: Side by Side (Different Networks)

\begin{center}
\begin{tikzpicture}[scale=0.65, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=1.4cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize\bfseries},
    >=Stealth
]
% --- Physical (top) ---
\node[lbl] at (0,5.8) {Physical world};

% Location A
\node[draw, thick, dashed, rounded corners, inner sep=8pt, fit={(-6.5,1.8)(-2.8,5.2)}, label=above:{\scriptsize Location A (10.0.1.0/24)}] {};
\node[draw, thick, rounded corners, fill=green!15, minimum width=2.4cm, minimum height=1.2cm] (srv1) at (-5.5,4.2) {};
\node[font=\scriptsize] at (-5.5,4.55) {Server 1};
\node[box, fill=orange!15, minimum width=1.8cm] (nic1) at (-5.5,3.95) {NIC};
\node[box, fill=blue!20, minimum width=2.8cm] (sw1) at (-4.6,2.4) {Switch A};
\draw[thick] (nic1) -- (-5.5,2.7);

% Location B
\node[draw, thick, dashed, rounded corners, inner sep=8pt, fit={(2.8,1.8)(6.5,5.2)}, label=above:{\scriptsize Location B (10.0.2.0/24)}] {};
\node[draw, thick, rounded corners, fill=purple!15, minimum width=2.4cm, minimum height=1.2cm] (srv2) at (5.5,4.2) {};
\node[font=\scriptsize] at (5.5,4.55) {Server 2};
\node[box, fill=orange!15, minimum width=1.8cm] (nic2) at (5.5,3.95) {NIC};
\node[box, fill=blue!20, minimum width=2.8cm] (sw2) at (4.6,2.4) {Switch B};
\draw[thick] (nic2) -- (5.5,2.7);

% Router
\node[box, fill=yellow!20, minimum width=1.8cm] (rtr) at (0,2.4) {Router};
\draw[thick] (sw1) -- (rtr);
\draw[thick] (rtr) -- (sw2);

% --- Virtual (bottom) ---
\node[lbl] at (0,-0.2) {Virtual world};

\node[draw, thick, rounded corners, fill=gray!5, minimum width=12cm, minimum height=3.2cm] (host) at (0,-2.5) {};
\node[lbl, font=\scriptsize] at (0,-1.1) {Server / Host};

% VM 1 with Virtual NIC inside
\node[draw, thick, rounded corners, fill=green!15, minimum width=2.4cm, minimum height=1.2cm] (vm1) at (-4,-1.9) {};
\node[font=\scriptsize] at (-4,-1.55) {VM 1};
\node[box, fill=orange!15, minimum width=1.8cm] (vnic1) at (-4,-2.25) {Virtual NIC};

% VM 2 with Virtual NIC inside
\node[draw, thick, rounded corners, fill=purple!15, minimum width=2.4cm, minimum height=1.2cm] (vm2) at (4,-1.9) {};
\node[font=\scriptsize] at (4,-1.55) {VM 2};
\node[box, fill=orange!15, minimum width=1.8cm] (vnic2) at (4,-2.25) {Virtual NIC};

\node[box, fill=blue!20, minimum width=2.8cm] (vbr1) at (-4,-3.3) {Virtual Switch 1};
\draw[thick] (vnic1) -- (-4,-3.05);

\node[box, fill=blue!20, minimum width=2.8cm] (vbr2) at (4,-3.3) {Virtual Switch 2};
\draw[thick] (vnic2) -- (4,-3.05);

\node[box, fill=yellow!20, minimum width=1.8cm] (vrtr) at (0,-3.3) {Virtual Router};
\draw[thick] (vbr1) -- (vrtr);
\draw[thick] (vrtr) -- (vbr2);
\end{tikzpicture}
\end{center}

\footnotesize
Different subnets $\rightarrow$ router needed (Layer 3). Physical uses hardware; virtual uses software inside one host.

## Example: VM-to-VM Communication

- The hypervisor creates a **bridge** (a virtual switch) to connect VMs
- VMs on the same bridge share a subnet: frames forwarded by MAC address

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=8cm, minimum height=5.2cm] (host) at (0,2.2) {};
\node[font=\scriptsize\bfseries] at (0,4.4) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-2.5,3.8) {VM 1};
\node[box, fill=purple!15] (vm2) at (2.5,3.8) {VM 2};
\node[lbl] at (-2.5,3.3) {`eth0`: 192.168.1.10};
\node[lbl] at (2.5,3.3) {`eth0`: 192.168.1.20};
\node[box, fill=blue!20, minimum width=6cm] (br) at (0,2.4) {bridge-1 (virtual switch)};
\node[box, fill=yellow!20] (rtr) at (0,1.4) {Virtual Router / NAT};
\node[box, fill=orange!15] (pnic) at (0,-0.4) {Physical NIC};
\draw[thick] (-2.5,3.0) -- (-2.5,2.7);
\draw[thick] (2.5,3.0) -- (2.5,2.7);
\draw[thick] (0,2.1) -- (0,1.7);
\draw[thick] (0,1.1) -- (0,-0.15);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.6) {Internet};
\draw[thick] (pnic) -- (inet);
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
How does VM 1 reach VM 2? And how does it reach the Internet?

\vspace{0.1cm}
\tiny In Linux, a bridge is named \texttt{br0}, \texttt{br1}, etc. We use \texttt{bridge-1} for clarity.

## Example: VM-to-VM Communication (Solution)

- Same subnet, same bridge $\rightarrow$ **Layer 2 (L2) forwarding** (no routing needed)

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=8cm, minimum height=5.2cm] (host) at (0,2.2) {};
\node[font=\scriptsize\bfseries] at (0,4.4) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-2.5,3.8) {VM 1};
\node[box, fill=purple!15] (vm2) at (2.5,3.8) {VM 2};
\node[lbl] at (-2.5,3.3) {`eth0`: 192.168.1.10};
\node[lbl] at (2.5,3.3) {`eth0`: 192.168.1.20};
\node[box, fill=blue!20, minimum width=6cm] (br) at (0,2.4) {bridge-1 (virtual switch)};
\node[box, fill=yellow!20] (rtr) at (0,1.4) {Virtual Router / NAT};
\node[box, fill=orange!15] (pnic) at (0,-0.4) {Physical NIC};
\draw[thick] (-2.5,3.0) -- (-2.5,2.7);
\draw[thick] (2.5,3.0) -- (2.5,2.7);
\draw[thick] (0,2.1) -- (0,1.7);
\draw[thick] (0,1.1) -- (0,-0.15);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.6) {Internet};
\draw[thick] (pnic) -- (inet);
\draw[->, thick, dashed, red!60] (-2.5,3.0) -- (-2.5,2.7) -- (2.5,2.7) -- (2.5,3.0);
\node[font=\tiny, text=red!60] at (0,2.9) {VM-to-VM (L2)};
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
Both VMs share bridge-1: it forwards frames by MAC address, just like a physical switch. No routing needed.

## Example: VMs on Different Subnets

- Now VMs are on **different subnets**: they need Layer 3 (L3) routing
- Two bridges (`bridge-1`, `bridge-2`), each with its own subnet
- Linux can act as a **virtual router** by default: no extra software needed

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=10cm, minimum height=4.8cm] (host) at (0,1.8) {};
\node[font=\scriptsize\bfseries] at (0,3.8) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-3,3.3) {VM 1};
\node[box, fill=purple!15] (vm2) at (3,3.3) {VM 2};
\node[lbl] at (-3,2.8) {`10.0.1.10/24`};
\node[lbl] at (3,2.8) {`10.0.2.20/24`};
\node[box, fill=blue!20, minimum width=3cm] (br1) at (-3,1.8) {bridge-1};
\node[box, fill=blue!20, minimum width=3cm] (br2) at (3,1.8) {bridge-2};
\node[lbl] at (-3,1.3) {`10.0.1.1`};
\node[lbl] at (3,1.3) {`10.0.2.1`};
\node[box, fill=yellow!20, minimum width=2cm] (rtr) at (0,0.8) {Virtual Router};
\node[box, fill=orange!15] (pnic) at (0,-0.6) {Physical NIC};
\draw[thick] (-3,2.5) -- (-3,2.1);
\draw[thick] (3,2.5) -- (3,2.1);
\draw[thick] (-1.5,1.8) -- (-0.8,1.1);
\draw[thick] (1.5,1.8) -- (0.8,1.1);
\draw[thick] (0,0.5) -- (0,-0.35);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.8) {Internet};
\draw[thick] (pnic) -- (inet);
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
How does VM 1 (10.0.1.10) reach VM 2 (10.0.2.20)? What components are involved?

## Example: VMs on Different Subnets (Solution)

- Different subnets $\rightarrow$ traffic must go through the **virtual router** (L3 forwarding)

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    lbl/.style={font=\scriptsize},
    >=Stealth
]
\node[draw, thick, rounded corners, fill=gray!5, minimum width=10cm, minimum height=4.8cm] (host) at (0,1.8) {};
\node[font=\scriptsize\bfseries] at (0,3.8) {Host (Linux)};
\node[box, fill=green!15] (vm1) at (-3,3.3) {VM 1};
\node[box, fill=purple!15] (vm2) at (3,3.3) {VM 2};
\node[lbl] at (-3,2.8) {`10.0.1.10/24`};
\node[lbl] at (3,2.8) {`10.0.2.20/24`};
\node[box, fill=blue!20, minimum width=3cm] (br1) at (-3,1.8) {bridge-1};
\node[box, fill=blue!20, minimum width=3cm] (br2) at (3,1.8) {bridge-2};
\node[lbl] at (-3,1.3) {`10.0.1.1`};
\node[lbl] at (3,1.3) {`10.0.2.1`};
\node[box, fill=yellow!20, minimum width=2cm] (rtr) at (0,0.8) {Virtual Router};
\node[box, fill=orange!15] (pnic) at (0,-0.6) {Physical NIC};
\draw[thick] (-3,2.5) -- (-3,2.1);
\draw[thick] (3,2.5) -- (3,2.1);
\draw[thick] (-1.5,1.8) -- (-0.8,1.1);
\draw[thick] (1.5,1.8) -- (0.8,1.1);
\draw[thick] (0,0.5) -- (0,-0.35);
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.2cm, minimum height=1cm, font=\scriptsize] (inet) at (0,-1.8) {Internet};
\draw[thick] (pnic) -- (inet);
\draw[->, thick, dashed, red!60] (-3,3.0) -- (-3,2.1) -- (-0.8,1.1) -- (0,0.8) -- (0.8,1.1) -- (3,2.1) -- (3,3.0);
\node[font=\tiny, text=red!60] at (0,0.4) {VM-to-VM (L3)};
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
Each VM has a default gateway pointing to its bridge IP. The host routes packets between subnets, just like a physical router.

## VM Networking Modes

How does a VM connect to the outside world? Three modes:

\vspace{0.2cm}

1. **NAT** (most common): VM hides behind the host's IP
   - VM can reach the Internet, but the Internet cannot reach the VM
   - Same NAT concept from Block 3, now applied by the hypervisor

\vspace{0.2cm}

2. **Bridged**: VM appears directly on the physical network
   - Same subnet as the host; gets its own IP from the network

\vspace{0.2cm}

3. **Host-only**: VM can only talk to the host
   - Completely isolated from external networks; useful for testing

\vfill

\footnotesize
NAT is the default in most hypervisors (VirtualBox, VMware, KVM). Bridged and Host-only exist for specific use cases.

In Session 2 we will see how cloud providers offer NAT as a \textbf{managed service} (NAT Gateway).

## Packet Flow: Virtual to Physical

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.7cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15] (vm) at (0,0) {VM};
\node[box, fill=green!10] (vnic) at (2.5,0) {Virtual\\NIC};
\node[box, fill=blue!15] (vsw) at (5,0) {Virtual\\Switch};
\node[box, fill=yellow!20] (vr) at (7.5,0) {Virtual\\Router};
\node[box, fill=orange!15] (pnic) at (10,0) {Physical\\NIC};
\node[box, fill=cyan!10] (ext) at (12.5,0) {External\\Networks};

\draw[->, thick] (vm) -- (vnic);
\draw[->, thick] (vnic) -- (vsw);
\draw[->, thick] (vsw) -- (vr);
\draw[->, thick] (vr) -- (pnic);
\draw[->, thick] (pnic) -- (ext);

\node[font=\tiny, text=gray] at (12.5,-0.7) {(e.g. Internet)};
\end{tikzpicture}
\end{center}

1. VM generates packet with **virtual MAC/IP** as source
2. Virtual NIC passes frame to **Virtual Switch** (L2 forwarding)
3. If destination is another subnet $\rightarrow$ **Virtual Router** (L3 forwarding)
4. Virtual Router may apply **NAT** (replace private IP with host IP)
5. Frame exits through **Physical NIC** to external networks

## Discussion: Virtual Networking

\begin{center}
\Large\textit{Two VMs on the same host want to communicate.\\Does their traffic ever leave the physical machine?\\What if they are on different subnets?}
\end{center}

\vfill

Hints: Virtual Switch handles same-subnet traffic locally; Virtual Router needed for different subnets; traffic may still stay inside the host.

<!-- nota: esta pregunta refuerza la diferencia entre L2 (vSwitch) y L3 (virtual router), y que el tráfico intra-host no pasa por la red física -->

# Network Isolation and Multi-Tenancy

## The Problem: Shared Infrastructure, Private Data

- Cloud platforms host workloads from **multiple tenants** (users, departments, companies)

- All tenants share the same physical servers, switches, and cabling

- But each tenant expects:
  - **Security**: you cannot see or access my data
  - **Performance**: my traffic is not affected by yours
  - **Address independence**: we can both use `10.0.0.0/24` without conflicts

\vfill

Cloud platforms solve this with **three layers of isolation**:

1. **VLANs**: separate traffic at the switch level (L2)
2. **Overlay networks**: encapsulate tenant traffic over the shared physical network (L2/L3)
3. **Micro-segmentation**: per-VM firewall rules via Security Groups and Access Control Lists (ACLs) (L3/L4)

We will explore overlay networks and cloud security in detail in **Session 2**.

## Layer 1: VLANs (What You Already Know)

- Same VLAN concept from Block 3, now applied to **virtual switches**

- Hypervisors assign VMs to specific VLANs via virtual switch port groups

- Traffic tagged with VLAN IDs $\rightarrow$ tenants separated at **L2**

\vfill

**But there is a problem:**

- VLAN ID field is 12 bits $\rightarrow$ max **4,096 VLANs**

- A large data center may have **tens of thousands** of tenants

- VLANs also do not support **overlapping IP ranges** across tenants

\vfill
\footnotesize Source: IEEE 802.1Q-2022, "Bridges and Bridged Networks."

## Layer 2: Overlay Networks

- Solution to the VLAN limit: **overlay networks** (e.g., Virtual Extensible LAN, or VXLAN)
  - Encapsulate tenant frames inside UDP packets over the physical network
  - 24-bit ID $\rightarrow$ up to **16 million** isolated networks

\vspace{0.3cm}

- Each tenant gets a fully isolated virtual network:
  - Own IP address space, subnets, and routing

\vfill

\footnotesize
Deep dive into VXLAN and overlay architecture in \textbf{Session 2}.

## Layer 3: Micro-Segmentation

- VLANs and overlays isolate **networks**; micro-segmentation isolates **individual VMs**

- Goal: **least privilege**; each VM should only reach what it strictly needs

- Key concept in modern **zero trust** security architectures

\vfill

Cloud platforms implement this with two mechanisms:

- **Security Groups**: firewall rules attached to each VM instance

- **Network ACLs**: firewall rules applied at the subnet level

\vfill

\footnotesize
Deep dive into Security Groups and Network ACLs in \textbf{Session 2}.

## Isolation: The Full Picture

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Layer} & \textbf{Mechanism} & \textbf{Scope} \\
\hline
L2 & \textbf{VLANs} (802.1Q) & Separate traffic at the switch level (max 4K) \\
\hline
L2/L3 & \textbf{Overlays} (VXLAN) & Encapsulate tenant traffic (up to 16M networks) \\
\hline
L3/L4 & \textbf{Security Groups / ACLs} & Per-VM and per-subnet firewall rules \\
\hline
\end{tabular}
\end{center}

\vfill

\footnotesize
Each layer adds isolation on top of the previous one. Today we covered VLANs in depth; overlays and security groups are the focus of \textbf{Session 2}.

## Discussion: Network Isolation

\begin{center}
\Large\textit{You manage a cloud platform with 5,000 tenants.\\Each tenant wants their own isolated network.\\Can you use VLANs alone? Why or why not?}
\end{center}

\vfill

Hints: think about the VLAN ID limit (4,096), overlapping IP ranges, and what happens when VMs move between hosts.

<!-- nota: guiar hacia el límite de 4096 VLANs y la necesidad de algo más escalable — se verá en Session 2 con overlays -->

# Session Summary

## Key Takeaways

1. **Data centers** house compute, accelerators (GPUs), storage, network, and facilities

2. Physical infrastructure is **rigid, underutilized, and slow to scale**

3. **Hypervisors** (Type 1 and 2) enable multiple VMs on one host

4. **Containers** are lighter than VMs but share the kernel (deep dive in Block 5)

5. Virtual networks mirror physical ones: **vNICs, vSwitches, vRouters**

6. **Multi-tenancy** requires isolation $\rightarrow$ VLANs and micro-segmentation

## References

\footnotesize

1. Popek \& Goldberg, "Formal Requirements for Virtualizable Third Generation Architectures," *CACM*, vol. 17, no. 7, 1974.
2. Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.
3. VMware, "Understanding Full Virtualization, Paravirtualization, and Hardware Assist," 2007.
4. Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.
5. IEEE 802.1Q-2022, "Bridges and Bridged Networks."
6. Barroso, Clidaras \& Hölzle, \textit{The Datacenter as a Computer}, 3rd ed., Morgan \& Claypool, 2019.
7. NIST SP 800-125, "Guide to Security for Full Virtualization Technologies," 2011.
8. Kurose \& Ross, \textit{Computer Networking: A Top-Down Approach}, 8th ed., Pearson, 2021.
9. Red Hat, "What is a Virtual Machine?", redhat.com/en/topics/virtualization/what-is-a-virtual-machine.
10. Red Hat, "Containers vs VMs," redhat.com/en/topics/containers/containers-vs-vms.
11. Cisco, "What Is a Data Center?", cisco.com/site/us/en/learn/topics/computing/what-is-a-data-center.html.
