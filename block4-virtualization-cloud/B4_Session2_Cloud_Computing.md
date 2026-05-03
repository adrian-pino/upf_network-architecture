---
title: "Block 4 -- Cloud Computing"
subtitle: "S2: Cloud Computing \\& Cloud Architectures"
author: "Arquitectura de Xarxes"
institute: "Universitat Pompeu Fabra"
date: "2025-2026"
theme: "upf"
aspectratio: 169
toc: true
header-includes:
  - \usepackage{booktabs}
  - \usepackage[table]{xcolor}
  - \usepackage{tikz}
  - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, shapes.symbols, fit, decorations.pathreplacing}
  - \setbeamerfont{footnote}{size=\tiny}
  - \titlegraphic{Adrián Pino \texttt{<adrian.pino@upf.edu>}}
---

# From Virtualization to Cloud

## If We Can Virtualize Everything... Why Not Sell It?

\begin{center}
\Large\textit{Virtualization is the technology.\\Cloud computing is the business model.}
\end{center}

\vfill

**Learning objectives:**

1. Understand cloud computing's definition and essential characteristics
2. Distinguish IaaS (Infrastructure as a Service), PaaS (Platform as a Service), and SaaS (Software as a Service)
3. Design a cloud virtual network with subnets, security controls, and network services

## Meet the Scenario: A Startup from Zero

\begin{block}{Running example for this session}
\textbf{CloudBite} is a 3-person startup that just received seed funding. They need to deploy a food-delivery web app for thousands of users \textbf{by next month}. They have laptops, code, and zero infrastructure.
\end{block}

\vspace{0.3cm}

Every section answers the next question CloudBite faces:

1. "We know about VMs. Why not just buy servers?" $\rightarrow$ \textbf{From Virtualization to Cloud}
2. "What exactly is cloud computing?" $\rightarrow$ \textbf{Fundamentals}
3. "Which platform do we use?" $\rightarrow$ \textbf{Platforms}
4. "We picked AWS. Now we need a network." $\rightarrow$ \textbf{Cloud Network Architecture}
5. "We need HTTPS, traffic distribution, and office access." $\rightarrow$ \textbf{Network Services}
6. "Is the cloud always the right choice?" $\rightarrow$ \textbf{The Cloud Trade-Off}

## Recap: What We Virtualized (Session 1)

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

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.8cm}
\Large\textit{Your company already runs VMs on its own servers. Why would you move to the cloud instead of keeping everything in-house?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Capital expenditure vs operational expenditure
- How fast can you scale today?
- Who patches the hardware at 3 am?
- What happens when a disk fails?

:::
::::::::::::::

# Fundamentals of Cloud Computing

## CloudBite Asks: "What Exactly Is Cloud Computing?"

<!-- nota: transition slide — connects scenario to section content -->

- The founders are convinced: buying servers is not an option
- But "the cloud" is a vague term; every vendor defines it differently
- Before choosing a provider, CloudBite needs to understand **what cloud computing actually means** and **what service model fits their needs**

\vfill

\begin{center}
\textit{Let us start with the industry-standard definition.}
\end{center}

## Cloud Computing: Definition (NIST)

\begin{block}{NIST SP 800-145 (2011)}
\textit{"A model for enabling ubiquitous, convenient, \textbf{on-demand network access} to a \textbf{shared pool} of configurable computing resources that can be rapidly provisioned and released with \textbf{minimal management effort}."}
\end{block}

\vspace{0.3cm}

Three phrases to remember:

- **On-demand**: you get resources immediately, no human approval needed
- **Shared pool**: underlying hardware is shared across many customers (multi-tenancy)
- **Minimal effort**: you click a button (or call an API); the provider handles the rest

\footnote{NIST SP 800-145, Mell \& Grance, 2011. Still the standard definition used industry-wide.}

## Five Essential Characteristics

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via portal or Application Programming Interface (API), no human & AWS console: launch VM in 30 s \\
\hline
Broad network access & Available from any device over the network & Access S3 from laptop, phone, VM \\
\hline
Resource pooling & Shared infrastructure, multi-tenant & Same physical server, different tenants \\
\hline
Rapid elasticity & Scale up/down automatically & Black Friday: $10\times$ more instances \\
\hline
Measured service & Pay only for what you use & Billed per CPU-hour, GB stored \\
\hline
\end{tabular}
\end{center}

\vfill

- **All five** must be present to qualify as "cloud computing"

\footnote{NIST SP 800-145, Mell \& Grance, 2011.}

## Cloud Service Models: The Stack

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

## IaaS, PaaS, SaaS: In Practice

\small

. . .

**IaaS** (e.g. AWS EC2, Azure VMs, Google Compute Engine):

- Provider gives you VMs, storage, networks. You manage everything else
- "I want a Linux server in Frankfurt, 4 CPUs, 16 GB RAM, right now"

\vspace{0.2cm}

. . .

**PaaS** (e.g. Google App Engine, AWS Elastic Beanstalk, Heroku):

- Provider gives you runtime + tools. You only manage your code and data
- "I wrote a Python web app. Just run it, I do not care about servers"

\vspace{0.2cm}

. . .

**SaaS** (e.g. Google Workspace, Microsoft 365, Slack, Zoom):

- Provider gives you a complete application. You manage your data only
- "I need email for 500 employees. I do not want to run a mail server"

## Service Models: Who Manages What?

\begin{center}
\footnotesize
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
\end{tabular}
\end{center}

- IaaS $\rightarrow$ SaaS: **less control, less responsibility**
- Major providers (AWS, Azure, GCP) offer all three models

## Discussion: Cloud Fundamentals

:::::::::::::: {.columns}
::: {.column width="48%"}

\begin{block}{Case A: University}
\small A large university wants a web tool for students to submit assignments. The IT department has 10 staff. Student data must stay within EU jurisdiction. Budget is fixed yearly.
\end{block}

\small
\textbf{Which model? Why?}
- Control over data location needed
- Existing IT team can manage servers
- Ready-made products exist (Canvas, Moodle)
- No need to scale suddenly

:::
::: {.column width="48%"}

\begin{block}{Case B: CloudBite}
\small CloudBite (3 engineers) needs to run a web app, store orders, and send email notifications. They must ship in 4 weeks and cannot afford to manage servers.
\end{block}

\small
\textbf{Which model? Why?}
- No ops bandwidth: avoid IaaS if possible
- Web app: PaaS (just deploy the code)
- Email: SaaS (Mailchimp, SendGrid)
- Database: PaaS managed DB, or IaaS if they need fine-grained control

:::
::::::::::::::

# Cloud & Container Platforms

## CloudBite Asks: "Which Platform Do We Use?"

<!-- nota: transition slide — connects scenario to section content -->

- CloudBite decided on **IaaS**: they want full control over the stack (they are engineers, after all)
- Now they must choose: run their own infrastructure (private cloud) or rent from a provider (public cloud)?
- They also hear about **Kubernetes** everywhere; should they use containers?

\vfill

\begin{center}
\textit{Let us look at the platforms available.}
\end{center}

## Putting It All Together

:::::::::::::: {.columns}
::: {.column width="48%"}

**Building blocks (Session 1)**

- Virtual NIC
- Virtual Switch (bridge)
- Virtual Router
- VLAN / overlay (VXLAN)
- Hypervisor / container runtime

These components are configured and wired together by platforms.

:::
::: {.column width="48%"}

**Platforms that manage them**

- **Cloud platforms**: orchestrate VMs, storage, networking at scale (IaaS)
  - OpenStack, VMware vSphere, AWS, Azure, GCP
- **Container orchestration**: deploy and scale containerized apps
  - Docker, Kubernetes (K8s), OpenShift

:::
::::::::::::::

## Private Cloud Platforms

- **Self-managed**: you own or rent the servers, install and manage the virtualization software yourself
- Full control over hardware and data; requires dedicated staff and expertise
- Typical use: regulated industries (banking, healthcare), large enterprises with existing data centers

\vspace{0.2cm}

\renewcommand{\arraystretch}{1.2}
\small
\begin{tabular}{|l|l|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
OpenStack & Open-source, widely used in private clouds & \includegraphics[height=0.4cm]{img/openstack-logo.png} \\
\hline
VMware vSphere & Enterprise leader, proprietary & \includegraphics[height=0.32cm]{img/vmware-logo.png} \\
\hline
Proxmox VE & Open-source, gaining traction since recent VMware price rises & \includegraphics[height=0.32cm]{img/proxmox-logo.png} \\
\hline
\end{tabular}

## Public Cloud Platforms

- **Managed / Public**: rent capacity on demand, pay-as-you-go
- Provider handles hardware, networking, cooling, security, and updates
- Maps directly to the IaaS model: provider manages compute, storage, and networking

\vspace{0.2cm}

\renewcommand{\arraystretch}{1.2}
\small
\begin{tabular}{|l|l|c|}
\hline
\rowcolor{blue!10} \textbf{Provider} & \textbf{Description} & \textbf{Logo} \\
\hline
Amazon Web Services (AWS) & Market leader since 2006 & \includegraphics[height=0.3cm]{img/aws-logo.png} \\
\hline
Microsoft Azure & Strong enterprise integration & \includegraphics[height=0.32cm]{img/azure-logo.png} \\
\hline
Google Cloud Platform (GCP) & Data and AI focus & \includegraphics[height=0.25cm]{img/gcp-logo.png} \\
\hline
\end{tabular}

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
Kubernetes (K8s) & Created to solve containers running at scale : scheduling, scaling, networking, self-healing & \includegraphics[height=0.5cm]{img/kubernetes-logo.png} \\
\hline
OpenShift & Enterprise K8s by Red Hat; adds security, CI/CD, UI & \includegraphics[height=0.45cm]{img/openshift-logo.png} \\
\hline
\end{tabular}

\vspace{0.2cm}
\scriptsize

- **Hosted / Public**: cloud providers offer the same platforms as managed services. Each provider uses different names for essentially the same product (e.g., AWS ECS/EKS, Azure AKS, Google GKE, OpenShift on all major clouds).

## Discussion: Platforms

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.8cm}
\Large\textit{A startup with 5 engineers needs to deploy a web application that may go from 100 to 100,000 users. Would you build a private cloud or use a public one? Why?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Upfront cost and time to market
- Who manages infrastructure at night?
- Can 5 engineers run a data center?
- What if traffic spikes overnight?

:::
::::::::::::::

# Cloud Network Architecture

## CloudBite Asks: "We Picked AWS. Now What?"

<!-- nota: transition slide — connects scenario to section content -->

- CloudBite chose **AWS** (public cloud, IaaS): no upfront cost, instant global reach
- First task: create an **isolated network** for their application
- They need a **public subnet** for the web frontend and a **private subnet** for the database
- How do subnets, route tables, gateways, and firewalls work in the cloud?

\vfill

\begin{center}
\textit{Time to build CloudBite's virtual network from scratch.}
\end{center}

## Virtual Networks in the Cloud

- Every cloud provider lets you create your own **isolated virtual network**
  - AWS: Virtual Private Cloud (VPC); Azure: Virtual Network (VNet); GCP: VPC Network
- Think of it as your **private data center network** in the cloud
- You define:
  - **Address space** (e.g., `10.0.0.0/16`)
  - **Subnets** (subdivisions of the address space)
  - **Routing rules** and **security policies**

\vfill

<!-- nota: el virtual network usa overlays VXLAN por debajo — se cubrirán en Block 5 -->

Key: under the hood, cloud providers use **overlay networks** (covered in Block 5) to isolate tenants at scale.

\footnote{AWS, "Amazon VPC User Guide"; Azure, "Virtual Network Documentation"; GCP, "VPC Documentation."}

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
\node[inst] (web) at (-2,0.3) {Web Server};

% Private subnet
\node[subnet, fill=gray!10] (priv) at (2,0.5) {};
\node[font=\scriptsize\bfseries] at (2,1.5) {Private Subnet};
\node[font=\tiny] at (2,1.1) {10.0.2.0/24};
\node[inst] (db) at (2,0.3) {Database};

% Internet gateway
\node[draw, thick, fill=orange!20, rounded corners, font=\scriptsize] (igw) at (-2,-2.5) {Internet GW};
\node[font=\scriptsize] (inet) at (-2,-3.5) {Internet};

% NAT gateway
\node[draw, thick, fill=purple!15, rounded corners, font=\scriptsize] (nat) at (2,-2.5) {NAT GW};

\draw[->, thick] (web) -- (igw);
\draw[->, thick] (igw) -- (inet);
\draw[->, thick, dashed] (db) -- (nat);
\draw[->, thick, dashed] (nat) -- (igw);
\end{tikzpicture}
\end{center}

## Subnets: Public vs Private

**Public subnet:**

- Has a route to an **Internet Gateway**
- Instances can have **public IP addresses**
- Accessible from the Internet (if security rules allow)
- Use for: web servers, load balancers, bastion hosts

**Private subnet:**

- **No direct route** to the Internet
- Instances only have **private IPs**
- Can access Internet outbound via **NAT Gateway**
- Use for: databases, internal services, application backends

## Route Tables

- Each subnet is associated with a **route table**
- Route table = set of rules determining where traffic goes

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Destination} & \textbf{Target} & \textbf{Subnet type} \\
\hline
\texttt{10.0.0.0/16} & local (within virtual network) & Both \\
\hline
\texttt{0.0.0.0/0} & Internet Gateway & Public \\
\hline
\texttt{0.0.0.0/0} & NAT Gateway & Private \\
\hline
\end{tabular}
\end{center}

- **Local route**: traffic within the virtual network stays inside (always present)
- **Default route** (`0.0.0.0/0`): where to send everything else
- Public subnets $\rightarrow$ IGW; Private subnets $\rightarrow$ NAT GW

## Internet Gateway vs NAT Gateway

**Internet Gateway** (the front door):

- **Bidirectional**: the world can reach your instance, and it can reach the world
- Instance needs a **public IP**
- Use for: web servers, load balancers, anything public-facing

\vspace{0.3cm}

**NAT Gateway** (the fire exit):

- **One-way**: your instance can reach the Internet (e.g., download updates, call APIs), but nobody outside can reach it directly
- Instance keeps a **private IP** only
- Use for: databases, backends that need to download patches but must stay hidden

\vfill

\footnotesize
Same \textbf{NAT concept from Block 3}, now as a managed cloud service.

## Security Groups: Instance-Level Firewall

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

\footnote{AWS, "Security Groups for Your VPC," docs.aws.amazon.com.}

## Network ACLs (Access Control Lists): Subnet-Level Firewall

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

\footnote{AWS, "Network ACLs," docs.aws.amazon.com.}

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

\begin{alertblock}{Common mistake}
ACLs are \textbf{stateless}: if you allow inbound TCP port 80, you must \emph{also} explicitly allow outbound ephemeral ports (1024--65535) for the response. Forgetting this blocks return traffic.
\end{alertblock}

## Discussion: Cloud Networking

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.8cm}
\Large\textit{You deploy a web application in your cloud virtual network. The web server needs to be public, but the database must not be reachable from the Internet. How?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Public subnet for web server (needs Internet Gateway)
- Private subnet for database (no direct route out)
- Security group on DB: allow only from web server
- NAT Gateway if DB needs outbound access (e.g. patches)

:::
::::::::::::::

# Cloud Network Services

## CloudBite Asks: "We Need HTTPS, Scaling, and Office Access"

<!-- nota: transition slide — connects scenario to section content -->

- CloudBite's app is live, but traffic is growing fast
- A single web server cannot handle the load; they need **traffic distribution**
- The API must be reachable via HTTPS, but the backends should stay hidden
- The CTO also wants to access the cloud network from the office without exposing it to the Internet

\vfill

\begin{center}
\textit{Three services solve these problems: load balancers, proxies, and VPNs.}
\end{center}

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

\footnote{AWS, "Elastic Load Balancing Documentation," docs.aws.amazon.com.}

## Reverse Proxy

- Sits **in front of** backend servers, receives all client requests
- Clients never communicate directly with the backend

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

Key functions:

- **TLS (Transport Layer Security) termination**: handles HTTPS encryption, backends receive plain HTTP
- **URL routing**: `/api/*` $\rightarrow$ API server, `/*` $\rightarrow$ web app
- **Caching**: stores responses to reduce backend load
- Examples: NGINX, HAProxy, AWS CloudFront, Azure Front Door

## Forward Proxy

- Sits **in front of clients**, controls their **outbound** traffic
- Clients send requests to the proxy, which forwards them to the Internet

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=1.8cm, minimum height=0.6cm, font=\scriptsize},
    >=Stealth
]
\node[box, fill=green!15] (c1) at (0,0.7) {Client 1};
\node[box, fill=green!15] (c2) at (0,-0.7) {Client 2};
\node[box, fill=yellow!20] (proxy) at (3.5,0) {Forward Proxy};
\node[font=\scriptsize] (inet) at (7,0) {Internet};

\draw[->, thick] (c1) -- (proxy);
\draw[->, thick] (c2) -- (proxy);
\draw[->, thick] (proxy) -- (inet);
\end{tikzpicture}
\end{center}

Key functions:

- **Access control**: block certain websites or domains
- **Caching**: store frequently accessed content, reduce bandwidth
- **Anonymity**: external servers see the proxy's IP, not the client's
- **Logging**: monitor what employees or VMs access
- Examples: Squid, corporate firewalls with proxy mode

## Reverse Proxy vs Forward Proxy

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Forward Proxy} & \textbf{Reverse Proxy} \\
\hline
Protects & Clients (outbound) & Servers (inbound) \\
\hline
Position & In front of clients & In front of servers \\
\hline
Who knows? & Server sees proxy, not client & Client sees proxy, not server \\
\hline
Use case & Control outbound access & TLS termination, routing, caching \\
\hline
\end{tabular}
\end{center}

\vfill

Think of it this way:

- **Forward proxy**: "I control what my users can access outside"
- **Reverse proxy**: "I control how outside users reach my servers"

## VPN: Virtual Private Network

- A **VPN (Virtual Private Network)** creates a **secure, encrypted tunnel** over the public Internet
- Connects remote networks or users as if they were on the same private network

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2.2cm, minimum height=0.8cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15] (office) at (0,0) {Corporate\\Office};
\node[cloud, draw, thick, fill=cyan!10, cloud puffs=10, cloud puff arc=120, minimum width=2.5cm, minimum height=1.2cm, font=\scriptsize] (inet) at (5,0) {Internet};
\node[box, fill=blue!15] (vpc) at (10,0) {Cloud Virtual\\Network};

\draw[thick, dashed, red] (office) -- node[above, font=\tiny] {Encrypted VPN tunnel} (inet);
\draw[thick, dashed, red] (inet) -- (vpc);
\end{tikzpicture}
\end{center}

Two main types:

- **Site-to-site VPN**: connects two networks (e.g. office $\leftrightarrow$ cloud VPC)
- **Client VPN**: individual user connects to a remote network (e.g. employee working from home)
- Cloud examples: AWS VPN, Azure VPN Gateway, GCP Cloud VPN

## Discussion: Cloud Network Services

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.5cm}
\Large\textit{A company has a public frontend, a private API, and a database. Employees also need to access the cloud from the office. Which services would you use?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Load balancer in front of frontend (public)
- Reverse proxy to route `/api/*` to API server
- Database in private subnet, no public IP
- Site-to-site VPN for office access
- Security groups + ACLs at each tier

:::
::::::::::::::

# The Cloud Trade-Off

## CloudBite, Five Years Later

<!-- nota: transition slide — closes the narrative arc -->

- CloudBite grew to 2 million users. AWS bill: **\$40,000/month** and rising
- Egress fees alone: \$5,000/month (data leaving AWS to users)
- The team now has 30 engineers; they *could* run their own servers
- The CTO asks: "Should we leave the cloud?"

\vfill

\begin{center}
\textit{The cloud is not always the cheapest option. Let us explore why.}
\end{center}

## Case Study: Basecamp Leaves the Cloud

- **Basecamp / 37signals** (creators of Ruby on Rails) ran on AWS for 15 years
- In 2023, they **moved everything to their own hardware**: no new staff needed
- Result: **\$10 million saved over five years** (50\%+ cost reduction)

\vspace{0.3cm}

Why it worked for them:

- **Stable, predictable workload**: no sudden traffic spikes
- **Large, experienced ops team**: already managing servers regardless
- **No need for global presence**: most users in the same region
- They built **Kamal**, an open-source deployment tool, to replace Kubernetes

\vfill

\begin{alertblock}{Key insight}
Basecamp's exit worked because their workload was \textbf{predictable}. For a startup with unpredictable traffic, the cloud's elasticity remains essential.
\end{alertblock}

\footnote{37signals, "We left the cloud," basecamp.com/cloud-exit, 2023.}

## Vendor Lock-In: The Hidden Cost

- Cloud providers design services that are **easy to adopt, hard to leave**
- Proprietary services create **architectural dependencies**:
  - AWS Lambda, DynamoDB, SQS $\rightarrow$ no direct equivalent on Azure or GCP
  - Rewriting the application can cost more than years of cloud bills

\vspace{0.3cm}

- **Data egress fees** make leaving expensive:
  - AWS charges \$0.09/GB for outbound traffic
  - Moving 50 TB out of AWS $\approx$ \$4,500 in fees alone
  - Egress fees increased 20\% in 2023; inter-Availability-Zone (AZ) fees doubled in 2025

\vspace{0.3cm}

- **68\% of enterprises** exceeded their cloud budget due to unexpected data transfer costs (Flexera, 2024)

\footnote{Flexera, "State of the Cloud Report," 2024; AWS pricing documentation, 2025.}

## The Pricing Ratchet

- Cloud providers attract customers with **low initial pricing and free tiers**
- Once adoption deepens, prices increase:
  - AWS EC2 instance families: significant price rises in 2025
  - Azure: 5\%+ on subscriptions, 10\% on Premium SSDs (2025)
  - Google Workspace: 20\%--34\% increase (March 2025)

\vspace{0.3cm}

- This pattern appears across industries:
  - **Video streaming**: low subscription prices to gain users, then steady increases once the audience is locked in
  - **Cloud computing**: same dynamic, but switching costs are higher because your entire architecture depends on the provider

\vfill

\begin{block}{The pattern}
Low prices $\rightarrow$ adoption $\rightarrow$ dependency $\rightarrow$ price increases $\rightarrow$ switching is too expensive.
\end{block}

\footnote{InfotechLead, "AWS, Azure, and Google Cloud adjust billing models in 2025," 2025.}

## So... Cloud or Not?

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Cloud (public)} & \textbf{On-premises / private} \\
\hline
Best when & Unpredictable traffic, small team & Stable workload, large ops team \\
\hline
Cost model & OpEx (pay-as-you-go) & CapEx (buy hardware upfront) \\
\hline
Scaling & Instant, global & Weeks to months (buy + install) \\
\hline
Risk & Vendor lock-in, price hikes & Hardware failures, staffing \\
\hline
Control & Limited (provider's rules) & Full (your hardware, your rules) \\
\hline
\end{tabular}
\end{center}

\vfill

- **Most real-world deployments are hybrid**: critical/stable workloads on-premises, burst/variable workloads in the cloud
- There is no universal answer; **every case is a trade-off**

## Discussion: The Cloud Trade-Off

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.5cm}
\Large\textit{CloudBite (now 30 engineers, 2M users, stable traffic) pays \$40K/month on AWS. Should they leave the cloud, go hybrid, or stay? Why?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Is the workload predictable or bursty?
- Does the team have ops expertise?
- How much vendor-specific code exists (Lambda, DynamoDB)?
- What would migration cost in time and money?
- Could a hybrid approach capture the best of both?

:::
::::::::::::::

# Session Summary

## Key Takeaways: CloudBite's Journey

:::::::::::::: {.columns}
::: {.column width="48%"}

**What we built:**

1. Virtualization $\rightarrow$ cloud: technology vs **business model**
2. Five NIST characteristics define true cloud
3. **IaaS / PaaS / SaaS**: who manages what
4. Chose a **platform** (AWS, public cloud)
5. Created a **virtual network** with public and private subnets
6. Secured it with **security groups** + **ACLs**
7. Added **load balancer**, **reverse proxy**, **VPN**

:::
::: {.column width="48%"}

**What we learned:**

8. The cloud is **not free**: costs grow with scale
9. **Vendor lock-in** makes leaving expensive
10. Prices increase once you depend on the provider
11. On-premises works for **stable, predictable** workloads
12. **Hybrid** is often the pragmatic answer
13. **Every case is a trade-off**; there is no universal solution

:::
::::::::::::::

## References

\footnotesize

1. NIST SP 800-145, Mell & Grance, "The NIST Definition of Cloud Computing," 2011.
2. NIST SP 800-144, "Guidelines on Security and Privacy in Public Cloud Computing," 2011.
3. AWS, "Amazon VPC User Guide," docs.aws.amazon.com.
4. Microsoft Azure, "Azure Virtual Network Documentation," docs.microsoft.com.
5. Google Cloud, "VPC Documentation," cloud.google.com/vpc/docs.
6. CSA, "Security Guidance for Critical Areas of Focus in Cloud Computing v5," 2022.
7. Erl, Puttini & Mahmood, \textit{Cloud Computing: Concepts, Technology \& Architecture}, Prentice Hall, 2013.
8. Kurose & Ross, \textit{Computer Networking: A Top-Down Approach}, 8th ed., Pearson, 2021.
9. AWS, "Elastic Load Balancing Documentation," docs.aws.amazon.com.
10. NGINX, Inc., "What Is a Reverse Proxy?," nginx.com/resources.
11. AWS, "AWS VPN Documentation," docs.aws.amazon.com.
