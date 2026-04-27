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
  - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, fit}
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
\begin{tabular}{lll}
\toprule
& \textbf{Session 1 (today)} & \textbf{Session 2} \\
\midrule
Theme & \textit{The infrastructure} & \textit{The business model} \\
\midrule
Topics & Data centers & From virtualization to cloud \\
& VMs \& hypervisors & NIST cloud definition \\
& VMs vs containers (overview) & IaaS / PaaS / SaaS \\
& vNICs, vSwitches, vRouters & VPC architecture \\
& Multi-tenancy \& VLANs & Security groups \& ACLs \\
& Overlay networks (VXLAN) & Governance \& GDPR \\
\bottomrule
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
\includegraphics[width=0.75\textwidth]{img/datacenter.jpg}
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

- Traditional model: **one server = one application**
- Typical server utilization: only **10--15\%** of capacity
- Adding capacity means buying, racking, cabling $\rightarrow$ **weeks or months**
- Hardware failure takes down the entire service
- No way to scale down when demand drops

\vfill

\footnotesize
Key insight: most servers sit idle most of the time. We are paying for hardware we barely use.

<!-- nota: preguntar a los alumnos cuántos servidores creen que tiene Google (~1M+). AWS tiene data centers en ~30 regiones -->

## From Waste to Efficiency: Consolidation

- **Consolidation** = run multiple workloads on fewer physical machines
- Benefits:
  - Higher utilization: **60--80\%** instead of 10--15\%
  - Lower energy, cooling, and physical space costs
  - Simpler infrastructure management
- Trade-off: shared hardware requires **strong isolation** between workloads
- The enabling technology? **Virtualization**

\vfill

\footnotesize
Analogy: instead of one person per house, we build apartment buildings. Shared structure, private spaces.

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
\textit{Virtualization began in the 1960s as a technology for time-sharing\\on mainframe computers. It gained popularity in the 2000s as\\organizations looked for ways to make the most of their computing resources.}
\end{center}

\footnotesize Source: Red Hat, \textit{What is a Virtual Machine?}, redhat.com.

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
\node[box, fill=gray!20] (hw) at (0,0) {Physical Hardware (Host)};
\node[box, fill=blue!15] (hyp) at (0,1.2) {Hypervisor / Host OS};
\node[box, fill=green!15] (g1) at (-2.5,2.4) {Guest OS 1};
\node[box, fill=green!15] (g2) at (0,2.4) {Guest OS 2};
\node[box, fill=green!15] (g3) at (2.5,2.4) {Guest OS 3};
\node[box, fill=orange!15] (a1) at (-2.5,3.6) {App A};
\node[box, fill=orange!15] (a2) at (0,3.6) {App B};
\node[box, fill=orange!15] (a3) at (2.5,3.6) {App C};
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
\begin{tabular}{lll}
\toprule
& \textbf{Type 1 (Bare-metal)} & \textbf{Type 2 (Hosted)} \\
\midrule
Runs on & Directly on hardware & On top of a host OS \\
Performance & Near-native & Some overhead \\
Use case & Data centers, production & Development, testing \\
Examples & VMware ESXi, KVM, Hyper-V & VirtualBox, VMware Workstation \\
\bottomrule
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
\node[font=\small\bfseries] at (-3.5,4) {Type 1 (Bare-metal)};
\node[box, fill=gray!20] (hw1) at (-3.5,0) {Hardware};
\node[box, fill=blue!25] (hyp1) at (-3.5,1) {Hypervisor};
\node[box, fill=green!15] (vm1a) at (-4.8,2) {VM 1};
\node[box, fill=green!15] (vm1b) at (-2.2,2) {VM 2};
\node[box, fill=orange!15] (a1a) at (-4.8,3) {App};
\node[box, fill=orange!15] (a1b) at (-2.2,3) {App};

% Type 2
\node[font=\small\bfseries] at (3.5,4) {Type 2 (Hosted)};
\node[box, fill=gray!20] (hw2) at (3.5,0) {Hardware};
\node[box, fill=yellow!15] (os2) at (3.5,1) {Host OS};
\node[box, fill=blue!25] (hyp2) at (3.5,2) {Hypervisor};
\node[box, fill=green!15] (vm2a) at (2.2,3) {VM 1};
\node[box, fill=green!15] (vm2b) at (4.8,3) {VM 2};
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
\begin{tabular}{ll}
\toprule
\textbf{Physical} & \textbf{Virtual equivalent} \\
\midrule
NIC (network interface card) & \textbf{vNIC} (virtual NIC) \\
Switch & \textbf{vSwitch} (virtual switch) \\
Router & \textbf{vRouter} (virtual router) \\
Cable & Internal software path \\
\bottomrule
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
\node[box, fill=green!15] (srv2) at (-2.5,2.8) {Server 2};
\node[box, fill=orange!15] (nic1) at (-5.5,1.8) {NIC};
\node[box, fill=orange!15] (nic2) at (-2.5,1.8) {NIC};
\node[box, fill=blue!20, minimum width=4cm] (psw) at (-4,0.6) {Physical Switch};
\draw[thick] (srv1) -- (nic1);
\draw[thick] (srv2) -- (nic2);
\draw[thick] (nic1) -- (-5.5,0.9);
\draw[thick] (nic2) -- (-2.5,0.9);

% Virtual side
\node[lbl] at (4,3.8) {Virtual Network (inside one host)};
\node[box, fill=green!15] (vm1) at (2.5,2.8) {VM 1};
\node[box, fill=green!15] (vm2) at (5.5,2.8) {VM 2};
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

## Virtual Switching

\begin{center}
\begin{tikzpicture}[
    vm/.style={draw, thick, rounded corners, fill=green!15, minimum width=1.5cm, minimum height=0.8cm, font=\scriptsize},
    sw/.style={draw, thick, fill=blue!20, minimum width=5cm, minimum height=0.8cm, font=\small},
    nic/.style={draw, thick, fill=orange!10, minimum width=1.2cm, minimum height=0.5cm, font=\tiny},
    >=Stealth
]
\node[sw] (vsw) at (0,0) {Virtual Switch (vSwitch)};
\node[vm] (vm1) at (-3,1.5) {VM 1};
\node[vm] (vm2) at (-1,1.5) {VM 2};
\node[vm] (vm3) at (1,1.5) {VM 3};
\node[vm] (vm4) at (3,1.5) {VM 4};
\node[nic] (pnic) at (0,-1.5) {Physical NIC};

\draw[thick] (vm1) -- (-3,0.4);
\draw[thick] (vm2) -- (-1,0.4);
\draw[thick] (vm3) -- (1,0.4);
\draw[thick] (vm4) -- (3,0.4);
\draw[thick, <->] (vsw) -- node[right, font=\tiny] {uplink} (pnic);
\end{tikzpicture}
\end{center}

- Connects VMs on the same host, works like a **physical L2 switch**
- Maintains **MAC address table**, forwards frames by destination MAC
- Connected to physical NIC via **uplink** for external traffic

## Types of Virtual Switches

- **Standard vSwitch**: basic, built into the hypervisor
- **Distributed vSwitch**: spans multiple hosts, centralized management
- **Open vSwitch (OVS)**: open source, programmable, supports **SDN**

\vfill

- Supports **VLANs** for traffic segmentation between VMs
  - Same 802.1Q from Block 3, now inside the hypervisor

\vfill

\footnotesize
OVS and SDN: we will explore how switches become programmable in \textbf{Block 5}.

Source: Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.

## Bridging Modes

Three ways to connect a VM to the outside world:

\begin{center}
\small
\begin{tabular}{llll}
\toprule
\textbf{Mode} & \textbf{VM visibility} & \textbf{External access?} & \textbf{Use case} \\
\midrule
Bridged & Same subnet as host & Yes (direct) & Production servers \\
NAT & Hidden behind host IP & Outbound only & Dev/testing \\
Host-only & Only sees the host & No & Isolated labs \\
\bottomrule
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
\node[box, fill=purple!15] (vr) at (7.5,0) {vRouter};
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
    vtep/.style={draw, thick, fill=blue!20, minimum width=1.5cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[vm] (vm1) at (0,1.5) {VM A};
\node[vtep] (v1) at (0,0) {VTEP 1};
\node[vtep] (v2) at (8,0) {VTEP 2};
\node[vm] (vm2) at (8,1.5) {VM B};

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
