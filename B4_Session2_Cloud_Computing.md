---
title: "Block 4 -- Session 2"
subtitle: "Cloud Computing \\& Cloud Networking"
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
  - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, fit, decorations.pathreplacing}
  - \setbeamerfont{footnote}{size=\tiny}
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
2. Distinguish IaaS, PaaS, and SaaS service models
3. Design a basic cloud network with VPCs, subnets, and security controls

## Recap -- What We Virtualized (Session 1)

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, minimum width=2.5cm, minimum height=0.7cm, font=\small},
    >=Stealth
]
\node[box, fill=green!15] (vm) at (0,2) {VMs};
\node[box, fill=blue!15] (vnic) at (4,2) {vNICs};
\node[box, fill=orange!15] (vsw) at (8,2) {vSwitches};
\node[box, fill=purple!15] (overlay) at (4,0.5) {Overlay Networks (VXLAN)};

\draw[->, thick] (vm) -- (vnic);
\draw[->, thick] (vnic) -- (vsw);
\draw[->, thick] (vsw) -- (overlay);
\draw[->, thick, dashed] (overlay) -- ++(0,-1) node[below, font=\small] {\textbf{Cloud Computing}};
\end{tikzpicture}
\end{center}

- Compute virtualization: VMs and containers
- Network virtualization: vNICs, vSwitches, vRouters, VXLAN overlays
- Together: the **building blocks** of the cloud

## The Leap to Cloud

- Virtualization = technology (**how** you run multiple workloads)
- Cloud = business model (**what** you sell to customers)

\begin{center}
\small
\begin{tabular}{ll}
\toprule
\textbf{Virtualization} & \textbf{Cloud Computing} \\
\midrule
Run multiple VMs on one host & Offer compute as a \textbf{service} \\
Internal IT optimization & External/internal consumption \\
Manual provisioning possible & \textbf{Automated, self-service} \\
You own the hardware & Provider owns the hardware \\
\bottomrule
\end{tabular}
\end{center}

\vfill

Key difference: **automation and self-service** (no phone calls, no tickets, no waiting).

# Fundamentals of Cloud Computing

## Cloud Computing -- Definition (NIST)

\begin{quote}
``A model for enabling ubiquitous, convenient, \textbf{on-demand network access} to a shared pool of configurable computing resources that can be rapidly provisioned and released with minimal management effort.''
\end{quote}

\vfill
\footnotesize
Source: NIST SP 800-145 (2011). Still the standard definition used industry-wide.

## Five Essential Characteristics

\begin{center}
\small
\begin{tabular}{ll}
\toprule
\textbf{Characteristic} & \textbf{What it means} \\
\midrule
On-demand self-service & Provision resources without human interaction \\
Broad network access & Available over the network from any device \\
Resource pooling & Shared infrastructure, multi-tenant \\
Rapid elasticity & Scale up/down automatically \\
Measured service & Pay only for what you use (metered) \\
\bottomrule
\end{tabular}
\end{center}

\vfill

- **All five** must be present to qualify as ``cloud computing''
- If you need to call someone to get a VM $\rightarrow$ it's not cloud

\vfill
\footnotesize
Source: NIST SP 800-145, Mell & Grance, 2011.

## On-Demand Self-Service

- Users provision resources through a **portal or API**
- No phone calls, no tickets, no waiting for approval
- Example: launch a VM in **30 seconds** via a web console

\vfill

<!-- nota: si hay tiempo, demo en vivo creando una instancia en algún cloud -->

Analogy: vending machine (cloud) vs restaurant with a waiter (traditional IT).

## Broad Network Access + Resource Pooling

**Broad network access:**

- Resources accessible from **any device** with network connectivity
- Standard protocols: HTTPS, SSH, REST APIs
- No proprietary client software needed

**Resource pooling:**

- Provider's resources serve **multiple tenants** simultaneously
- Tenants don't know (or care) where their resources are physically located
- Dynamically assigned based on demand
- Builds on the **multi-tenancy** concepts from Session 1

## Rapid Elasticity + Measured Service

**Rapid elasticity:**

- Resources appear **unlimited** to the consumer
- Scale out (add) and scale in (remove) automatically
- Example: web store on Black Friday $\rightarrow$ 10$\times$ servers, then back to normal

**Measured service:**

- Usage is **metered** (CPU-hours, GB stored, GB transferred)
- **Pay-per-use** model $\rightarrow$ OpEx instead of CapEx
- Transparent monitoring and billing reports

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

## IaaS -- Infrastructure as a Service

- Provider gives you: **VMs, storage, networks**
- You manage: OS, middleware, applications, data
- **Maximum control, maximum responsibility**

Examples:

- **AWS EC2**: virtual machines
- **Azure Virtual Machines**
- **Google Compute Engine**

\vfill

Use case: ``I want a Linux server in Frankfurt, 4 CPUs, 16 GB RAM, right now.''

\vfill
\footnotesize
Source: AWS EC2 Documentation, docs.aws.amazon.com.

## PaaS -- Platform as a Service

- Provider gives you: **runtime environment + tools**
- You manage: only your **application code and data**
- No need to manage OS, patches, or scaling infrastructure

Examples:

- **Google App Engine**
- **AWS Elastic Beanstalk**
- **Heroku**

\vfill

Use case: ``I wrote a Python web app. Just run it, scale it, I don't care about servers.''

## SaaS -- Software as a Service

- Provider gives you: a **complete application**
- You manage: your **data and user configuration**
- No installation, no maintenance, no updates to worry about

Examples:

- **Google Workspace** (Gmail, Docs, Drive)
- **Microsoft 365** (Word, Excel, Teams)
- **Salesforce**, **Slack**, **Zoom**

\vfill

Use case: ``I need email for 500 employees. I don't want to run a mail server.''

## Service Models -- Who Manages What?

\begin{center}
\footnotesize
\begin{tabular}{lccc}
\toprule
\textbf{Component} & \textbf{IaaS} & \textbf{PaaS} & \textbf{SaaS} \\
\midrule
Applications & You & You & \cellcolor{blue!15}Provider \\
Data & You & You & You \\
Runtime / Middleware & You & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
Operating System & You & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
Virtualization & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
Hardware & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\bottomrule
\end{tabular}
\end{center}

- IaaS $\rightarrow$ SaaS: **less control, less responsibility**
- Major providers (AWS, Azure, GCP) offer all three models

# Cloud Network Architecture

## Virtual Private Cloud (VPC)

- A **VPC** is your own **isolated virtual network** inside a cloud provider
- Think of it as your private data center in the cloud
- You define:
  - **Address space** (e.g., `10.0.0.0/16`)
  - **Subnets** (subdivisions of the address space)
  - **Routing rules** and **security policies**

\vfill

<!-- nota: el VPC usa los overlays VXLAN de la sesión anterior por debajo — conectar con 4.4 -->

Key: the VPC is built on top of the **overlay network** concepts from Session 1.

\vfill
\footnotesize
Source: AWS, "Amazon VPC User Guide," docs.aws.amazon.com.

## VPC Architecture

\begin{center}
\begin{tikzpicture}[
    vpc/.style={draw, thick, dashed, blue, rounded corners, inner sep=10pt},
    subnet/.style={draw, thick, rounded corners, minimum width=3cm, minimum height=1.5cm, font=\small},
    inst/.style={draw, thick, fill=green!15, rounded corners, minimum width=1cm, minimum height=0.5cm, font=\scriptsize},
    >=Stealth
]
% VPC box
\node[vpc, fit={(-4.5,-1.5)(4.5,2.5)}, label=above:{\small\textbf{VPC: 10.0.0.0/16}}] (vpc) {};

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

## Subnets -- Public vs Private

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
\begin{tabular}{lll}
\toprule
\textbf{Destination} & \textbf{Target} & \textbf{Subnet type} \\
\midrule
\texttt{10.0.0.0/16} & local (within VPC) & Both \\
\texttt{0.0.0.0/0} & Internet Gateway & Public \\
\texttt{0.0.0.0/0} & NAT Gateway & Private \\
\bottomrule
\end{tabular}
\end{center}

- **Local route**: traffic within the VPC stays inside (always present)
- **Default route** (`0.0.0.0/0`): where to send everything else
- Public subnets $\rightarrow$ IGW; Private subnets $\rightarrow$ NAT GW

## Internet Gateway vs NAT Gateway

\begin{center}
\small
\begin{tabular}{lll}
\toprule
& \textbf{Internet Gateway} & \textbf{NAT Gateway} \\
\midrule
Direction & Bidirectional & Outbound only \\
Use case & Public-facing services & Private instances need updates \\
Assigned to & VPC (one per VPC) & Public subnet \\
Instance needs & Public IP & Only private IP \\
\bottomrule
\end{tabular}
\end{center}

\vfill

- Internet GW: allows the world to **reach** your public instances
- NAT GW: lets private instances **reach out** without being reachable
- Same **NAT concept from Block 3**, now as a managed cloud service

## Security Groups -- Instance-Level Firewall

- **Security group** = virtual firewall attached to an instance
- Rules specify allowed **inbound** and **outbound** traffic
- **Stateful**: allow inbound $\rightarrow$ response automatically allowed

\begin{center}
\small
\begin{tabular}{llll}
\toprule
\textbf{Direction} & \textbf{Protocol} & \textbf{Port} & \textbf{Source/Dest} \\
\midrule
Inbound & TCP & 80 & \texttt{0.0.0.0/0} \\
Inbound & TCP & 443 & \texttt{0.0.0.0/0} \\
Inbound & TCP & 22 & \texttt{10.0.0.0/16} \\
Outbound & All & All & \texttt{0.0.0.0/0} \\
\bottomrule
\end{tabular}
\end{center}

<!-- nota: por defecto todo denegado inbound, todo permitido outbound -->

\vfill
\footnotesize
Source: AWS, "Security Groups for Your VPC," docs.aws.amazon.com.

## Network ACLs -- Subnet-Level Firewall

- **Network ACL** = firewall at the **subnet** level
- Rules evaluated in **order** (numbered, first match wins)
- **Stateless**: must explicitly allow both inbound AND outbound

\begin{center}
\small
\begin{tabular}{lllll}
\toprule
\textbf{Rule \#} & \textbf{Direction} & \textbf{Protocol} & \textbf{Port} & \textbf{Action} \\
\midrule
100 & Inbound & TCP & 80 & ALLOW \\
200 & Inbound & TCP & 443 & ALLOW \\
* & Inbound & All & All & DENY \\
\bottomrule
\end{tabular}
\end{center}

\vfill
\footnotesize
Source: AWS, "Network ACLs," docs.aws.amazon.com.

## Security Groups vs Network ACLs

\begin{center}
\small
\begin{tabular}{lll}
\toprule
& \textbf{Security Groups} & \textbf{Network ACLs} \\
\midrule
Scope & Instance level & Subnet level \\
State & Stateful & Stateless \\
Rules & Allow only & Allow + Deny \\
Evaluation & All rules evaluated & First match wins \\
Default & Deny all inbound & Allow all \\
\bottomrule
\end{tabular}
\end{center}

\vfill

**Defense in depth**: use both together.

- Security Groups $\rightarrow$ fine-grained per-instance control
- Network ACLs $\rightarrow$ broad subnet-level guardrails

# Cloud Governance, Sovereignty \& Compliance

## Cloud Governance

- **Governance** = policies and controls for managing cloud resources
- Key areas:
  - **Resource management**: who can create/delete what, tagging
  - **Cost control**: budgets, alerts, spending limits
  - **Access control**: Identity and Access Management (IAM)
  - **Compliance**: ensuring regulatory requirements are met

\vfill

Without governance: resource sprawl, security gaps, surprise bills.

## Data Sovereignty and GDPR

- **Data sovereignty**: data is subject to the laws where it is **stored**
- Cloud providers have data centers worldwide $\rightarrow$ your data location matters
- Risks: jurisdiction conflicts (EU data in US), government access (CLOUD Act)

**GDPR** (EU, 2018) -- key principles:

- **Lawfulness** + **purpose limitation** + **data minimization**
- **Right to erasure**: users can request data deletion
- **Breach notification**: 72 hours to report
- Relevance: you must know **where** your data is and **who** can access it

\vfill
\footnotesize
Source: Regulation (EU) 2016/679, General Data Protection Regulation, 2018.

## Shared Responsibility Model

\begin{center}
\begin{tikzpicture}[
    layer/.style={draw, thick, minimum width=9cm, minimum height=0.8cm, font=\small},
    >=Stealth
]
\node[layer, fill=orange!20] (app) at (0,2.4) {Applications \& Data};
\node[layer, fill=orange!20] (access) at (0,1.6) {Identity \& Access Management};
\node[layer, fill=orange!20] (os) at (0,0.8) {OS, Network Config, Firewall};
\node[layer, fill=blue!20] (infra) at (0,0) {Compute, Storage, Networking};
\node[layer, fill=blue!20] (phys) at (0,-0.8) {Physical Infrastructure};

\node[font=\small\bfseries, text=orange!70!black] at (6,1.6) {Customer};
\node[font=\small\bfseries, text=blue!70!black] at (6,-0.4) {Provider};

\draw[thick, dashed, gray] (-5,0.4) -- (5,0.4);
\end{tikzpicture}
\end{center}

- **Provider**: physical security, hardware, hypervisors, network fabric
- **Customer**: data, access policies, OS patches, application security
- The dividing line **shifts** depending on IaaS / PaaS / SaaS

\vfill
\footnotesize
Source: AWS, "Shared Responsibility Model," aws.amazon.com/compliance/shared-responsibility-model.

## References

\footnotesize

1. NIST SP 800-145, Mell & Grance, "The NIST Definition of Cloud Computing," 2011.
2. NIST SP 800-144, "Guidelines on Security and Privacy in Public Cloud Computing," 2011.
3. AWS, "Amazon VPC User Guide," docs.aws.amazon.com.
4. AWS, "Shared Responsibility Model," aws.amazon.com/compliance/shared-responsibility-model.
5. Microsoft Azure, "Azure Virtual Network Documentation," docs.microsoft.com.
6. Google Cloud, "VPC Documentation," cloud.google.com/vpc/docs.
7. Regulation (EU) 2016/679, General Data Protection Regulation (GDPR), 2018.
8. CSA, "Security Guidance for Critical Areas of Focus in Cloud Computing v5," 2022.
9. Erl, Puttini & Mahmood, *Cloud Computing: Concepts, Technology & Architecture*, Prentice Hall, 2013.
10. Kurose & Ross, *Computer Networking: A Top-Down Approach*, 8th ed., Pearson, 2021.

# Session Summary

## Key Takeaways

1. Virtualization is the **technology**; cloud is the **business model**
2. Five NIST characteristics define true cloud computing
3. **IaaS / PaaS / SaaS** differ in who manages what
4. A **VPC** is your isolated cloud network (built on overlays from Session 1)
5. **Security groups** (instance) + **ACLs** (subnet) = defense in depth
6. **Data sovereignty** and GDPR affect where and how you store data

## Discussion

\begin{center}
\Large\textit{A Spanish startup stores user data in an AWS region\\in Ireland. A US law enforcement agency requests access.\\Who is responsible? What does GDPR say?}
\end{center}

\vfill

<!-- nota: discutir shared responsibility model, data sovereignty, GDPR, y el US CLOUD Act. No hay una respuesta simple — es un dilema real -->

Think about: shared responsibility, data location, and which laws apply.
