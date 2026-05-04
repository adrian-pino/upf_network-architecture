---
title: "Block 5 -- SDN \\& Cloud-Native Networking"
subtitle: "SDN, NFV, Overlays \\& Network Automation"
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
  - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, shapes.symbols, fit, decorations.pathreplacing}
  - \setbeamerfont{footnote}{size=\tiny}
  - \logo{\includegraphics[height=0.6cm]{img/upf-logo.png}}
  - \titlegraphic{\includegraphics[height=1.2cm]{img/upf-logo.png}}
  - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
---

# Limitations of Traditional Networks

## What If You Could Program Your Entire Network?

\begin{center}
\Large\textit{How are modern networks built and automated under the hood?}
\end{center}

\vfill

\begin{center}
\large\textit{Traditional networks are configured device by device.\\What if the network was as programmable as software?}
\end{center}

\vfill

**Learning objectives:**

1. Explain SDN architecture and why centralized control matters
2. Understand NFV and how it replaces hardware appliances
3. Describe overlay networks (VXLAN) and why they scale beyond VLANs
4. Understand how containers communicate over bridge and overlay networks
5. Explain Infrastructure as Code and why it enables network automation

## Traditional Network Management

:::::::::::::: {.columns}
::: {.column width="50%"}

- Each device (router, switch, firewall) configured **individually**
\vspace{0.2cm}
- Configuration via Command-Line Interface (CLI), **device by device**
\vspace{0.2cm}
- Vendor-specific commands and interfaces
\vspace{0.2cm}
- Changes require **manual intervention** on every device

:::
::: {.column width="50%"}

\begin{center}
\begin{tikzpicture}[scale=0.95, every node/.style={transform shape},
    dev/.style={draw, thick, rounded corners, fill=gray!20, minimum width=1.4cm, minimum height=0.6cm, font=\scriptsize, align=center},
    eng/.style={draw, thick, ellipse, fill=yellow!20, minimum width=1.4cm, minimum height=0.7cm, font=\scriptsize},
    >=Stealth
]
% Top row: devices
\node[dev] (r1) at (-2, 3.0) {Router 1};
\node[dev] (r2) at (0,  3.0) {Switch 1};
\node[dev] (r3) at (2,  3.0) {Firewall 1};

% Middle: Admin
\node[eng] (admin) at (0, 1.7) {Admin};

% Bottom row: devices
\node[dev] (r4) at (-2, 0.3) {Router 2};
\node[dev] (r5) at (0,  0.3) {Switch 2};
\node[dev] (r6) at (2,  0.3) {Firewall 2};

% Admin to top row
\draw[->, thick, red] (admin) -- node[left,  font=\tiny] {SSH} (r1);
\draw[->, thick, red] (admin) -- node[right, font=\tiny] {SSH} (r2);
\draw[->, thick, red] (admin) -- node[right, font=\tiny] {SSH} (r3);

% Admin to bottom row
\draw[->, thick, red] (admin) -- node[left,  font=\tiny] {SSH} (r4);
\draw[->, thick, red] (admin) -- node[right, font=\tiny] {SSH} (r5);
\draw[->, thick, red] (admin) -- node[right, font=\tiny] {SSH} (r6);

\node[font=\tiny, text=red] at (0, -0.5) {Each device: separate login, separate config};
\end{tikzpicture}
\end{center}

:::
::::::::::::::

\vfill
\footnotesize Imagine updating 1,000 switches one by one. That is traditional networking.

## Scalability Challenges

- Data centers grow from hundreds to **hundreds of thousands** of devices
\vspace{0.2cm}
- Manual configuration does **not scale**
\vspace{0.2cm}
- Network changes are **slow**: days or weeks for approval + implementation
\vspace{0.2cm}
- **Human errors** increase with complexity
\vspace{0.2cm}
- Cloud-scale infrastructure demands **automation**

## The Control Plane Problem

- In traditional networks, **every device** runs its own control plane
\vspace{0.2cm}
- Each router independently computes routes (OSPF, BGP from Block 3)
\vspace{0.2cm}
- No **centralized view** of the entire network
\vspace{0.2cm}
- Difficult to implement **network-wide policies**
\vspace{0.2cm}
- Limited **programmability**: cannot easily add new features

\vfill

The control plane is **distributed** by design. What if we **centralized** it?

## Discussion: The Cost of Manual Networks

\begin{center}
\Large\textit{Why have traditional networks survived so long\\despite their scalability problems?}
\end{center}

\vfill

- Hint: think about reliability, vendor relationships, and risk aversion
- What would it take for an organization to change?

# Software-Defined Networking (SDN)

## Why SDN?

Traditional networks have no central brain: every device runs its own control logic, independently. Updating a policy means logging into each device separately.

\vspace{0.3cm}

The key insight: what if we **separated the decision-making** (control plane) from the **packet forwarding** (data plane) and moved all decisions into a single piece of software?

\vfill

That is the core idea behind Software-Defined Networking (SDN).

## SDN: Core Idea

:::::::::::::: {.columns}
::: {.column width="40%"}

- **Separate** the control plane from the data plane
\vspace{0.2cm}
- **Centralize** network intelligence in a software controller
\vspace{0.2cm}
- **Program** network behavior through APIs

:::
::: {.column width="60%"}

\begin{center}
\begin{tikzpicture}[
    plane/.style={draw, thick, rounded corners, minimum width=5.5cm, minimum height=0.9cm, font=\small},
    >=Stealth
]
\node[plane, fill=orange!20] (app) at (0,3) {Application Plane};
\node[plane, fill=blue!20] (ctrl) at (0,1.5) {Control Plane (SDN Controller)};
\node[plane, fill=green!15] (data) at (0,0) {Data Plane (Switches)};

\draw[<->, thick] (app) -- node[right, font=\scriptsize] {Northbound API} (ctrl);
\draw[<->, thick] (ctrl) -- node[right, font=\scriptsize] {Southbound API} (data);
\end{tikzpicture}
\end{center}

:::
::::::::::::::

\footnotesize McKeown et al., "OpenFlow: Enabling Innovation in Campus Networks," *ACM SIGCOMM CCR*, 2008.

## SDN Architecture: Three Planes

**Data Plane (Infrastructure Layer):**

- Physical/virtual switches that **forward packets**
- No longer make independent routing decisions
- Receive forwarding rules from the controller

\vspace{0.2cm}

**Control Plane (Controller):**

- Centralized software with a **global view** of the network
- Computes paths, installs forwarding rules on switches
- Single point of management for the entire network

\vspace{0.2cm}

**Application Plane:**

- Applications that define **network behavior** (firewall, load balancer, monitor)
- Communicate with the controller via northbound APIs

## SDN Controllers

:::::::::::::: {.columns}
::: {.column width="50%"}

- The controller is the **brain** of the network: it has a global view and makes all forwarding decisions
\vspace{0.2cm}
- Maintains a real-time **topology database**
\vspace{0.2cm}
- Supports **high availability** via clustering

\vspace{0.3cm}

**Open-source examples:**

- **OpenDaylight** (Linux Foundation)
- **ONOS** (Open Network Operating System, carrier-grade)

\vspace{0.2cm}

**Proprietary examples:**

- **Cisco ACI**, **VMware NSX**

\footnotesize OpenDaylight Project, opendaylight.org; ONOS Project, onosproject.org.

:::
::: {.column width="50%"}

\begin{center}
\begin{tikzpicture}[scale=0.8, every node/.style={transform shape},
    sw/.style={draw, thick, rounded corners, fill=gray!20, minimum width=1.4cm, minimum height=0.6cm, font=\scriptsize, align=center},
    >=Stealth
]
% Controller box (outer, larger)
\node[draw, thick, rounded corners, fill=blue!20, minimum width=4cm, minimum height=2cm] (ctrlbox) at (0, 3.2) {};
\node[font=\scriptsize, align=center] at (0, 3.7) {SDN Controller\\(global view)};
\node[draw, thick, rounded corners, fill=blue!8, minimum width=3cm, minimum height=0.5cm, font=\tiny] at (0, 2.9) {Topology DB};

% Southbound arrow with label
\draw[->, thick] (0, 2.2) -- node[right, font=\tiny] {Southbound API} (0, 1.5);

% Horizontal bus
\draw[thick] (-2, 1.5) -- (2, 1.5);

% Switches
\node[sw] (s1) at (-2, 0.6) {Switch 1};
\node[sw] (s2) at (0,  0.6) {Switch 2};
\node[sw] (s3) at (2,  0.6) {Switch 3};

\draw[->, thick] (-2, 1.5) -- (s1);
\draw[->, thick] (0,  1.5) -- (s2);
\draw[->, thick] (2,  1.5) -- (s3);

\node[font=\tiny, text=gray, align=center] at (0, -0.1) {Flow rules pushed to all devices at once};
\end{tikzpicture}
\end{center}

:::
::::::::::::::

## Southbound Interface: OpenFlow

- **OpenFlow** (2008, Stanford): the first standard southbound protocol
\vspace{0.2cm}
- Controller pushes **flow rules** to switches: match on packet fields, apply an action (forward, drop, redirect)
\vspace{0.2cm}
- Proved the concept: a controller can program any switch centrally
\vspace{0.2cm}
- Rarely used in production today; modern SDN relies on **gNMI**, **NETCONF/YANG**, and vendor APIs (Cisco ACI, VMware NSX)

\vfill

\footnotesize ONF, "Software-Defined Networking: The New Norm for Networks," ONF White Paper, 2012.

## Northbound Interface: Representational State Transfer (REST) APIs

- Applications interact with the controller via **REST APIs**
\vspace{0.2cm}
- Example operations:
  - `GET /topology/links` $\rightarrow$ get network topology
  - `POST /flows` $\rightarrow$ add a flow rule
  - `GET /statistics/port` $\rightarrow$ query traffic statistics

\vfill

Key benefit: the network becomes **programmable** like any other software system — any developer can write applications that control network behavior.

## SDN Benefits: Summary

- **Centralized management**: one controller, global network view
\vspace{0.2cm}
- **Programmability**: automate changes via APIs
\vspace{0.2cm}
- **Agility**: deploy new policies in seconds, not days
\vspace{0.2cm}
- **Vendor independence**: open protocols (gNMI, NETCONF) and standard APIs reduce lock-in
\vspace{0.2cm}
- **Innovation**: researchers and developers can experiment easily

\vfill

\footnotesize
SDN is the foundation for modern cloud networking: AWS, Azure, and GCP all use SDN internally.

## Discussion: SDN Trade-offs

\begin{center}
\Large\textit{If the SDN controller fails,\\what happens to the network?}
\end{center}

\vfill

- Hint: single point of failure vs distributed control
- How do real deployments address this? (clustering, failover)

# Network Function Virtualization (NFV)

## Why NFV?

SDN solves *how* traffic flows: a central controller programs forwarding rules across the network. But the functions that actually **process** that traffic (firewalls, load balancers, routers) are still dedicated hardware boxes: expensive, slow to procure, and impossible to spin up in seconds.

\vspace{0.3cm}

SDN can steer traffic perfectly — but if it leads to a \euro{}50K hardware appliance, we have not solved the flexibility problem.

\vfill

NFV completes the picture: run those functions as **software on the same commodity servers** SDN already manages.

## NFV: From Hardware to Software

:::::::::::::: {.columns}
::: {.column width="40%"}

Traditional network functions run on **dedicated hardware boxes**:

- Firewall: \euro{}10K--\euro{}100K+
- Load balancer, router, IDS/IPS

\vspace{0.2cm}

Problems: **expensive**, inflexible, slow to deploy, vendor lock-in

\vspace{0.2cm}

NFV replaces them with **software (VNFs)** running on standard x86 servers or VMs.

\footnotesize ETSI, "Network Functions Virtualisation," White Paper, 2012.

:::
::: {.column width="60%"}

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|}
\hline
\rowcolor{blue!10} \textbf{Physical Appliance} & \textbf{VNF Equivalent} \\
\hline
Hardware firewall & pfSense, iptables \\
\hline
Hardware load balancer & HAProxy, NGINX \\
\hline
Hardware router & VyOS, FRRouting \\
\hline
IDS/IPS & Snort, Suricata \\
\hline
\end{tabular}
\end{center}

\footnotesize ETSI GS NFV 002, "NFV Architectural Framework," v1.2.1, 2014.

:::
::::::::::::::

## NFV + Cloud Integration

- Deploy VNFs on cloud infrastructure (IaaS) $\rightarrow$ **minutes** instead of months
\vspace{0.2cm}
- **Scale horizontally**: add more instances under load
\vspace{0.2cm}
- **Update easily**: software upgrades, no truck rolls
\vspace{0.2cm}
- **Cost reduction**: commodity servers vs specialized hardware

\vfill

No hardware procurement, no shipping, no rack-and-stack.

## SDN + NFV: Complementary Technologies

:::::::::::::: {.columns}
::: {.column width="50%"}

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=3.5cm, minimum height=1.0cm, font=\small, align=center},
    >=Stealth
]
\node[box, fill=blue!15] (sdn) at (0, 1) {SDN\\{\tiny How traffic flows}};
\node[box, fill=green!15] (nfv) at (0,-1) {NFV\\{\tiny What processes traffic}};
\draw[<->, very thick, red] (sdn) -- node[right, font=\scriptsize] {work together} (nfv);
\end{tikzpicture}
\end{center}

:::
::: {.column width="50%"}

**Example: HTTP request entering a data center**

\vspace{0.2cm}

1. SDN controller sees incoming traffic
2. Forwards it to a **VNF firewall** (NFV) for inspection
3. Firewall approves; SDN routes it to the **VNF load balancer**
4. Load balancer distributes to backend servers

\vspace{0.2cm}

- SDN **steers** traffic (forwarding rules)
- NFV **processes** traffic (filter, balance, inspect)

:::
::::::::::::::

## Discussion: When Hardware Still Wins

\begin{center}
\Large\textit{Can you think of a scenario where a physical\\appliance is better than a VNF?}
\end{center}

\vfill

- Hint: think about latency, throughput, and specialized workloads
- What about hardware accelerators (FPGAs, SmartNICs)?

# From VLANs to Overlay Networks

## Why Overlay Networks?

SDN and NFV give us programmable, virtualized infrastructure. Many tenants share the same physical network, so we need to **isolate their traffic**. We already know VLANs (Block 3) — but VLANs are capped at 4,096 networks and cannot span Layer 3 boundaries.

\vspace{0.3cm}

A cloud provider hosting millions of tenants, each running SDN-controlled VNFs, cannot rely on VLANs. A scalable isolation mechanism is needed: one that works across any physical topology and is invisible to the underlay.

\vfill

That is what overlay networks solve.

## The VLAN Scalability Problem

- In Block 4 we used **VLANs** to isolate tenants on virtual networks
\vspace{0.2cm}
- VLANs use a **12-bit ID** $\rightarrow$ maximum **4,096** virtual networks
\vspace{0.2cm}
- Cloud providers host **millions** of tenants $\rightarrow$ VLANs are not enough
\vspace{0.2cm}
- Additional limitations:
  - VLANs are confined to a **single L2 domain**
  - Moving a VM to another host may require VLAN reconfiguration

\vfill
\footnotesize
We need a technology that scales beyond 4K networks and works across L3 boundaries.

## Overlay Networks: Concept

:::::::::::::: {.columns}
::: {.column width="45%"}

- An **overlay network** is a virtual network built **on top of** the physical one
\vspace{0.2cm}
- Uses **encapsulation**: the original frame is wrapped inside a physical packet
\vspace{0.2cm}
- The physical network only sees the **outer headers** — tenant traffic is invisible
\vspace{0.2cm}
- Each tenant gets **full isolation** without the physical network knowing about them

:::
::: {.column width="55%"}

\begin{center}
\begin{tikzpicture}[>=Stealth, font=\scriptsize]

% Outermost: Outer IP/UDP
\node[draw, thick, rounded corners, fill=gray!20,
      minimum width=6.5cm, minimum height=2.8cm] (outer) at (0,0) {};
\node[anchor=north west, font=\tiny] at (outer.north west) {\textbf{Outer IP/UDP header}};

% Middle: Overlay Header
\node[draw, thick, rounded corners, fill=blue!15,
      minimum width=4.8cm, minimum height=1.9cm] (mid) at (0.3,-0.2) {};
\node[anchor=north west, font=\tiny] at (mid.north west) {\textbf{Overlay header (VNI)}};

% Innermost: Original Frame
\node[draw, thick, rounded corners, fill=green!15,
      minimum width=3cm, minimum height=1.0cm] (inner) at (0.6,-0.5) {Original L2 Frame};

\node[above=0.15cm of outer, font=\scriptsize] {\textit{Physical network sees only this}};

\end{tikzpicture}
\end{center}

:::
::::::::::::::

## VXLAN: Overview

- **VXLAN** (Virtual eXtensible LAN): most widely used overlay protocol
\vspace{0.2cm}
- Encapsulates L2 frames in **UDP packets** over the physical network
\vspace{0.2cm}
- Uses a **24-bit VNI** (VXLAN Network Identifier)
  - $2^{24}$ = **16 million** virtual networks (vs 4,096 VLANs)
\vspace{0.2cm}
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
\vspace{0.2cm}
- Physical network does not need to know about tenants
\vspace{0.2cm}
- VMs can **migrate** across hosts without reconfiguring the underlay
\vspace{0.2cm}
- Decouples **virtual topology** from physical topology

\vfill

\footnotesize
Overlays are the foundation of cloud networking: every virtual network (VPC) you create runs on top of VXLAN or similar protocols.

Source: IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

## Discussion: Overlay Networks

\begin{center}
\Large\textit{Why can the physical network remain simple\\if we use overlay networks?\\What are the trade-offs of encapsulation?}
\end{center}

\vfill

Hints: think about overhead (extra headers), MTU implications, and troubleshooting complexity.

# Container Networking

## Why Container Networking?

Overlays give us scalable, isolated virtual networks across any physical infrastructure. Now the question is: what runs *inside* those networks? Modern applications are no longer monolithic — they are split into dozens of small, independent services, each deployed as a **container**.

\vspace{0.3cm}

Each container needs its own network identity, must reach other containers (possibly on different hosts), and must be reachable from the outside. The overlay networks we just studied are exactly what makes this possible at scale.

\vfill

How does networking work inside and between container hosts?

## Container Networking: Starting Point

- Every container gets its own **network namespace**: isolated IP stack, interfaces, routing table
\vspace{0.2cm}
- The container runtime (Docker) wires containers together using **virtual bridges** and **veth pairs**
\vspace{0.2cm}
- Containers can reach each other, the host, and the internet — depending on the **network model** chosen

<!-- note: students have seen namespaces/cgroups/Docker in Lab3_Docker_Intro -- no need to repeat here -->

## Container Network Models

**Bridge network (default):**

- Containers on the same host connected via a **virtual bridge** (`docker0`)
- Each container gets a **veth pair** (virtual Ethernet interface)
- **NAT** for external traffic; containers share host's IP

**Host network:**

- Container uses the **host's network stack directly**
- No network isolation, but **no NAT overhead**
- Use for performance-critical applications

**Overlay network:**

- Containers on **different hosts** connected via VXLAN overlay
- Same overlay concept we just covered, now applied to containers
- Enables **multi-host** container deployments

\footnotesize Docker, Inc., "Docker Networking Documentation," docs.docker.com/network.

## Container Networking: Visual

\begin{center}
\begin{tikzpicture}[
    cont/.style={draw, thick, rounded corners, fill=orange!15, minimum width=1.2cm, minimum height=0.5cm, font=\scriptsize},
    br/.style={draw, thick, fill=blue!15, minimum width=4cm, minimum height=0.5cm, font=\scriptsize},
    >=Stealth
]
% Host 1
\node[draw, thick, dashed, rounded corners, inner sep=8pt, fit={(-2.5,-1)(2.5,2)}, label=above:{\scriptsize Host 1}] {};
\node[cont] (c1) at (-1.2,1.2) {Container A};
\node[cont] (c2) at (1.2,1.2) {Container B};
\node[br] (br1) at (0,0) {docker0 (bridge)};
\draw[thick] (c1) -- (-1.2,0.25);
\draw[thick] (c2) -- (1.2,0.25);

% Host 2
\node[draw, thick, dashed, rounded corners, inner sep=8pt, fit={(5.5,-1)(10.5,2)}, label=above:{\scriptsize Host 2}] {};
\node[cont] (c3) at (6.8,1.2) {Container C};
\node[cont] (c4) at (9.2,1.2) {Container D};
\node[br] (br2) at (8,0) {docker0 (bridge)};
\draw[thick] (c3) -- (6.8,0.25);
\draw[thick] (c4) -- (9.2,0.25);

% Overlay
\draw[thick, dashed, red] (br1) -- node[below, font=\scriptsize] {overlay network (VXLAN)} (br2);
\end{tikzpicture}
\end{center}

- Within a host: containers use a **bridge** network
- Across hosts: an **overlay** connects the bridges (VXLAN from the previous section)

## Microservices: From Monolith to Distributed

- **Monolithic** app: one big process, one deployment, one codebase
\vspace{0.2cm}
- **Microservices**: app split into small, independent services — each in its own container
\vspace{0.2cm}
- Services communicate over the **network** (HTTP/REST, gRPC Remote Procedure Call)
\vspace{0.2cm}
- Network implications for hundreds of containers talking to each other:
  - Need **service discovery**: "where is the payment service?"
  - Need **load balancing**: distribute requests across replicas
  - Need **observability**: trace requests across services

## Microservices: Network Challenges

\begin{center}
\begin{tikzpicture}[
    svc/.style={draw, thick, rounded corners, fill=green!15, minimum width=1.5cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[svc] (web) at (0,0) {Web Frontend};
\node[svc] (auth) at (-3,-1.5) {Auth Service};
\node[svc] (pay) at (0,-1.5) {Payment};
\node[svc] (inv) at (3,-1.5) {Inventory};
\node[svc] (db1) at (-3,-3) {Users DB};
\node[svc] (db2) at (3,-3) {Products DB};

\draw[->, thick] (web) -- (auth);
\draw[->, thick] (web) -- (pay);
\draw[->, thick] (web) -- (inv);
\draw[->, thick] (auth) -- (db1);
\draw[->, thick] (inv) -- (db2);
\draw[->, thick] (pay) -- (inv);
\end{tikzpicture}
\end{center}

- Every arrow = **network call** $\rightarrow$ latency and failure risk
- If Inventory is down $\rightarrow$ Payment and Web are affected (**cascading failure**)
- Solutions: retries, timeouts, circuit breakers, service meshes

## Discussion: Containers vs VMs

\begin{center}
\Large\textit{If containers are faster and lighter than VMs,\\why do companies still use VMs?}
\end{center}

\vfill

- Hint: security isolation, legacy applications, compliance requirements
- In practice, containers often run inside VMs

# Infrastructure as Code \& Network Automation

## Why Infrastructure as Code?

We can now program the network (SDN), virtualize its functions (NFV), scale tenant isolation (overlays), and run applications as containers. But if all of this is still configured by hand — clicking dashboards, running commands device by device — we are back to exactly the problem we started with: slow, error-prone, impossible to reproduce.

\vspace{0.3cm}

The final piece is treating infrastructure the same way we treat software: configuration written in files, reviewed in pull requests, stored in version control, and applied automatically.

\vfill

That closes the loop from the manual networks we saw at the start of this session.

## Infrastructure as Code (IaC)

- **IaC**: manage infrastructure through **code files**, not manual clicks
\vspace{0.2cm}
- Describe desired state in a configuration file $\rightarrow$ tools apply it automatically
\vspace{0.2cm}
- **Reproducibility**: same config $\rightarrow$ same infrastructure, every time
\vspace{0.2cm}
- **Version control**: track changes in Git, review, rollback
\vspace{0.2cm}
- **Automation**: no manual steps $\rightarrow$ fewer human errors
\vspace{0.2cm}
- **Speed**: deploy entire environments in minutes

\footnotesize Morris, *Infrastructure as Code*, 2nd ed., O'Reilly, 2021.

## IaC Example: Terraform (Conceptual)

```hcl
# Define a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Define a subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Define a security group
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}
```

<!-- nota: esto es solo para mostrar la idea de infraestructura declarativa, no es un tutorial de Terraform -->

\footnotesize HashiCorp, "Terraform Documentation," terraform.io/docs.

## Discussion: IaC Risks

\begin{center}
\Large\textit{If infrastructure is defined as code,\\what happens when someone pushes a bug?}
\end{center}

\vfill

- Hint: code review, staging environments, automated testing
- How is this similar to software development best practices?

# Session Summary

## The Full Picture: Where Everything Fits

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=3.5cm, minimum height=0.8cm, font=\small},
    >=Stealth
]
\node[box, fill=gray!15] (trad) at (0,4) {Traditional (HW appliances)};
\node[box, fill=green!15] (virt) at (0,3) {Virtualization (VMs, vNICs)};
\node[box, fill=blue!15] (sdn) at (-3,2) {SDN (programmable control)};
\node[box, fill=orange!15] (nfv) at (3,2) {NFV (software functions)};
\node[box, fill=purple!15] (cloud) at (0,1) {Cloud (IaaS / PaaS / SaaS)};
\node[box, fill=red!15] (cont) at (0,0) {Containers + Microservices};

\draw[->, thick] (trad) -- (virt);
\draw[->, thick] (virt) -- (sdn);
\draw[->, thick] (virt) -- (nfv);
\draw[->, thick] (sdn) -- (cloud);
\draw[->, thick] (nfv) -- (cloud);
\draw[->, thick] (cloud) -- (cont);
\end{tikzpicture}
\end{center}

Each layer builds on the previous one. This is the **evolution of networking**.

## References

\footnotesize

1. McKeown et al., "OpenFlow: Enabling Innovation in Campus Networks," *ACM SIGCOMM CCR*, vol. 38, no. 2, 2008.
2. ONF, "Software-Defined Networking: The New Norm for Networks," ONF White Paper, 2012.
3. OpenDaylight Project, opendaylight.org.
4. ONOS Project, onosproject.org.
5. ETSI, "Network Functions Virtualisation," White Paper, 2012.
6. ETSI GS NFV 002, "NFV Architectural Framework," v1.2.1, 2014.
7. Docker, Inc., "Docker Networking Documentation," docs.docker.com/network.
8. Morris, *Infrastructure as Code*, 2nd ed., O'Reilly, 2021.
9. HashiCorp, "Terraform Documentation," terraform.io/docs.
10. Goransson & Black, *Software Defined Networks*, 2nd ed., Morgan Kaufmann, 2017.
11. Kurose & Ross, *Computer Networking: A Top-Down Approach*, 8th ed., Pearson, 2021.
12. IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
13. IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

## Key Takeaways

1. Traditional networks are **manual, rigid, and do not scale**
2. **SDN** separates control from data plane: centralized, programmable, API-driven
3. **NFV** replaces hardware appliances with software: flexible, fast to deploy, cheap
4. SDN and NFV are **complementary**: SDN steers traffic, NFV processes it
5. **VXLAN** overlays scale isolation to 16 million networks (vs 4,096 VLANs)
6. Containers use **bridge networks** on a single host and **overlay networks** across hosts
7. **Microservices** = many containers communicating over the network, requiring service discovery and resilience
8. **IaC** automates infrastructure: reproducible, version-controlled, auditable

## Discussion

\begin{center}
\Large\textit{A company runs 200 microservices in containers.\\One Friday at 5 PM, a manual network change\\breaks communication for 50 of them.\\How could SDN and IaC have prevented this?}
\end{center}

\vfill

<!-- nota: guiar hacia: SDN da visibilidad global y control centralizado, IaC permite rollback instantáneo con git revert, ambos eliminan la configuración manual que causó el error -->

Hints: centralized control, automated testing, instant rollback, reproducibility.
