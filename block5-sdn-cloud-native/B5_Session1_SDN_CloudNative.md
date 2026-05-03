---
title: "Block 5 -- Session 1"
subtitle: "Software-Defined \\& Cloud-Native Networking"
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
  - \titlegraphic{\includegraphics[height=1.2cm]{img/upf-logo.png}\\[0.3cm]\scriptsize Adrián Pino \texttt{<adrian.pino@upf.edu>}}
  - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
---

# Limitations of Traditional Networks

## What If You Could Program Your Entire Network?

\begin{center}
\Large\textit{Traditional networks are configured device by device.\\What if the network was as programmable as software?}
\end{center}

\vfill

**Learning objectives:**

:::incremental
1. Explain SDN architecture and why it matters
2. Understand NFV and how it replaces hardware appliances
3. Describe container networking and microservices communication
:::

## Traditional Network Management

- Each device (router, switch, firewall) configured **individually**
- Configuration via CLI, **device by device**
- Vendor-specific commands and interfaces
- Changes require **manual intervention** on every device

\vfill

Imagine updating 1,000 switches one by one. That's traditional networking.

## Scalability Challenges

- Data centers grow from hundreds to **hundreds of thousands** of devices
- Manual configuration does **not scale**
- Network changes are **slow**: days or weeks for approval + implementation
- **Human errors** increase with complexity
- Cloud-scale infrastructure demands **automation**

## The Control Plane Problem

- In traditional networks, **every device** runs its own control plane
- Each router independently computes routes (OSPF, BGP from Block 3)
- No **centralized view** of the entire network
- Difficult to implement **network-wide policies**
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

## SDN -- Core Idea

- **Separate** the control plane from the data plane
- **Centralize** network intelligence in a software controller
- **Program** network behavior through APIs

\begin{center}
\begin{tikzpicture}[
    plane/.style={draw, thick, rounded corners, minimum width=7cm, minimum height=1cm, font=\small},
    >=Stealth
]
\node[plane, fill=orange!20] (app) at (0,3) {Application Plane};
\node[plane, fill=blue!20] (ctrl) at (0,1.5) {Control Plane (SDN Controller)};
\node[plane, fill=green!15] (data) at (0,0) {Data Plane (Switches)};

\draw[<->, thick] (app) -- node[right, font=\scriptsize] {Northbound API} (ctrl);
\draw[<->, thick] (ctrl) -- node[right, font=\scriptsize] {Southbound API} (data);
\end{tikzpicture}
\end{center}

\footnotesize McKeown et al., "OpenFlow: Enabling Innovation in Campus Networks," *ACM SIGCOMM CCR*, 2008.

## SDN Architecture -- Three Planes

**Data Plane (Infrastructure Layer):**

- Physical/virtual switches that **forward packets**
- No longer make independent routing decisions
- Receive forwarding rules from the controller

**Control Plane (Controller):**

- Centralized software with a **global view** of the network
- Computes paths, installs forwarding rules on switches
- Single point of management for the entire network

**Application Plane:**

- Applications that define **network behavior** (firewall, load balancer, monitor)
- Communicate with the controller via northbound APIs

## SDN Controllers

- The controller is the **brain** of an SDN network
- Maintains a real-time **topology database** of the entire network
- Supports **high availability** (clustered deployment)

Examples:

- **OpenDaylight** (Linux Foundation, Java-based, widely adopted)
- **ONOS** (Open Network Operating System, carrier-grade, telecom-focused)
- **Floodlight** (open-source, lightweight, educational)
- Proprietary: **Cisco ACI**, **VMware NSX**

\footnotesize OpenDaylight Project, opendaylight.org; ONOS Project, onosproject.org.

## Southbound Interface -- OpenFlow

- **OpenFlow** (2008, Stanford): the original SDN protocol
- Defines how the controller communicates with switches
- Controller installs **flow rules** in the switch's flow table:

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Match} & \textbf{Action} & \textbf{Priority} \\
\hline
dst IP = \texttt{10.0.1.0/24} & Forward to port 3 & 100 \\
\hline
dst IP = \texttt{10.0.2.0/24} & Forward to port 5 & 100 \\
\hline
src IP = \texttt{192.168.1.100} & Drop & 200 \\
\hline
* (any) & Send to controller & 1 \\
\hline
\end{tabular}
\end{center}

- If no rule matches $\rightarrow$ packet sent to controller for a decision

\footnotesize ONF, "Software-Defined Networking: The New Norm for Networks," ONF White Paper, 2012.

## Northbound Interface -- Representational State Transfer (REST) APIs

- Applications interact with the controller via **REST APIs**
- Example operations:
  - `GET /topology/links` $\rightarrow$ get network topology
  - `POST /flows` $\rightarrow$ add a flow rule
  - `GET /statistics/port` $\rightarrow$ query traffic statistics

\vfill

Key benefit: the network becomes **programmable** like any other software system.

Any developer can write applications that control network behavior.

## SDN Benefits -- Summary

- **Centralized management**: one controller, global network view
- **Programmability**: automate changes via APIs
- **Agility**: deploy new policies in seconds, not days
- **Vendor independence**: OpenFlow works across vendors
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

## From Hardware Appliances to Software

- Traditional network functions run on **dedicated hardware**:
  - Firewall $\rightarrow$ physical appliance (\$10K--\$100K+)
  - Load balancer $\rightarrow$ physical appliance
  - Router $\rightarrow$ physical appliance

- Problems: **expensive**, inflexible, vendor lock-in, slow to deploy
- NFV idea: run these functions as **software on commodity servers**

\footnotesize ETSI, "Network Functions Virtualisation -- An Introduction, Benefits, Enablers, Challenges \& Call for Action," White Paper, 2012.

## Virtual Network Functions (VNFs)

- A **VNF** = network function implemented as software
- Runs on VMs or containers, on standard x86 servers

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|}
\hline
\rowcolor{blue!10} \textbf{Physical Appliance} & \textbf{VNF Equivalent} \\
\hline
Hardware firewall & Virtual firewall (pfSense, iptables) \\
\hline
Hardware load balancer & Virtual LB (HAProxy, NGINX) \\
\hline
Hardware router & Virtual router (VyOS, FRRouting) \\
\hline
WAN optimizer & Virtual WAN optimizer \\
\hline
Intrusion Detection / Prevention (IDS/IPS) & Virtual IDS (Snort, Suricata) \\
\hline
\end{tabular}
\end{center}

\footnotesize ETSI GS NFV 002, "NFV Architectural Framework," v1.2.1, 2014.

## NFV + Cloud Integration

- Deploy VNFs on cloud infrastructure (IaaS) $\rightarrow$ **minutes** instead of months
- **Scale horizontally**: add more instances under load
- **Update easily**: software upgrades, no truck rolls
- **Cost reduction**: commodity servers vs specialized hardware

\vfill

No hardware procurement, no shipping, no rack-and-stack.

## SDN + NFV -- Complementary Technologies

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=4cm, minimum height=1.2cm, font=\small, align=center},
    >=Stealth
]
\node[box, fill=blue!15] (sdn) at (-3,0) {SDN\\(How traffic flows)};
\node[box, fill=green!15] (nfv) at (3,0) {NFV\\(What processes traffic)};

\draw[<->, very thick, red] (sdn) -- node[above, font=\small] {Complementary} (nfv);

\node[font=\scriptsize, text=gray, align=center] at (-3,-1.2) {Centralized control\\Programmable forwarding\\API-driven};
\node[font=\scriptsize, text=gray, align=center] at (3,-1.2) {Software-based functions\\Runs on commodity HW\\Scalable, flexible};
\end{tikzpicture}
\end{center}

- SDN **steers** traffic to the right VNF (forwarding rules)
- NFV **processes** the traffic (filter, balance, encrypt, inspect)

## Discussion: When Hardware Still Wins

\begin{center}
\Large\textit{Can you think of a scenario where a physical\\appliance is better than a VNF?}
\end{center}

\vfill

- Hint: think about latency, throughput, and specialized workloads
- What about hardware accelerators (FPGAs, SmartNICs)?

# From VLANs to Overlay Networks

## The VLAN Scalability Problem

- In Block 4 we used **VLANs** to isolate tenants on virtual networks
- VLANs use a **12-bit ID** $\rightarrow$ maximum **4,096** virtual networks
- Cloud providers host **millions** of tenants $\rightarrow$ VLANs are not enough
- Additional limitations:
  - VLANs are confined to a **single L2 domain**
  - Moving a VM to another host may require VLAN reconfiguration

\vfill
\footnotesize
We need a technology that scales beyond 4K networks and works across L3 boundaries.

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
  - $2^{24}$ = **16 million** virtual networks (vs 4,096 VLANs)
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
Overlays are the foundation of cloud networking: every virtual network (VPC) you create runs on top of VXLAN or similar protocols.

Source: IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

## Discussion: Overlay Networks

\begin{center}
\Large\textit{Why can the physical network remain simple\\if we use overlay networks?\\What are the trade-offs of encapsulation?}
\end{center}

\vfill

Hints: think about overhead (extra headers), MTU implications, and troubleshooting complexity.

# Container Networking

## Containers -- Deep Dive (Expanding Block 4 Overview)

- In Block 4 we compared VMs vs containers at a high level
- Now: **how containers actually work**
- Containers share the **host kernel** (unlike VMs with full guest OS)
- Isolation via Linux kernel features:
  - **Namespaces**: isolate process trees, network stack, filesystem
  - **cgroups**: limit CPU, memory, I/O per container
- **Docker**: most popular container platform
  - Packages app + dependencies into a **container image**
  - Image runs as a **container**: lightweight, portable, reproducible

\footnotesize Docker, Inc., "Docker Overview," docs.docker.com; OCI, "Open Container Initiative," opencontainers.org.

## VM vs Container -- Revisited

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize},
    >=Stealth
]
% VMs
\node[font=\small\bfseries] at (-3.5,3.5) {Virtual Machines};
\node[box, fill=gray!20] (hw1) at (-3.5,0) {Hardware};
\node[box, fill=blue!15] (hyp) at (-3.5,0.7) {Hypervisor};
\node[box, fill=green!15] (os1) at (-4.8,1.4) {OS};
\node[box, fill=green!15] (os2) at (-3.5,1.4) {OS};
\node[box, fill=green!15] (os3) at (-2.2,1.4) {OS};
\node[box, fill=orange!15] (a1) at (-4.8,2.1) {App};
\node[box, fill=orange!15] (a2) at (-3.5,2.1) {App};
\node[box, fill=orange!15] (a3) at (-2.2,2.1) {App};

% Containers
\node[font=\small\bfseries] at (3.5,3.5) {Containers};
\node[box, fill=gray!20] (hw2) at (3.5,0) {Hardware};
\node[box, fill=yellow!15] (hos) at (3.5,0.7) {Host OS};
\node[box, fill=blue!15] (eng) at (3.5,1.4) {Container Engine};
\node[box, fill=orange!15] (c1) at (2.2,2.1) {App};
\node[box, fill=orange!15] (c2) at (3.5,2.1) {App};
\node[box, fill=orange!15] (c3) at (4.8,2.1) {App};

\node[font=\scriptsize, text=gray] at (-3.5,2.9) {3 OS instances (GBs, minutes)};
\node[font=\scriptsize, text=gray] at (3.5,2.9) {Shared kernel (MBs, seconds)};
\end{tikzpicture}
\end{center}

- VMs: **minutes** to start, **GBs** in size, 3 full OS running
- Containers: **milliseconds** to start, **MBs** in size, shared kernel
- In practice: containers often run **inside** VMs for extra isolation

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

## Container Networking -- Visual

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

## Microservices -- From Monolith to Distributed

- **Monolithic** app: one big process, one deployment, one codebase
- **Microservices**: app split into small, independent services
  - Each service runs in its **own container**
  - Services communicate over the **network** (HTTP/REST, gRPC Remote Procedure Call)

\vfill

Network implications:

- Hundreds of containers talking to each other
- Need **service discovery**: "where is the payment service?"
- Need **load balancing**: distribute requests across replicas
- Need **observability**: trace requests across services

## Microservices -- Network Challenges

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

## Infrastructure as Code (IaC)

- **IaC**: manage infrastructure through **code files**, not manual clicks
- Describe desired state in a configuration file $\rightarrow$ tools apply it automatically

Key benefits:

- **Reproducibility**: same config $\rightarrow$ same infrastructure, every time
- **Version control**: track changes in Git, review, rollback
- **Automation**: no manual steps $\rightarrow$ fewer human errors
- **Speed**: deploy entire environments in minutes

\footnotesize Morris, *Infrastructure as Code*, 2nd ed., O'Reilly, 2021.

## IaC Example -- Terraform (Conceptual)

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

# Emerging Trends

## Serverless Computing (FaaS)

- **Serverless** (Function as a Service, FaaS):
  - Deploy individual **functions**, not entire servers
  - Triggered by **events** (HTTP request, file upload, timer)
  - Provider manages **all infrastructure**: zero server management
  - Pay only for **execution time** (measured in milliseconds)

- Examples: **AWS Lambda**, **Azure Functions**, **Google Cloud Functions**

\vfill

Trade-offs: less control, potential vendor lock-in, cold start latency.

\footnotesize AWS, "AWS Lambda Documentation," docs.aws.amazon.com/lambda.

## Edge Computing

- **Edge computing**: process data **close to where it is generated**
- Instead of sending everything to a central cloud $\rightarrow$ process at the edge
- Benefits:
  - **Lower latency** (critical for IoT, autonomous vehicles, AR/VR, gaming)
  - **Less bandwidth** (filter and aggregate data locally)
  - **Better privacy** (data stays closer to the source)

\vfill

Cloud and edge are **complementary**, not competing:

- Edge: real-time, latency-sensitive tasks
- Cloud: heavy computation, long-term storage, analytics

\footnotesize ETSI, "Multi-access Edge Computing (MEC)," etsi.org/technologies/multi-access-edge-computing.

## The Full Picture -- Where Everything Fits

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
7. Docker, Inc., "Docker Overview and Networking," docs.docker.com.
8. OCI, "Open Container Initiative Runtime and Image Specifications," opencontainers.org.
9. Morris, *Infrastructure as Code*, 2nd ed., O'Reilly, 2021.
10. HashiCorp, "Terraform Documentation," terraform.io/docs.
11. AWS, "AWS Lambda Documentation," docs.aws.amazon.com/lambda.
12. ETSI, "Multi-access Edge Computing (MEC)," etsi.org/technologies/multi-access-edge-computing.
13. Goransson & Black, *Software Defined Networks*, 2nd ed., Morgan Kaufmann, 2017.
14. Kurose & Ross, *Computer Networking: A Top-Down Approach*, 8th ed., Pearson, 2021.
15. IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
16. IETF RFC 8926, "Geneve: Generic Network Virtualization Encapsulation," 2020.

# Session Summary

## Key Takeaways

1. Traditional networks are **manual, rigid, and do not scale**
2. **SDN** separates control from data plane $\rightarrow$ centralized, programmable
3. **NFV** replaces hardware appliances with software $\rightarrow$ flexible, cheap
4. SDN + NFV are **complementary**: SDN steers, NFV processes
5. **VXLAN** overlays scale isolation to 16M networks (vs 4K VLANs)
6. **Containers** are lightweight (shared kernel), networked via bridges/overlays
7. **Microservices** = many containers communicating over the network
8. **IaC** automates infrastructure $\rightarrow$ reproducible, fast, auditable

## Discussion

\begin{center}
\Large\textit{A company runs 200 microservices in containers.\\One Friday at 5 PM, a manual network change\\breaks communication for 50 of them.\\How could SDN and IaC have prevented this?}
\end{center}

\vfill

<!-- nota: guiar hacia: SDN da visibilidad global y control centralizado, IaC permite rollback instantáneo con git revert, ambos eliminan la configuración manual que causó el error -->

Hints: centralized control, automated testing, instant rollback, reproducibility.
