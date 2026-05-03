---
title: "Block 4 -- Cloud Computing"
subtitle: "S2: Cloud Computing \\& Cloud Architecture"
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

# From Virtualization to Cloud

## If We Can Virtualize Everything... Why Not Sell It?

\begin{center}
\Large\textit{Virtualization is the technology.\\Cloud computing is the business model.}
\end{center}

\vfill

**Learning objectives:**

1. Understand cloud computing's definition and essential characteristics
2. Distinguish IaaS (Infrastructure as a Service), PaaS (Platform as a Service), and SaaS (Software as a Service) and identify key cloud platforms
3. Design a cloud virtual network with subnets, route tables, and security controls
4. Identify essential cloud network services: load balancers, proxies, and VPNs

## Recap -- What We Virtualized (Session 1)

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2cm, minimum height=0.7cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15] (vm) at (0,0) {VM /\\Container};
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

- **Compute**: VMs share physical hardware via hypervisors; containers share the host kernel directly
- **Networking**: Virtual NICs, Switches, and Routers replicate the physical stack in software
- **Isolation**: VLANs and overlay networks separate tenants on shared infrastructure

## The Leap to Cloud

- Virtualization = technology (**how** you run multiple workloads)
- Cloud = business model (**what** you sell to customers)

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|}
\hline
\rowcolor{blue!10} \textbf{Virtualization} & \textbf{Cloud Computing} \\
\hline
Run multiple VMs/containers on one host & Offer compute as a \textbf{service} \\
\hline
Internal IT optimization & External/internal consumption \\
\hline
Manual provisioning possible & \textbf{Automated, self-service} \\
\hline
You own the hardware & Provider owns the hardware \\
\hline
\end{tabular}
\end{center}

\vfill

Key difference: **automation and self-service** (no phone calls, no tickets, no waiting).

## Discussion: From Virtualization to Cloud

\begin{center}
\Large\textit{Your company already runs VMs on its own servers.\\Why would you move to the cloud instead of\\keeping everything in-house?}
\end{center}

\vfill

Hints: think about CapEx vs OpEx, scaling speed, and who manages what.

# Fundamentals of Cloud Computing

## Cloud Computing -- Definition (NIST)

\begin{quote}
\textit{A model for enabling ubiquitous, convenient, \textbf{on-demand network access} to a shared pool of configurable computing resources that can be rapidly provisioned and released with minimal management effort.}
\end{quote}

- **Ubiquitous**: anywhere, any device
- **On-demand**: no tickets, provision instantly
- **Shared pool**: many tenants, same hardware
- **Configurable**: choose CPU, RAM, storage, network
- **Rapidly provisioned**: up and running in seconds
- **Minimal management**: provider handles the hardware

\vfill
\footnotesize
Source: NIST SP 800-145 (2011). Still the standard definition used industry-wide.

## Five Essential Characteristics

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} \\
\hline
On-demand self-service & Provision resources via portal/API, no human interaction \\
\hline
Broad network access & Available from any device over the network \\
\hline
Resource pooling & Shared infrastructure, multi-tenant \\
\hline
Rapid elasticity & Scale up/down automatically (e.g. Black Friday $\rightarrow$ 10$\times$) \\
\hline
Measured service & Pay only for what you use (CPU-hours, GB stored) \\
\hline
\end{tabular}
\end{center}

\vfill

- **All five** must be present to qualify as "cloud computing"

## Cloud Service Models -- The Stack

\begin{center}
\begin{tikzpicture}[
    layer/.style={draw, thick, minimum width=10cm, minimum height=0.9cm, font=\small},
    >=Stealth
]
\node[layer, fill=orange!20] (app) at (0,3) {Applications};
\node[layer, fill=orange!20] (data) at (0,2.1) {Data};
\node[layer, fill=yellow!20] (runtime) at (0,1.2) {Runtime / Middleware};
\node[layer, fill=yellow!20] (os) at (0,0.3) {Operating System};
\node[layer, fill=blue!15] (virt) at (0,-0.6) {Virtualization};
\node[layer, fill=blue!15] (hw) at (0,-1.5) {Servers / Storage / Networking};

\draw[decorate, decoration={brace, amplitude=8pt}, thick, red] (5.5,3.4) -- (5.5,-1.9) node[midway, right=10pt, font=\small, text=red] {SaaS};
\draw[decorate, decoration={brace, amplitude=8pt}, thick, orange] (6.8,1.6) -- (6.8,-1.9) node[midway, right=10pt, font=\small, text=orange] {PaaS};
\draw[decorate, decoration={brace, amplitude=8pt}, thick, blue] (8.1,-0.2) -- (8.1,-1.9) node[midway, right=10pt, font=\small, text=blue] {IaaS};
\end{tikzpicture}
\end{center}

<!-- nota: ir de abajo a arriba, explicando qué gestiona el proveedor vs el cliente en cada modelo -->

## IaaS, PaaS, SaaS -- In Practice

\small

**IaaS** (e.g. AWS EC2, Azure VMs, Google Compute Engine):

- Provider gives you VMs, storage, networks. You manage everything else
- "I want a Linux server in Frankfurt, 4 CPUs, 16 GB RAM, right now"

\vspace{0.2cm}

**PaaS** (e.g. Google App Engine, AWS Elastic Beanstalk, Heroku):

- Provider gives you runtime + tools. You only manage your code and data
- "I wrote a Python web app. Just run it, I do not care about servers"

\vspace{0.2cm}

**SaaS** (e.g. Google Workspace, Microsoft 365, Slack, Zoom):

- Provider gives you a complete application. You manage your data only
- "I need email for 500 employees. I do not want to run a mail server"

## Service Models -- Who Manages What?

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|c|c|c|}
\hline
\rowcolor{blue!10} \textbf{Component} & \textbf{IaaS} & \textbf{PaaS} & \textbf{SaaS} \\
\hline
Applications & You & You & \cellcolor{blue!15}Provider \\
\hline
Data & You & You & You \\
\hline
Runtime / Middleware & You & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
Operating System & You & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
Virtualization & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
Hardware & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
Network Services (LB, Proxy, VPN) & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
\end{tabular}
\end{center}

- IaaS $\rightarrow$ SaaS: **less control, less responsibility**
- Major providers (AWS, Azure, GCP) offer all three models

## Discussion: Cloud Fundamentals

\begin{center}
\Large\textit{A university wants to offer a web-based tool\\for students to submit assignments.\\Should they choose IaaS, PaaS, or SaaS? Why?}
\end{center}

\vfill

Hints: consider the IT team size, maintenance burden, and how much control they need.

# Cloud & Container Platforms

## Putting It All Together

- In Session 1 we saw the **building blocks**: Virtual Switches, Virtual Routers, Virtual NICs, VLANs
- These components do not run in isolation; they are managed by **platforms**
- Platforms orchestrate **VMs** or **containers** and configure virtual networking under the hood

\vspace{0.3cm}

Two categories:

- **Cloud platforms**: manage infrastructure at scale
  - Compute, storage, networking, and **VMs**
- **Container orchestration platforms**: deploy and scale **containerized** applications

## Cloud Platforms

\scriptsize

- **Self-managed / Private Cloud**: you own or rent the servers, install and manage the virtualization software yourself. Full control, but requires dedicated staff and expertise.

\vspace{0.1cm}

\renewcommand{\arraystretch}{1.2}
\scriptsize
\begin{tabular}{|l|l|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
OpenStack & Open-source, widely used in private clouds & \includegraphics[height=0.4cm]{img/openstack-logo.png} \\
\hline
VMware vSphere & Enterprise leader, proprietary & \includegraphics[height=0.32cm]{img/vmware-logo.png} \\
\hline
Proxmox VE & Open-source, lightweight alternative & \includegraphics[height=0.32cm]{img/proxmox-logo.png} \\
\hline
\end{tabular}

\vspace{0.2cm}

\scriptsize

- **Managed / Public Cloud**: rent capacity on demand, pay-as-you-go. Provider handles hardware, networking, cooling, security, and updates.

\vspace{0.1cm}

\begin{tabular}{|l|l|c|}
\hline
\rowcolor{blue!10} \textbf{Provider} & \textbf{Description} & \textbf{Logo} \\
\hline
Amazon Web Services & Market leader since 2006 & \includegraphics[height=0.3cm]{img/aws-logo.png} \\
\hline
Microsoft Azure & Strong enterprise integration & \includegraphics[height=0.32cm]{img/azure-logo.png} \\
\hline
Google Cloud Platform & Data and AI focus & \includegraphics[height=0.25cm]{img/gcp-logo.png} \\
\hline
\end{tabular}

\vfill
\footnotesize
These map directly to the IaaS model we just covered: the provider (or you) manages compute, storage, and networking.

## Public Cloud vs Private Cloud: What You Manage

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|c|c|}
\hline
\rowcolor{blue!10} \textbf{Component} & \textbf{Public Cloud} & \textbf{Private Cloud} \\
\hline
Applications & You & You \\
\hline
Data & You & You \\
\hline
Runtime / Middleware & You (IaaS) / Provider (PaaS) & You \\
\hline
Operating System & You (IaaS) / Provider (PaaS) & You \\
\hline
Virtualization & \cellcolor{blue!15}Provider & You \\
\hline
Hardware & \cellcolor{blue!15}Provider & You \\
\hline
Networking & \cellcolor{blue!15}Provider & You \\
\hline
Cooling / Power & \cellcolor{blue!15}Provider & You \\
\hline
\end{tabular}
\end{center}

\vfill
\footnotesize Public cloud trades control for simplicity; private cloud gives full control at the cost of operational overhead.

## Container Orchestration Platforms

\scriptsize

- **Self-hosted / Private**: you install and operate on your own servers

\vspace{0.1cm}

\renewcommand{\arraystretch}{1.2}
\scriptsize
\begin{tabular}{|l|l|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
Docker & Container runtime; works well on a single host & \includegraphics[height=0.4cm]{img/docker-logo.png} \\
& Managing hundreds of containers across hosts? Unmanageable & \\
\hline
Kubernetes (K8s) & Created to solve this: scheduling, scaling, networking, self-healing & \includegraphics[height=0.5cm]{img/kubernetes-logo.png} \\
\hline
OpenShift & Enterprise K8s by Red Hat; adds security, CI/CD, UI & \includegraphics[height=0.45cm]{img/openshift-logo.png} \\
\hline
\end{tabular}

\vspace{0.2cm}
\scriptsize

- **Hosted / Public**: cloud providers offer the same platforms as managed services. Each provider uses different names for essentially the same product (e.g., AWS ECS/EKS, Azure AKS, Google GKE, OpenShift on all major clouds).

## Discussion: Platforms

\begin{center}
\Large\textit{A startup with 5 engineers needs to deploy\\a web application that may go from 100 to 100,000 users.\\Would you build a private cloud or use a public one? Why?}
\end{center}

\vfill

Hints: team size, upfront cost, time to market, scaling needs, control over infrastructure.

# Cloud Network Architecture

## Virtual Networks in the Cloud

- Every cloud provider lets you create your own **isolated virtual network**
  - AWS: Virtual Private Cloud (VPC)
  - Azure: Virtual Network (VNet)
  - GCP: VPC Network

\vspace{0.2cm}

- Think of it as your **private data center network** in the cloud

\vspace{0.2cm}

- You define:
  - **Address space** (e.g., `10.0.0.0/16`)
  - **Subnets** (subdivisions of the address space)
  - **Routing rules** and **security policies**

\vfill

<!-- nota: el virtual network usa overlays VXLAN por debajo — se cubrirán en Block 5 -->

Key: under the hood, cloud providers use **overlay networks** (covered in Block 5) to isolate tenants at scale.

## Virtual Network Architecture

\begin{center}
\begin{tikzpicture}[
    vpc/.style={draw, thick, dashed, blue, rounded corners, inner sep=10pt},
    subnet/.style={draw, thick, rounded corners, minimum width=3cm, minimum height=1.5cm, font=\small},
    inst/.style={draw, thick, fill=green!15, rounded corners, minimum width=1cm, minimum height=0.5cm, font=\scriptsize},
    >=Stealth
]
% VPC box
\node[vpc, fit={(-4.5,-1.5)(4.5,2.5)}, label=above:{\small\textbf{Virtual Network: 10.0.0.0/16}}] (vpc) {};

% Public subnet
\node[subnet, fill=yellow!10] (pub) at (-2,0.5) {};
\node[font=\scriptsize\bfseries] at (-2,1.5) {Public Subnet};
\node[font=\tiny] at (-2,1.1) {10.0.1.0/24};
\node[inst] (web) at (-2,0.3) {VM: Web Server};

% Private subnet
\node[subnet, fill=gray!10] (priv) at (2,0.5) {};
\node[font=\scriptsize\bfseries] at (2,1.5) {Private Subnet};
\node[font=\tiny] at (2,1.1) {10.0.2.0/24};
\node[inst] (db) at (2,0.3) {VM: Database};

% Internet gateway
\node[draw, thick, fill=orange!20, rounded corners, font=\scriptsize] (igw) at (-2,-2.5) {Internet GW};
\node[font=\scriptsize] (inet) at (-2,-4.2) {Internet};

\draw[<->, thick] (web) -- (igw);
\draw[<->, thick] (igw) -- (inet);
\draw[<->, thick, dashed] (web) -- (db);
\end{tikzpicture}
\end{center}

## Subnets -- Public vs Private

Cloud providers distinguish between subnets reachable from the Internet and isolated ones: not all workloads should be exposed. Web servers need public access, while databases and backends must stay hidden. Subnets enforce this boundary at the network level.

\vspace{0.2cm}

**Public subnet:**

- Has a route to an **Internet Gateway**
- Instances can have **public IP addresses**
- Use for: web servers, load balancers, bastion hosts

**Private subnet:**

- **No route** to the Internet; isolated by design
- Instances only have **private IPs**
- Use for: databases, internal services, backends

## Route Tables

Every virtual network has an implicit virtual router managed by the provider. Route tables tell that router where to forward traffic.

- Each subnet is associated with a **route table**
- Route table = set of rules determining where traffic goes

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Destination} & \textbf{Target / Next Hop} & \textbf{Subnet type} \\
\hline
\texttt{10.0.0.0/16} & local (within virtual network) & Public + Private \\
\hline
\texttt{0.0.0.0/0} & Internet Gateway & Public only \\
\hline
\end{tabular}
\end{center}

- **Local route**: traffic within the virtual network stays inside (always present)
- **Default route** (`0.0.0.0/0`): public subnets exit via the Internet Gateway
- Private subnets have no default route; they are isolated by design

## Internet Gateway

In a cloud virtual network, instances are isolated by default. The Internet Gateway is the controlled entry and exit point between a virtual network and the Internet.

\vspace{0.2cm}

- **Outbound only**: instance can reach the Internet, but is not reachable from outside
  - No public IP needed; the provider performs NAT transparently
- **Bidirectional**: instance is also reachable from the Internet
  - Requires a **public IP** assigned to the instance
  - Use for: web servers, load balancers, anything public-facing

\vfill

\footnotesize Note: a NAT Gateway can optionally be added for private instances that need outbound Internet access (e.g. downloading updates), without exposing them inbound.

## Security Groups -- Instance-Level Firewall

Once traffic reaches an instance, you still need to control what it can send and receive. Security groups act as a per-instance firewall.

\vspace{0.2cm}

- **Security group** = virtual firewall attached to an instance
- Rules specify allowed **inbound** and **outbound** traffic
- **Stateful**: allow inbound $\rightarrow$ response automatically allowed

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Direction} & \textbf{Protocol} & \textbf{Port} & \textbf{Source/Dest} \\
\hline
Inbound & TCP & 80 & \texttt{0.0.0.0/0} \\
\hline
Inbound & TCP & 443 & \texttt{0.0.0.0/0} \\
\hline
Inbound & TCP & 22 & \texttt{10.0.0.0/16} \\
\hline
Outbound & All & All & \texttt{0.0.0.0/0} \\
\hline
\end{tabular}
\end{center}

<!-- nota: por defecto todo denegado inbound, todo permitido outbound -->

\vfill
\footnotesize
Source: AWS, "Security Groups for Your VPC," docs.aws.amazon.com.

## Network ACLs (Access Control Lists) -- Subnet-Level Firewall

Security groups protect individual instances. Network ACLs add an additional layer of control at the subnet boundary, before traffic even reaches any instance.

\vspace{0.2cm}

- **Network ACL** = firewall at the **subnet** level
- Rules evaluated in **order** (numbered, first match wins)
- **Stateless**: must explicitly allow both inbound AND outbound

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Rule \#} & \textbf{Direction} & \textbf{Protocol} & \textbf{Port} & \textbf{Action} \\
\hline
100 & Inbound & TCP & 80 & ALLOW \\
\hline
200 & Inbound & TCP & 443 & ALLOW \\
\hline
* & Inbound & All & All & DENY \\
\hline
\end{tabular}
\end{center}

\vfill
\footnotesize
Source: AWS, "Network ACLs," docs.aws.amazon.com.

## Security Groups vs Network ACLs

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Security Groups} & \textbf{Network ACLs} \\
\hline
Scope & Instance level & Subnet level \\
\hline
State & Stateful & Stateless \\
\hline
Rules & Allow only & Allow + Deny \\
\hline
Evaluation & All rules evaluated & First match wins \\
\hline
Default & Deny all inbound & Allow all \\
\hline
\end{tabular}
\end{center}

\vfill

**Defense in depth**: use both together.

- Security Groups $\rightarrow$ fine-grained per-instance control
- Network ACLs $\rightarrow$ broad subnet-level guardrails

## Discussion: Cloud Networking

\begin{center}
\Large\textit{You deploy a web application in your cloud virtual network.\\The web server needs to be public, but the database\\must not be reachable from the Internet. How?}
\end{center}

\vfill

Hints: think about public vs private subnets, security groups, and NAT gateways.

# Cloud Network Services

## Cloud Network Services: Overview

Beyond virtual networks and security controls, public cloud providers offer managed network services that simplify common infrastructure tasks, such as:
\vspace{0.3cm}

1. **Load Balancer (LB)**
2. **Proxy**
3. **Reverse Proxy**
4. **VPN (Virtual Private Network)**

\vspace{0.3cm}

These services run as **managed offerings**: no servers to install or maintain.

\vfill
\footnotesize Note: Proxy, Reverse Proxy, and VPN will be covered in depth in Block 6. Here we introduce them briefly.

## Load Balancer

- Distributes incoming traffic across **multiple instances** (VMs or containers)
- Prevents any single instance from being overwhelmed
- If one instance fails, traffic is **redirected** to healthy ones

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.8cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[font=\scriptsize] (client) at (0,0) {Clients};
\node[box, fill=blue!20] (lb) at (3.5,0) {Load Balancer};
\node[box, fill=green!15] (s1) at (7,1) {Instance 1};
\node[box, fill=green!15] (s2) at (7,0) {Instance 2};
\node[box, fill=green!15] (s3) at (7,-1) {Instance 3};

\draw[->, thick] (client) -- (lb);
\draw[->, thick] (lb) -- (s1);
\draw[->, thick] (lb) -- (s2);
\draw[->, thick] (lb) -- (s3);
\end{tikzpicture}
\end{center}

- **L4 (Transport Layer)** Load Balancer: routes based on IP and port (fast, simple)
- **L7 (Application Layer)** Load Balancer: routes based on HTTP headers, URL path, cookies (smarter)
- Cloud examples: AWS ALB/NLB, Azure Load Balancer, GCP Cloud Load Balancing

\footnotesize Source: AWS, "Elastic Load Balancing Documentation," docs.aws.amazon.com.

## Proxy

Without a proxy, every instance in your network reaches the Internet directly: no visibility, no control. A proxy sits in front of clients and mediates all outbound traffic.

- Clients send requests to the proxy, which forwards them to the Internet

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.8cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[box, fill=green!15] (c1) at (0,0.7) {Client 1};
\node[box, fill=green!15] (c2) at (0,-0.7) {Client 2};
\node[box, fill=yellow!20] (proxy) at (3.5,0) {Proxy};
\node[font=\scriptsize] (inet) at (7,0) {Internet};

\draw[->, thick] (c1) -- (proxy);
\draw[->, thick] (c2) -- (proxy);
\draw[->, thick] (proxy) -- (inet);
\end{tikzpicture}
\end{center}

- **Access control**: block certain websites or domains
  - Security: block known malicious domains
  - Company policy: restrict access to non-work-related content
- **Caching**: store frequently accessed content, reduce bandwidth
- **Logging**: monitor what employees or VMs access
- Examples: Squid, corporate firewalls with proxy mode

## Reverse Proxy

A reverse proxy sits in front of backend servers and mediates all inbound traffic. Clients never communicate directly with the backend.

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.8cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[font=\scriptsize] (client) at (0,0) {Clients};
\node[box, fill=orange!20] (rp) at (3.5,0) {Reverse Proxy};
\node[box, fill=green!15] (api) at (7.5,0.7) {API Server};
\node[box, fill=purple!15] (web) at (7.5,-0.7) {Web App};

\draw[->, thick] (client) -- node[above, font=\tiny] {HTTPS} (rp);
\draw[->, thick] (rp) -- node[above, font=\tiny] {/api/*} (api);
\draw[->, thick] (rp) -- node[below, font=\tiny] {/*} (web);
\end{tikzpicture}
\end{center}

- **TLS termination**: handles HTTPS, backends receive plain HTTP
- **URL routing**: directs requests to the right backend service
- **Hides backend servers**: clients only see the proxy's address
- Examples: NGINX, HAProxy, AWS CloudFront, Azure Front Door

\vfill
\footnotesize Will be covered in depth in Block 6.

## VPN -- Virtual Private Network

- A **VPN (Virtual Private Network)** creates a **secure, encrypted tunnel** over the public Internet
- Connects remote networks or users as if they were on the same private network

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.8cm, minimum height=0.8cm, font=\scriptsize, align=center},
    >=Stealth
]
% User
\node[box, fill=green!15] (user) at (0,0) {User /\\Office};

% Internet cloud
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2cm, minimum height=1.2cm, font=\scriptsize] (inet) at (5,0) {Internet};

% Cloud VPN endpoint
\node[box, fill=blue!15] (vpn) at (10,0) {Cloud\\Network};

% Encrypted tunnel
\draw[<->, thick, blue, double] (user) -- node[above, font=\tiny, text=blue] {Encrypted VPN tunnel} (inet);
\draw[<->, thick, blue, double] (inet) -- (vpn);

% Eavesdropper blocked
\node[box, fill=red!10] (evil) at (5,-2.2) {Attacker};
\draw[thick, red] (5,-0.8) -- (5,-1.6);
\node[font=\Large, text=red] at (5,-1.2) {\texttimes};

\end{tikzpicture}
\end{center}

\vfill

<!-- nota: VPNs will be covered in depth in Block 6 -->
\footnotesize VPNs will be covered in depth in Block 6.

## Discussion: Cloud Network Services

\begin{center}
\Large\textit{You are deploying a web application.\\When does it make sense to add a Load Balancer?\\When would you not need one?}
\end{center}

\vfill

Hints: think about the number of users, availability requirements, and what happens if your single instance goes down.

# Session Summary

## Key Takeaways

1. Virtualization is the **technology**; cloud is the **business model**
2. Five NIST characteristics define true cloud computing
3. **IaaS / PaaS / SaaS** differ in who manages what
4. Cloud and container **platforms** deliver these models at scale
5. A **virtual network** is your isolated cloud network (CIDR, subnets, route tables)
6. **Security groups** (instance) + **ACLs** (subnet) = defense in depth
7. **Load balancers**, **proxies**, **reverse proxies**, and **VPNs** are essential cloud network services

## References

\footnotesize

1. NIST SP 800-145, Mell & Grance, "The NIST Definition of Cloud Computing," 2011.
2. AWS, "Amazon VPC User Guide," docs.aws.amazon.com.
3. Microsoft Azure, "Azure Virtual Network Documentation," docs.microsoft.com.
4. Google Cloud, "VPC Documentation," cloud.google.com/vpc/docs.
5. CSA, "Security Guidance for Critical Areas of Focus in Cloud Computing v5," 2022.
6. Erl, Puttini & Mahmood, \textit{Cloud Computing: Concepts, Technology \& Architecture}, Prentice Hall, 2013.
7. Kurose & Ross, \textit{Computer Networking: A Top-Down Approach}, 8th ed., Pearson, 2021.
8. AWS, "Elastic Load Balancing Documentation," docs.aws.amazon.com.
9. NGINX, Inc., "What Is a Reverse Proxy?," nginx.com/resources.
10. AWS, "AWS VPN Documentation," docs.aws.amazon.com.
