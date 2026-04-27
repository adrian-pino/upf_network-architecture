---
title: "Block 4 -- Session 1"
subtitle: "Network Virtualization"
author: "Arquitectura de Xarxes"
institute: "Universitat Pompeu Fabra -- 2025/2026"
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

# Introduction to Network Virtualization

## What If One Machine Could Do the Job of Ten?

\begin{center}
\Large\textit{What is the Cloud and how is it formed?\\How do networks work in the cloud?}
\end{center}

\vfill

**Learning objectives:**

1. Understand why virtualization exists and what problems it solves
2. Distinguish VMs, hypervisors, and containers
3. Explain how networks are virtualized (vNICs, vSwitches, vRouters)

<!-- nota: estas dos preguntas guían los bloques 4 y 5 enteros -->

## The Problem with Physical Infrastructure

- Traditional model: **one server = one application**
- Typical server utilization: only **10--15\%** of capacity
- Adding capacity means buying, racking, cabling $\rightarrow$ **weeks or months**
- Hardware failure takes down the entire service
- No way to scale down when demand drops

\vfill

\footnotesize
Key insight: most servers sit idle most of the time. We're paying for hardware we barely use.

<!-- nota: preguntar a los alumnos cuántos servidores creen que tiene Google (~1M+) -->

## Resource Consolidation

- **Consolidation** = run multiple workloads on fewer physical machines
- Benefits:
  - Higher utilization: **60--80\%** instead of 10--15\%
  - Lower energy, cooling, and physical space costs
  - Simpler infrastructure management
- Trade-off: shared hardware requires **strong isolation** between workloads

\vfill

\footnotesize
Analogy: instead of one person per house, we build apartment buildings -- shared structure, private spaces.

## Scalability and Elasticity

- **Scalability**: ability to grow resources as demand increases
- **Elasticity**: ability to grow \textit{and shrink} automatically
- Physical infrastructure provides **neither** in practice:
  - Can't add servers in minutes
  - Can't return servers when demand drops
- Virtualization enables both $\rightarrow$ foundation of **cloud computing**

<!-- nota: ejemplo Netflix — escala servidores en horas pico, reduce de madrugada. Sin virtualización esto sería imposible -->

# Virtualization Concepts

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

\footnotesize Source: Popek & Goldberg, "Formal Requirements for Virtualizable Third Generation Architectures," *CACM*, 1974.

## Virtual Machines (VMs)

- A VM is a **software emulation** of a complete computer
- Has its own: virtual CPU, RAM, disk, network interfaces
- Runs a **full operating system** (Linux, Windows, etc.)
- Completely **isolated** from other VMs on the same host

Key properties:

- **Encapsulation**: entire VM state stored as files $\rightarrow$ easy to copy, move, backup
- **Hardware independence**: VM doesn't care about underlying hardware
- **Snapshotting**: save and restore VM state at any point in time

## Hypervisors -- The Key Enabler

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

\footnotesize Source: VMware, "Understanding Full Virtualization, Paravirtualization, and Hardware Assist," 2007; Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.

## Type 1 vs Type 2 -- Visual Comparison

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

## VMs vs Containers -- Overview

\begin{center}
\small
\begin{tabular}{lll}
\toprule
& \textbf{Virtual Machines} & \textbf{Containers} \\
\midrule
Isolation & Full OS per VM (hardware-level) & Shared kernel (namespace/cgroup) \\
Size & GBs (full OS image) & MBs (app + dependencies only) \\
Boot time & Minutes & Seconds \\
Overhead & Higher (full OS running) & Lower (shared kernel) \\
Security & Strong (hardware isolation) & Good (kernel-level isolation) \\
\bottomrule
\end{tabular}
\end{center}

\vfill
\footnotesize
Deep dive into containers in Block 5. For now: VMs = heavy isolation, containers = lightweight isolation. Docker, Inc., "Docker Overview," docs.docker.com.

## When to Use VMs vs Containers

- **Use VMs when:**
  - You need to run **different operating systems** (Linux + Windows)
  - Strong **security isolation** is critical (e.g., different tenants)
  - Legacy applications that require a specific OS environment

- **Use containers when:**
  - Running **many instances** of similar applications
  - **Fast startup** and scaling is important
  - **Microservices** architecture (each service in its own container)

- **In practice**: most organizations use **both** together
  - Containers run inside VMs for an extra layer of isolation (defense-in-depth)

# Virtual Network Infrastructure

## Virtual Network Interfaces (vNICs)

- A **vNIC** is a software-emulated network interface card
- From the guest's perspective: behaves exactly like a real NIC
- Each VM gets **one or more vNICs**

Key characteristics:

- Has its own **MAC address** (software-assigned, not burned-in)
- Has its own **IP address** configuration
- Connected to a **virtual switch** on the host

## MAC Addressing in Virtual Environments

- Physical NICs: MAC **burned into hardware** (OUI + device ID)
- Virtual NICs: MAC **generated by the hypervisor**
- Common vendor prefixes identify the platform:

\begin{center}
\small
\begin{tabular}{ll}
\toprule
\textbf{MAC Prefix} & \textbf{Platform} \\
\midrule
\texttt{00:50:56} & VMware \\
\texttt{52:54:00} & KVM / QEMU \\
\texttt{00:15:5D} & Microsoft Hyper-V \\
\bottomrule
\end{tabular}
\end{center}

- Risk: MAC collisions if addresses aren't managed properly
- Hypervisors ensure **uniqueness** within the same host
- Multiple vNICs per VM enable **multi-network** connectivity

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

- Connects VMs on the same host -- works like a **physical L2 switch**
- Maintains **MAC address table**, forwards frames by destination MAC
- Connected to physical NIC via **uplink** for external traffic

## Virtual Switch Features

- Supports **VLANs** for traffic segmentation between VMs
  - Same 802.1Q from Block 3, now inside the hypervisor

- Types of virtual switches:
  - **Standard vSwitch**: basic, built into the hypervisor
  - **Distributed vSwitch**: spans multiple hosts, centralized management
  - **Open vSwitch (OVS)**: open-source, programmable, supports SDN

\footnotesize Source: Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.

<!-- nota: OVS se retoma en Block 5 cuando hablemos de SDN -->

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

Same NAT concept from Block 3 -- now managed by the hypervisor instead of a physical device.

## Packet Flow -- Virtual to Physical

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

# Network Isolation and Multi-Tenancy

## Multi-Tenant Architectures

- **Multi-tenancy**: multiple independent users (**tenants**) share the same infrastructure
- Examples: cloud providers, enterprise data centers, university IT
- Each tenant expects:
  - **Performance isolation**: my traffic is not affected by yours
  - **Security isolation**: you cannot see or access my data
  - **Address independence**: we can both use `10.0.0.0/24`

\vfill

<!-- nota: analogía — apartamentos en un edificio: misma estructura, cada uno es privado -->

## The Isolation Challenge

- Physical networks are **shared by default** -- no isolation
- Without isolation mechanisms:
  - **Broadcast storms** affect everyone
  - **ARP spoofing** can intercept traffic between tenants
  - **IP address conflicts** between tenants using the same ranges
  - No **performance guarantees** (one tenant can starve others)
- Solution: **logical isolation** mechanisms at L2 and above

## VLANs in Virtual Environments

- Same **802.1Q** concept from Block 3, now applied to virtual switches
- Hypervisors assign VMs to specific VLANs via **vSwitch port groups**
- Traffic tagged with VLAN IDs -- tenants separated at L2

\vfill

**Limitation**: VLAN ID is 12 bits $\rightarrow$ max **4,096 VLANs**

\vfill

Problem: 4,096 VLANs is **not enough** for a large cloud provider with thousands of tenants.

\footnotesize Source: IEEE 802.1Q-2022, "Bridges and Bridged Networks."

## Network Segmentation and Micro-Segmentation

- **VLANs** provide L2 segmentation within a data center
- Additional segmentation strategies:
  - **Firewall rules** between VLAN groups
  - **ACLs** on virtual routers
  - **Micro-segmentation**: per-VM or per-workload firewall policies

\vfill

Goal: **least privilege** -- each VM should only reach what it strictly needs.

\footnotesize
Micro-segmentation is a key concept in modern data center security (zero trust networking).

## Overlay Networks -- Concept

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

## VXLAN -- Overview

- **VXLAN** (Virtual eXtensible LAN): most widely used overlay protocol
- Encapsulates L2 frames in **UDP packets** over the physical network
- Uses a **24-bit VNI** (VXLAN Network Identifier)
  - $2^{24}$ = **16 million** virtual networks (vs 4,096 VLANs!)
- Endpoints: **VTEPs** (VXLAN Tunnel Endpoints)
  - Encapsulate at source, decapsulate at destination

\footnotesize Source: RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.

## VXLAN -- How It Works

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
- Physical network doesn't need to know about tenants
- VMs can **migrate** across hosts without reconfiguring the underlay
- Decouples **virtual topology** from physical topology
- Foundation for cloud networking:
  - AWS VPC, Azure VNet, Google VPC all use overlays internally

\footnotesize Source: RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

# References

## References

\footnotesize

1. Popek & Goldberg, "Formal Requirements for Virtualizable Third Generation Architectures," *CACM*, vol. 17, no. 7, 1974.
2. Barham et al., "Xen and the Art of Virtualization," *SOSP*, 2003.
3. VMware, "Understanding Full Virtualization, Paravirtualization, and Hardware Assist," 2007.
4. Pfaff et al., "The Design and Implementation of Open vSwitch," *NSDI*, 2015.
5. IEEE 802.1Q-2022, "Bridges and Bridged Networks."
6. IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
7. IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.
8. Docker, Inc., "Docker Overview," docs.docker.com.
9. NIST SP 800-125, "Guide to Security for Full Virtualization Technologies," 2011.
10. Kurose & Ross, *Computer Networking: A Top-Down Approach*, 8th ed., Pearson, 2021.

# Session Summary

## Key Takeaways

1. Physical infrastructure is **rigid, underutilized, and slow to scale**
2. **Hypervisors** (Type 1 and 2) enable multiple VMs on one host
3. **Containers** are lighter than VMs but share the kernel (more in Block 5)
4. Virtual networks mirror physical ones: **vNICs, vSwitches, vRouters**
5. **Multi-tenancy** requires isolation $\rightarrow$ VLANs, overlays, micro-segmentation
6. **VXLAN** extends VLANs from 4K to 16M networks using encapsulation

## Discussion

\begin{center}
\Large\textit{You manage a data center with 5,000 tenants.\\Each tenant wants their own isolated network.\\Why can't you use VLANs alone?\\What would you use instead, and why?}
\end{center}

\vfill

<!-- nota: guiar hacia: 4096 VLAN limit, overlapping IPs, VXLAN con 16M VNIs, y la necesidad de desacoplar red virtual de física -->

Hints: VLAN ID limit, overlapping IP ranges, VM mobility.
