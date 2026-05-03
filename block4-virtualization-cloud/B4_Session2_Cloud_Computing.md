---
title: "Block 4 -- Cloud Computing"
subtitle: "S2: Cloud Computing \\& Cloud Architecture"
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
  - \logo{\includegraphics[height=0.6cm]{img/upf-logo.png}}
  - \titlegraphic{\includegraphics[height=0.8cm]{img/upf-logo.png}}
  - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
---

# From Virtualization to Cloud

## If We Can Virtualize Everything... Why Not Sell It?

\begin{center}
\Large\textit{Virtualization is the technology.\\Cloud computing is the business model.}
\end{center}

\vfill

**Learning objectives:**

:::incremental
1. Understand cloud computing's definition and essential characteristics
2. Distinguish IaaS (Infrastructure as a Service), PaaS (Platform as a Service), and SaaS (Software as a Service) and identify key cloud platforms
3. Design a cloud virtual network with subnets, route tables, and security controls
4. Identify essential cloud network services: load balancers, proxies, and VPNs
:::

## Meet the Scenario: A Startup from Zero

\begin{block}{Running example for this session}
To understand concepts in the cloud, we will use "\textbf{CloudBite}". This is a 3-person startup that we just created and received seed funding. We need to deploy a food-delivery web app for thousands of users \textbf{by next month}. 

We have laptops, code, and zero infrastructure.
\end{block}

\pause

<!-- Every section answers the next question CloudBite faces: -->
<!---->
<!-- 1. "We know about VMs. Why not just buy servers?" $\rightarrow$ \textbf{From Virtualization to Cloud} -->
<!-- 2. "What exactly is cloud computing?" $\rightarrow$ \textbf{Fundamentals} -->
<!-- 3. "Which platform do we use?" $\rightarrow$ \textbf{Platforms} -->
<!-- 4. "We picked AWS. Now we need a network." $\rightarrow$ \textbf{Cloud Network Architecture} -->
<!-- 5. "We need HTTPS, traffic distribution, and office access." $\rightarrow$ \textbf{Network Services} -->
<!-- 6. "Is the cloud always the right choice?" $\rightarrow$ \textbf{The Cloud Trade-Off} -->
<!---->
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


:::incremental
- Virtualization = technology (**how** you run multiple workloads)
- Cloud = business model (**what** you sell to customers)
:::

\pause

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

. . .

Key difference: **automation and self-service** (no phone calls, no tickets, no waiting).

## Discussion: From Virtualization to Cloud

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.8cm}
\Large\textit{Your company already runs VMs on its own servers. Why would you move to the cloud instead of keeping everything in-house?}

:::
::: {.column width="40%"}

\textbf{Think about:}

:::incremental
- Capital expenditure vs operational expenditure
- How fast can you scale today?
- Who patches the hardware at 3 am?
- What happens when a disk fails?
:::
:::
:::::::::::::: 

# Fundamentals of Cloud Computing

## CloudBite Asks: "What Exactly Is Cloud Computing?"

<!-- nota: transition slide — connects scenario to section content -->
:::incremental
- The founders are convinced: buying servers is not an option
- But "the cloud" is a vague term; every vendor defines it differently
- Before choosing a provider, we need to understand **what cloud computing actually means** and **what service model fits our needs**
  - **Ubiquitous**: anywhere, any device
  - **On-demand**: no tickets, provision instantly
  - **Shared pool**: many tenants, same hardware
  - **Configurable**: choose CPU, RAM, storage, network
  - **Rapidly provisioned**: up and running in seconds
  - **Minimal management**: provider handles the hardware
:::

. . .

\vfill
\begin{center}
\textit{Let us start with the industry-standard definition.}
\end{center}

## Cloud Computing: Definition (NIST)

\begin{block}{NIST SP 800-145 (2011)}
\textit{"A model for enabling ubiquitous, convenient, \textbf{on-demand network access} to a \textbf{shared pool} of configurable computing resources that can be rapidly provisioned and released with \textbf{minimal management effort}."}
\end{block}

\pause

Three phrases to remember:

:::incremental
- **On-demand**: you get resources immediately, no human approval needed
- **Shared pool**: underlying hardware is shared across many customers (multi-tenancy)
- **Minimal effort**: you click a button (or call an API); the provider handles the rest
:::

\footnote{NIST SP 800-145, Mell \& Grance, 2011. Still the standard definition used industry-wide.}

## Five Essential Characteristics

\only<1>{
\begin{center}\scriptsize\begin{tabular}{|p{2.4cm}|p{3.2cm}|p{3.4cm}|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via Application Programming Interface (API), no human interaction & AWS console: launch VM in 30 s \\
\hline
\end{tabular}\end{center}}
\only<2>{
\begin{center}\scriptsize\begin{tabular}{|p{2.4cm}|p{3.2cm}|p{3.4cm}|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via Application Programming Interface (API), no human interaction & AWS console: launch VM in 30 s \\
\hline
Broad network access & Available from any device over the network & Access S3 from laptop, phone, VM \\
\hline
\end{tabular}\end{center}}
\only<3>{
\begin{center}\scriptsize\begin{tabular}{|p{2.4cm}|p{3.2cm}|p{3.4cm}|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via Application Programming Interface (API), no human interaction & AWS console: launch VM in 30 s \\
\hline
Broad network access & Available from any device over the network & Access S3 from laptop, phone, VM \\
\hline
Resource pooling & Shared infrastructure, multi-tenant & Same physical server, different tenants \\
\hline
\end{tabular}\end{center}}
\only<4>{
\begin{center}\scriptsize\begin{tabular}{|p{2.4cm}|p{3.2cm}|p{3.4cm}|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via Application Programming Interface (API), no human interaction & AWS console: launch VM in 30 s \\
\hline
Broad network access & Available from any device over the network & Access S3 from laptop, phone, VM \\
\hline
Resource pooling & Shared infrastructure, multi-tenant & Same physical server, different tenants \\
\hline
Rapid elasticity & Scale up/down automatically & Black Friday: $10\times$ more instances \\
\hline
\end{tabular}\end{center}}
\only<5>{
\begin{center}\scriptsize\begin{tabular}{|p{2.4cm}|p{3.2cm}|p{3.4cm}|}
\hline
\rowcolor{blue!10} \textbf{Characteristic} & \textbf{What it means} & \textbf{Real-world example} \\
\hline
On-demand self-service & Provision via Application Programming Interface (API), no human interaction & AWS console: launch VM in 30 s \\
\hline
Broad network access & Available from any device over the network & Access S3 from laptop, phone, VM \\
\hline
Resource pooling & Shared infrastructure, multi-tenant & Same physical server, different tenants \\
\hline
Rapid elasticity & Scale up/down automatically & Black Friday: $10\times$ more instances \\
\hline
Measured service & Pay only for what you use & Billed per CPU-hour, GB stored \\
\hline
\end{tabular}\end{center}
\vspace{0.2cm}
\hfill\textbf{All five} must be present to qualify as ``cloud computing''}

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

## IaaS, PaaS, SaaS: In Practice

\small

\pause

**IaaS** (e.g. AWS EC2, Azure VMs, Google Compute Engine):

- Provider gives you VMs, storage, networks. You manage everything else
- "I want a Linux server in Frankfurt, 4 CPUs, 16 GB RAM, right now"

\vspace{0.2cm}

\pause

**PaaS** (e.g. Google App Engine, AWS Elastic Beanstalk, Heroku):

- Provider gives you runtime + tools. You only manage your code and data
- "I wrote a Python web app. Just run it, I do not care about servers"

\vspace{0.2cm}

\pause

**SaaS** (e.g. Google Workspace, Microsoft 365, Slack, Zoom):

- Provider gives you a complete application. You manage your data only
- "I need email for 500 employees. I do not want to run a mail server"

## Service Models: Who Manages What?

\only<1>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
\hline
\rowcolor{blue!10} \textbf{Component} & \textbf{IaaS} & \textbf{PaaS} & \textbf{SaaS} \\
\hline
Applications & You & You & \cellcolor{blue!15}Provider \\
\hline
\end{tabular}\end{center}}
\only<2>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
\hline
\rowcolor{blue!10} \textbf{Component} & \textbf{IaaS} & \textbf{PaaS} & \textbf{SaaS} \\
\hline
Applications & You & You & \cellcolor{blue!15}Provider \\
\hline
Data & You & You & You \\
\hline
\end{tabular}\end{center}}
\only<3>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
\hline
\rowcolor{blue!10} \textbf{Component} & \textbf{IaaS} & \textbf{PaaS} & \textbf{SaaS} \\
\hline
Applications & You & You & \cellcolor{blue!15}Provider \\
\hline
Data & You & You & You \\
\hline
Runtime / Middleware & You & \cellcolor{blue!15}Provider & \cellcolor{blue!15}Provider \\
\hline
\end{tabular}\end{center}}
\only<4>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
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
\end{tabular}\end{center}}
\only<5>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
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
\end{tabular}\end{center}}
\only<6>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
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
\end{tabular}\end{center}}
\only<7>{
\begin{center}\scriptsize\begin{tabular}{|p{4.2cm}|c|c|c|}
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
\end{tabular}\end{center}

\vspace{0.2cm}
- IaaS $\rightarrow$ SaaS: **less control, less responsibility**
- Major providers (AWS, Azure, GCP) offer all three models}

## Discussion: Cloud Fundamentals

:::::::::::::: {.columns}
::: {.column width="48%"}

\only<1->{
\begin{block}{Case A: University}
\small A large university wants a web tool for students to submit assignments. The IT department has 10 staff. Student data must stay within EU jurisdiction. Budget is fixed yearly.
\end{block}

\small
\textbf{Which model? Why?}
- Control over data location needed
- Existing IT team can manage servers
- Ready-made products exist (Canvas, Moodle)
- No need to scale suddenly
}

:::
::: {.column width="48%"}

\only<2->{
\begin{block}{Case B: CloudBite}
\small We are 3 engineers. We need to run a web app, store orders, and send email notifications. We must ship in 4 weeks and cannot afford to manage servers.
\end{block}

\small
\textbf{Which model? Why?}
- No ops bandwidth: avoid IaaS if possible
- Web app: PaaS (just deploy the code)
- Email: SaaS (Mailchimp, SendGrid)
- Database: PaaS managed DB, or IaaS if we need fine-grained control
}

:::
::::::::::::::

# Cloud & Container Platforms

## CloudBite Asks: "Which Platform Do We Use?"

<!-- nota: transition slide — connects scenario to section content -->
:::incremental
- We chose **IaaS**: we want full control over the stack
- Now we must choose: run our own infrastructure (private cloud) or rent from a provider (public cloud)?
- We also hear about **Kubernetes** everywhere: should we use containers?
:::
\vfill

. . .

\begin{center}
\textit{Let us look at the platforms available.}
\end{center}

## Putting It All Together

:::::::::::::: {.columns}
::: {.column width="48%"}

**What we have seen (Session 1)**

- Virtual Switches and Virtual Routers
- Virtual NICs and VLANs
- Hypervisors (KVM, VMware) and containers

\vspace{0.2cm}

These are the **building blocks** of any virtual network; they do not run in isolation.

:::
::: {.column width="48%"}

**Platforms manage these building blocks**

- Provision and connect VMs or containers automatically
- Handle networking, storage, and scaling under the hood
- Hide hardware complexity from the developer

\vspace{0.2cm}

Two families:

- **Cloud platforms** (AWS, Azure, GCP, OpenStack): full infrastructure stack
- **Container orchestration** (Kubernetes): deploy and scale containerized workloads

:::
::::::::::::::

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

:::incremental
- **Self-managed**: you own or rent the servers, install and manage the virtualization software yourself
- Full control over hardware and data; requires dedicated staff and expertise
- Typical use: regulated industries (banking, healthcare), large enterprises with existing data centers
:::

. . .

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

:::incremental
- **Managed / Public**: rent capacity on demand, pay-as-you-go
- Provider handles hardware, networking, cooling, security, and updates
- Maps directly to the IaaS model: provider manages compute, storage, and networking
:::
\vspace{0.2cm}

. . .

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
\renewcommand{\arraystretch}{1.2}
- **Self-hosted / Private**: you install and operate on your own servers

\vspace{0.1cm}

\only<1>{
\scriptsize\begin{tabular}{|p{2cm}|p{7cm}|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
Docker & Container runtime; works well on a single host & \includegraphics[height=0.4cm]{img/docker-logo.png} \\
& Managing hundreds of containers across hosts? Unmanageable & \\
\hline
\end{tabular}}
\only<2>{
\scriptsize\begin{tabular}{|p{2cm}|p{7cm}|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
Docker & Container runtime; works well on a single host & \includegraphics[height=0.4cm]{img/docker-logo.png} \\
& Managing hundreds of containers across hosts? Unmanageable & \\
\hline
Kubernetes (K8s) & Created to solve containers running at scale: scheduling, scaling, networking, self-healing & \includegraphics[height=0.5cm]{img/kubernetes-logo.png} \\
\hline
\end{tabular}}
\only<3->{
\scriptsize\begin{tabular}{|p{2cm}|p{7cm}|c|}
\hline
\rowcolor{blue!10} \textbf{Platform} & \textbf{Description} & \textbf{Logo} \\
\hline
Docker & Container runtime; works well on a single host & \includegraphics[height=0.4cm]{img/docker-logo.png} \\
& Managing hundreds of containers across hosts? Unmanageable & \\
\hline
Kubernetes (K8s) & Created to solve containers running at scale: scheduling, scaling, networking, self-healing & \includegraphics[height=0.5cm]{img/kubernetes-logo.png} \\
\hline
OpenShift & Enterprise K8s by Red Hat; adds security, CI/CD, UI & \includegraphics[height=0.45cm]{img/openshift-logo.png} \\
\hline
\end{tabular}}

\only<4->{
\vspace{0.2cm}\scriptsize
- **Hosted / Public**: cloud providers offer the same platforms as managed services. Each provider uses different names for essentially the same product (e.g., AWS ECS/EKS, Azure AKS, Google GKE, OpenShift on all major clouds).
}

## Discussion: Platforms

:::::::::::::: {.columns}
::: {.column width="55%"}

\vspace{0.8cm}
\Large\textit{Our small startup Cloudbite needs to deploy a web application that may go from 100 to 100,000 users. Would you build a private cloud or use a public one? Why?}

:::
::: {.column width="40%"}

\textbf{Think about:}

\small
- Upfront cost and time to market
- Who manages infrastructure at night?
- Can 3 engineers run a data center?
- What if traffic spikes overnight?

:::
::::::::::::::

# Cloud Network Architecture

## CloudBite Asks: "We Picked AWS. Now What?"

<!-- nota: transition slide — connects scenario to section content -->
:::::::::::::: {.columns}
::: {.column width="55%"}

:::incremental
- We chose **AWS** (public cloud, IaaS): no upfront cost, instant global reach
- First task: create an **isolated network** for our application
- We need a **public subnet** for the web frontend and a **private subnet** for the database
- How do subnets, route tables, gateways, and firewalls work in the cloud?
:::

. . .

\vfill
\begin{center}
\textit{Time to build CloudBite's virtual network from scratch.}
\end{center}

:::
::: {.column width="42%"}

\begin{tikzpicture}[
  node distance=0.55cm,
  box/.style={draw, rounded corners, minimum width=2.6cm, minimum height=0.55cm, font=\scriptsize, align=center},
  subnet/.style={draw, dashed, rounded corners, inner sep=6pt},
  lbl/.style={font=\tiny, align=center}
]

\node[cloud, cloud puffs=9, draw, fill=cyan!10, minimum width=2cm, minimum height=0.9cm, font=\scriptsize] (inet) {Internet};

\node[box, fill=orange!15, below=of inet] (lb) {Load Balancer};

\begin{scope}
  \node[box, fill=green!15, below=0.5cm of lb] (web) {Web Server};
  \node[subnet, fit=(lb)(web), label=above left:{\tiny\textbf{Public subnet}}] (pub) {};
\end{scope}

\node[box, fill=purple!15, below=0.6cm of web] (db) {Database};
\node[subnet, fit=(db), label=above left:{\tiny\textbf{Private subnet}}, fill=red!3] (priv) {};

\draw[->, thick] (inet) -- (lb);
\draw[->, thick] (lb) -- (web);
\draw[->, thick] (web) -- (db);
\draw[->, thick, red, dashed] (inet) .. controls +(1.5,0) and +(1.5,0) .. node[right, font=\tiny, text=red] {blocked} (db);

\end{tikzpicture}

:::
::::::::::::::

## Virtual Networks in the Cloud

:::incremental
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
:::
\vfill
<!-- nota: el virtual network usa overlays VXLAN por debajo — se cubrirán en Block 5 -->
. . .

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

## Subnets: Public vs Private

:::::::::::::: {.columns}
::: {.column width="55%"}

\scriptsize Cloud providers distinguish between subnets reachable from the Internet and isolated ones. Web servers need public access; databases and backends must stay hidden.

\vspace{0.2cm}

**Public subnet:**

- Route to an **Internet Gateway**
- Instances can have **public IPs**
- Use: web servers, load balancers

**Private subnet:**

- **No route** to the Internet
- Only **private IPs**
- Use: databases, backends

:::
::: {.column width="42%"}

\begin{center}
\begin{tikzpicture}[
  box/.style={draw, rounded corners, minimum width=2cm, minimum height=0.5cm, font=\scriptsize, align=center},
  subnet/.style={draw, dashed, rounded corners, inner sep=6pt}
]
\node[cloud, cloud puffs=9, draw, fill=cyan!10, minimum width=1.6cm, minimum height=0.7cm, font=\tiny] (inet) {Internet};
\node[box, fill=orange!15, below=0.4cm of inet] (igw) {Internet Gateway};

\node[box, fill=green!15, below=0.6cm of igw] (web) {Web Server};
\node[subnet, fit=(web), label=right:{\tiny Public}] (pub) {};

\node[box, fill=purple!15, below=0.5cm of pub] (db) {Database};
\node[subnet, fit=(db), label=right:{\tiny Private}, fill=red!3] (priv) {};

\draw[<->, thick] (inet) -- (igw);
\draw[<->, thick] (igw) -- (web);
\draw[->, thick] (web) -- (db);
\draw[->, thick, red, dashed] (igw.east) .. controls +(1.5,-0.5) and +(1.5,0.5) .. node[right, font=\tiny, text=red] {no route} (db.east);
\end{tikzpicture}
\end{center}

:::
::::::::::::::

## Route Tables

:::::::::::::: {.columns}
::: {.column width="55%"}

\scriptsize Every virtual network has an implicit **virtual router** managed by the provider. Route tables tell it where to forward traffic.

\vspace{0.1cm}

\renewcommand{\arraystretch}{1.2}
\scriptsize
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Dest.} & \textbf{Next Hop} & \textbf{Subnet} \\
\hline
\texttt{10.0.0.0/16} & local & Pub + Priv \\
\hline
\texttt{0.0.0.0/0} & Internet GW & Public only \\
\hline
\end{tabular}

\vspace{0.2cm}

- **Local route**: traffic stays inside the virtual network
- **Default route** (`0.0.0.0/0`): public subnets exit via the Internet Gateway
- Private subnets have no default route

:::
::: {.column width="42%"}

\begin{center}
\begin{tikzpicture}[
  box/.style={draw, rounded corners, minimum width=1.8cm, minimum height=0.5cm, font=\scriptsize, align=center}
]
\node[cloud, cloud puffs=9, draw, fill=cyan!10, minimum width=1.6cm, minimum height=0.7cm, font=\tiny] (inet) at (0,3) {Internet};
\node[box, fill=orange!15] (igw) at (0,2) {Internet GW};
\node[box, fill=yellow!20, diamond, aspect=2, minimum width=2.2cm] (rt) at (0,0.6) {Router};
\node[box, fill=green!15] (pub) at (-1.4,-1) {Public\\subnet};
\node[box, fill=purple!15] (priv) at (1.4,-1) {Private\\subnet};

\draw[<->, thick] (inet) -- (igw);
\draw[<->, thick] (igw) -- (rt);
\draw[<->, thick] (rt) -- (pub);
\draw[<->, thick] (rt) -- (priv);
\draw[->, dashed, red] (priv.east) .. controls +(1.2,1) .. node[right, font=\tiny, text=red] {no} (igw.east);
\end{tikzpicture}
\end{center}

:::
::::::::::::::

## Internet Gateway

:::::::::::::: {.columns}
::: {.column width="55%"}

\scriptsize In a cloud virtual network, instances are **isolated by default**. The Internet Gateway is the controlled entry and exit point.

\vspace{0.2cm}

- **Outbound only**: instance can reach the Internet, but is not reachable from outside
  - No public IP needed; the provider performs NAT transparently
- **Bidirectional**: instance is also reachable from the Internet
  - Requires a **public IP**
  - Use: web servers, load balancers

\vspace{0.1cm}

\footnotesize Note: a NAT Gateway can be added for private instances that need outbound Internet access (e.g. updates), without exposing them inbound.

:::
::: {.column width="42%"}

\begin{center}
\begin{tikzpicture}[
  box/.style={draw, rounded corners, minimum width=1.8cm, minimum height=0.5cm, font=\scriptsize, align=center}
]
\node[cloud, cloud puffs=9, draw, fill=cyan!10, minimum width=1.8cm, minimum height=0.8cm, font=\tiny] (inet) at (0,2.5) {Internet};
\node[box, fill=orange!15, minimum width=2.4cm] (igw) at (0,1.2) {Internet Gateway};
\node[draw, dashed, rounded corners, minimum width=3.6cm, minimum height=2cm] (vpc) at (0,-0.4) {};
\node[font=\tiny] at (-1.3,0.4) {VPC};
\node[box, fill=green!15] (pub) at (0,0) {Public IP};
\node[box, fill=purple!15] (priv) at (0,-1.1) {Private only};

\draw[<->, thick] (inet) -- (igw);
\draw[<->, thick] (igw) -- (pub);
\draw[->, thick, blue, dashed] (priv.west) .. controls +(-1.3,0.5) .. node[left, font=\tiny, text=blue, align=center] {NAT GW\\(optional)} (igw.west);
\end{tikzpicture}
\end{center}

:::
::::::::::::::

## Security Groups: Instance-Level Firewall

:::::::::::::: {.columns}
::: {.column width="55%"}

\scriptsize Once traffic reaches an instance, you still need to control what it can send and receive.

\vspace{0.1cm}

- **Security group** = virtual firewall on an instance
- Specifies allowed **inbound/outbound** traffic
- **Stateful**: allow inbound $\rightarrow$ response automatically allowed

\vspace{0.2cm}

\renewcommand{\arraystretch}{1.2}
\scriptsize
\begin{tabular}{|l|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{Dir.} & \textbf{Proto} & \textbf{Port} & \textbf{Src/Dst} \\
\hline
In & TCP & 80 & \texttt{0.0.0.0/0} \\
\hline
In & TCP & 443 & \texttt{0.0.0.0/0} \\
\hline
In & TCP & 22 & \texttt{10.0.0.0/16} \\
\hline
Out & All & All & \texttt{0.0.0.0/0} \\
\hline
\end{tabular}

:::
::: {.column width="42%"}

\begin{center}
\begin{tikzpicture}[
  box/.style={draw, rounded corners, minimum width=2cm, minimum height=0.55cm, font=\scriptsize, align=center}
]
\node[font=\scriptsize] (client) at (0,0) {Internet};
\node[draw, thick, rounded corners, fill=red!15, minimum width=1.2cm, minimum height=2.6cm, align=center, font=\tiny] (sg) at (2.4,0) {S\\G};
\node[box, fill=green!15] (vm) at (4.6,0) {Web VM};

\draw[->, thick, green!50!black] (client) -- node[above, font=\tiny] {:80} (sg.west|-vm);
\draw[->, thick, green!50!black] (sg.east|-vm) -- (vm);
\draw[->, thick, red, dashed] (-0.2,-1) -- node[above, font=\tiny, text=red] {:3306} (1.8,-1);
\draw[red, thick] (1.8,-1.2) -- (2.0,-0.8);
\draw[red, thick] (1.8,-0.8) -- (2.0,-1.2);
\node[font=\tiny] at (2.4,-1.6) {filtered};
\end{tikzpicture}
\end{center}

\footnotesize By default: all inbound denied, all outbound allowed.

:::
::::::::::::::

\footnote{AWS, "Security Groups for Your VPC," docs.aws.amazon.com.}

## Network ACLs (Access Control Lists): Subnet-Level Firewall

:::::::::::::: {.columns}
::: {.column width="55%"}

\scriptsize Network ACLs add a layer of control at the **subnet boundary**, before traffic reaches any instance.

\vspace{0.1cm}

- **Network ACL** = firewall at the **subnet** level
- Rules evaluated in **order** (numbered, first match wins)
- **Stateless**: must explicitly allow inbound AND outbound

\vspace{0.2cm}

\renewcommand{\arraystretch}{1.2}
\scriptsize
\begin{tabular}{|c|l|l|l|l|}
\hline
\rowcolor{blue!10} \textbf{\#} & \textbf{Dir.} & \textbf{Proto} & \textbf{Port} & \textbf{Action} \\
\hline
100 & In & TCP & 80 & ALLOW \\
\hline
200 & In & TCP & 443 & ALLOW \\
\hline
* & In & All & All & DENY \\
\hline
\end{tabular}

:::
::: {.column width="42%"}

\begin{center}
\begin{tikzpicture}[
  box/.style={draw, rounded corners, minimum width=1.6cm, minimum height=0.5cm, font=\scriptsize, align=center}
]
\node[font=\scriptsize] (client) at (0,0) {Internet};
\node[draw, thick, dashed, rounded corners, fill=blue!10, minimum width=3cm, minimum height=2.2cm] (subnet) at (4,0) {};
\node[font=\tiny] at (4,1) {Subnet};
\node[box, fill=green!15] (vm1) at (4,0.2) {VM 1};
\node[box, fill=green!15] (vm2) at (4,-0.6) {VM 2};
\node[draw, thick, fill=red!15, minimum width=0.4cm, minimum height=2.2cm, font=\tiny, align=center] (acl) at (2.3,0) {N\\A\\C\\L};

\draw[->, thick, green!50!black] (client) -- node[above, font=\tiny] {:80} (acl);
\draw[->, thick, red, dashed] (0,-1.5) -- node[above, font=\tiny, text=red] {:22} (2.1,-1.5);
\end{tikzpicture}
\end{center}

\footnotesize Filter applies to **all** instances in the subnet.

:::
::::::::::::::

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

- Our app is live, but traffic is growing fast
- A single web server cannot handle the load; we need **traffic distribution**
- The API must be reachable via HTTPS, but the backends should stay hidden
- The CTO also wants to access the cloud network from the office without exposing it to the Internet

\vfill

\begin{center}
\textit{Three services solve these problems: load balancers, proxies, and VPNs.}
\end{center}

## Cloud Network Services: Overview

Beyond virtual networks and security controls, public cloud providers offer managed network services that simplify common infrastructure tasks, such as:
\pause

1. **Load Balancer (LB)**
2. **Proxy**
3. **Reverse Proxy**
4. **VPN (Virtual Private Network)**

\pause

These services run as **managed offerings**: no servers to install or maintain.

\vfill
\footnotesize Note: Proxy, Reverse Proxy, and VPN will be covered in depth in Block 6. Here we introduce them briefly.

\vspace{0.1cm}
\footnotesize \textbf{Private cloud:} these services are \textbf{not} provided automatically; you must deploy and manage them yourself (e.g. HAProxy for load balancing, OpenVPN for VPN).

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

## VPN: Virtual Private Network

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

- We grew to 2 million users. AWS bill: **\$40,000/month** and rising
- Egress fees alone: \$5,000/month (data leaving AWS to users)
- The team now has 30 engineers; we *could* run our own servers
- We now ask: "Should we leave the cloud?"

\vfill

\begin{center}
\textit{The cloud is not always the cheapest option. Let us explore why.}
\end{center}

## Case Study: Basecamp Leaves the Cloud

- **Basecamp / 37signals** (creators of Ruby on Rails) ran on AWS for 15 years
- In 2023, they **moved everything to their own hardware**: no new staff needed
- Result: **\$10 million saved over five years** (50\%+ cost reduction)

\pause

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

\pause

- **Data egress fees** make leaving expensive:
  - AWS charges \$0.09/GB for outbound traffic
  - Moving 50 TB out of AWS $\approx$ \$4,500 in fees alone
  - Egress fees increased 20\% in 2023; inter-Availability-Zone (AZ) fees doubled in 2025

\pause

- **68\% of enterprises** exceeded their cloud budget due to unexpected data transfer costs (Flexera, 2024)

\footnote{Flexera, "State of the Cloud Report," 2024; AWS pricing documentation, 2025.}

## The Pricing Ratchet

- Cloud providers attract customers with **low initial pricing and free tiers**
- Once adoption deepens, prices increase:
  - AWS EC2 instance families: significant price rises in 2025
  - Azure: 5\%+ on subscriptions, 10\% on Premium SSDs (2025)
  - Google Workspace: 20\%--34\% increase (March 2025)

\pause

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
\Large\textit{CloudBite now has 30 engineers, 2M users, and stable traffic. Should we leave the cloud, go hybrid, or stay? Why?}

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
2. AWS, "Amazon VPC User Guide," docs.aws.amazon.com.
3. Microsoft Azure, "Azure Virtual Network Documentation," docs.microsoft.com.
4. Google Cloud, "VPC Documentation," cloud.google.com/vpc/docs.
5. CSA, "Security Guidance for Critical Areas of Focus in Cloud Computing v5," 2022.
6. Erl, Puttini & Mahmood, \textit{Cloud Computing: Concepts, Technology \& Architecture}, Prentice Hall, 2013.
7. Kurose & Ross, \textit{Computer Networking: A Top-Down Approach}, 8th ed., Pearson, 2021.
8. AWS, "Elastic Load Balancing Documentation," docs.aws.amazon.com.
9. NGINX, Inc., "What Is a Reverse Proxy?," nginx.com/resources.
10. AWS, "AWS VPN Documentation," docs.aws.amazon.com.
