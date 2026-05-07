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
  - \logo{\includegraphics[height=0.6cm]{theory/block5-sdn-cloud-native/img/upf-logo.png}}
  - \titlegraphic{\includegraphics[height=1.2cm]{theory/block5-sdn-cloud-native/img/upf-logo.png}}
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
4. Define cloud-native design and explain how containers, microservices, and IaC work together

## The Problem with Traditional Networks

\begin{center}
\begin{tikzpicture}[
    dev/.style={draw, thick, rounded corners, fill=gray!20, minimum width=1.1cm, minimum height=0.5cm, font=\tiny, align=center},
    eng/.style={draw, thick, ellipse, fill=yellow!20, minimum width=1.0cm, minimum height=0.6cm, font=\tiny},
    >=Stealth
]

% --- Small network (left) ---
\node[font=\small\bfseries] at (-4.5, 4.0) {Small network};
\node[eng] (a1) at (-4.5, 3.0) {Admin};
\node[dev] (d1) at (-6.2, 1.8) {Switch 1};
\node[dev] (d2) at (-4.5, 1.8) {Router 1};
\node[dev] (d3) at (-2.8, 1.8) {LB 1};
\draw[->, thick, red!60] (a1) -- node[left, font=\tiny] {SSH} (d1);
\draw[->, thick, red!60] (a1) -- (d2);
\draw[->, thick, red!60] (a1) -- node[right, font=\tiny] {SSH} (d3);
\node[font=\tiny, text=gray] at (-4.5, 1.1) {Tedious, but doable};

% --- Arrow in the middle ---
\draw[->, very thick, black!50] (-1.8, 1.3) -- (-0.5, 1.3);
\node[font=\tiny, align=center] at (-1.15, 1.7) {Data center\\grows...};

% --- Large network (right) ---
\node[font=\small\bfseries] at (4.0, 4.0) {Cloud-scale network};
\node[eng] (a2) at (4.0, 3.2) {Admin};

% All rows: unnamed (convey scale)
\foreach \x in {1.5, 2.5, 3.5, 4.5, 5.5, 6.5} {
    \foreach \y in {2.1, 1.3, 0.5} {
        \node[dev, minimum width=0.8cm, minimum height=0.35cm] at (\x, \y) {};
    }
}

% Red arrows fanning out from admin to top row
\draw[->, thick, red!70] (a2) -- (1.5, 2.1);
\draw[->, thick, red!70] (a2) -- (2.5, 2.1);
\draw[->, thick, red!70] (a2) -- (3.5, 2.1);
\draw[->, thick, red!70] (a2) -- (4.5, 2.1);
\draw[->, thick, red!70] (a2) -- (5.5, 2.1);
\draw[->, thick, red!70] (a2) -- (6.5, 2.1);

% Question mark / overwhelmed label
\node[font=\Large, text=red!80] at (4.0, 2.55) {?};
\node[font=\tiny, text=red!70] at (4.0, -0.05) {Hundreds of thousands of devices};
\node[font=\tiny, text=red!70] at (4.0, -0.45) {Days or weeks per change, errors inevitable};

\end{tikzpicture}
\end{center}

\vfill
\footnotesize At cloud scale, manual configuration breaks completely. There has to be a better way.

## Discussion: The Cost of Manual Networks

\begin{center}
\Large\textit{Why have traditional networks survived so long\\despite their scalability problems?}
\end{center}

\vfill

- Hint: think about reliability, vendor relationships, and risk aversion
- What would it take for an organization to change?

# Software-Defined Networking (SDN)

## Software-Defined Networking (SDN)

Software-Defined Networking is an approach to network management that makes the network **programmable** by separating the logic that controls traffic from the hardware that forwards it.

\vspace{0.3cm}

- **Separate the control plane from the data plane**: the control plane decides where traffic goes; the data plane just forwards it. SDN puts them in separate layers
\vspace{0.2cm}
- **Centralize control**: one (or a cluster of) software controller(s) has a global view of the network
\vspace{0.2cm}
- **Use software to configure devices**: no manual CLI per device; push rules programmatically
\vspace{0.2cm}
- **Open interfaces**: any application can interact with the network via standard APIs

\vfill
\footnotesize \textit{The network becomes as flexible as software: you can change how traffic flows without touching hardware.}

## SDN: The Centralized Brain

:::::::::::::: {.columns}
::: {.column width="44%"}

- The controller is the **brain** of the network: global view, all forwarding decisions
\vspace{0.2cm}
- Maintains a real-time **topology database**
\vspace{0.2cm}
- **Programmable via API**: scripts and apps push rules without touching the CLI
\vspace{0.2cm}
- Multiple controllers sync for redundancy $^2$

\vspace{0.2cm}

**Open-source:** OpenDaylight, ONOS

**Proprietary:** Cisco ACI, VMware NSX

:::
::: {.column width="56%"}

\begin{center}
\includegraphics[width=0.75\columnwidth]{theory/block5-sdn-cloud-native/img/Layered-view-of-SDN-Architecture.png}
\end{center}

\vfill
\begin{center}
\tiny $^2$ Latif et al., "A Comprehensive Survey of Interface Protocols for SDN," arXiv:1902.07913, 2019.
\end{center}

:::
::::::::::::::

## How Does the Controller Talk to Switches?

The controller needs a **common language** to program any switch, regardless of vendor. That language is called the **southbound protocol**.

\vspace{0.2cm}

- **OpenFlow** (Stanford, 2008): the first standard protocol $^1$
  - Controller sends **flow rules**: "if packet matches X, do Y"
  - Proved the concept works on real hardware
  - Rarely used in production today
\vspace{0.2cm}
- **Modern alternatives**: gNMI, NETCONF/YANG, vendor APIs (Cisco ACI, VMware NSX)

\vspace{0.3cm}
\footnotesize
\textit{Think of it as a universal remote control: one controller, any switch brand.}

\vfill
\begin{center}
\tiny $^1$ ONF, "Software-Defined Networking: The New Norm for Networks," ONF White Paper, 2012.
\end{center}

## SDN Today: It Is Everywhere

:::::::::::::: {.columns}
::: {.column width="48%"}

Every time you create a network in AWS, Azure, or GCP, **SDN is doing the work**. No engineer is SSHing into a switch.

\vspace{0.2cm}
\small
- **Cloud providers** (AWS, Azure, GCP): SDN logic distributed across every server in the data center
- **Telcos**: network functions running as **containers**, controlled via software APIs

\vspace{0.2cm}

The SDN \textbf{principles} are identical to what we studied:
\begin{itemize}
  \item Separate decisions from forwarding
  \item Control via software and APIs
\end{itemize}

:::
::: {.column width="52%"}

\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, font=\scriptsize, align=center},
    sw/.style={draw, thick, rounded corners, fill=gray!20, minimum width=1.5cm, minimum height=0.5cm, font=\tiny, align=center},
    >=Stealth
]

\node[box, fill=yellow!20, minimum width=2.8cm] (user) at (0, 4.2) {You (Cloud Console / API)};

\node[box, fill=blue!15, minimum width=4.8cm, minimum height=0.7cm] (ctrl) at (0, 2.8) {Distributed Control Plane\\{\tiny software on thousands of servers}};

\draw[->, thick] (user) -- node[right, font=\tiny, align=left] {create VPC,\\add route,\\attach firewall rule} (ctrl);

\node[sw] (v1) at (-2.2, 1.2) {vSwitch};
\node[sw] (v2) at (0,    1.2) {vSwitch};
\node[sw] (v3) at (2.2,  1.2) {vSwitch};

\draw[->, thick, blue!60] (ctrl) -- (v1);
\draw[->, thick, blue!60] (ctrl) -- (v2);
\draw[->, thick, blue!60] (ctrl) -- (v3);

\node[draw, rounded corners, fill=green!15, minimum width=1.3cm, minimum height=0.4cm, font=\tiny] at (-2.2, 0.3) {your VM};
\node[draw, rounded corners, fill=green!15, minimum width=1.3cm, minimum height=0.4cm, font=\tiny] at (0,    0.3) {your VM};
\node[draw, rounded corners, fill=green!15, minimum width=1.3cm, minimum height=0.4cm, font=\tiny] at (2.2,  0.3) {your VM};

\draw[thick] (v1.south) -- (-2.2, 0.52);
\draw[thick] (v2.south) -- (0,    0.52);
\draw[thick] (v3.south) -- (2.2,  0.52);

\node[font=\tiny, text=gray] at (0, -0.25) {No engineer touches a physical switch};

\end{tikzpicture}
\end{center}

:::
::::::::::::::

<!-- note: the point is not the vendor names but the recognition that SDN is what makes cloud networking work at scale -->

## Discussion: SDN Trade-offs

\begin{center}
\Large\textit{If the SDN controller fails,\\what happens to the network?}
\end{center}

\vfill

- Hint: single point of failure vs distributed control
- How do real deployments address this? (clustering, failover)

# Network Function Virtualization (NFV)

## Network Functions Virtualization (NFV)

A **network function (NF)** is any processing task a device performs on traffic: routing, filtering, load balancing, intrusion detection. Traditionally, each NF ran on a dedicated hardware appliance. NFV moves them to software on commodity servers.

- Traditional appliances: expensive (\euro{}10K--\euro{}100K+), slow to procure, hard to scale
\vspace{0.2cm}
- **VNF** (Virtual Network Function): an NF running on top of a VM $^1$
\vspace{0.2cm}
- **CNF** (Cloud-Native Network Function): an NF running on top of a container
\vspace{0.2cm}
- Can be instantiated, scaled, or deleted in minutes via software

\vspace{0.3cm}
\footnotesize SDN decides where traffic goes. NFV decides what happens to it.

\vfill
\begin{center}
\tiny $^1$ ETSI GS NFV 002, "NFV Architectural Framework," v1.2.1, 2014.
\end{center}

## NFV + Cloud Integration

- Deploy VNFs on cloud infrastructure $\rightarrow$ **minutes** instead of months
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
\draw[<->, very thick, red] (sdn) -- node[right, font=\scriptsize] {Work together} (nfv);
\end{tikzpicture}
\end{center}

:::
::: {.column width="50%"}

**Example: you open YouTube in your browser**

\vspace{0.2cm}

1. Your request arrives at the data center
2. **SDN** routes it to a **firewall VNF**: is this traffic safe?
3. Firewall approves; **SDN** routes it to a **load balancer VNF**
4. Load balancer picks a free server; video starts playing

\vspace{0.2cm}

- SDN **decides the path**; NFV **does the work** at each stop

:::
::::::::::::::

## Discussion: When Hardware Still Wins

\begin{center}
\Large\textit{Can you think of a scenario where a physical\\appliance is better than a VNF?}
\end{center}

\vfill

- Hint: think about latency, throughput, and specialized workloads
- What about hardware accelerators (FPGAs, SmartNICs)?

# Cloud-Native

## What Does Cloud-Native Mean?

- SDN and NFV give us programmable, virtualized infrastructure
\vspace{0.2cm}
- But applications can still be designed the **old way**: one big monolith, manually deployed, that happens to run in the cloud
\vspace{0.2cm}
- **Cloud-native** is the design philosophy that fully exploits what SDN, NFV, and containers make possible
\vspace{0.2cm}
- Key question: are you just *lifting and shifting* an old app, or designing for the cloud from the start?

\vspace{0.2cm}

:::::::::::::: {.columns}
::: {.column width="52%"}

\begin{center}
\small
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|l|l|l|}
\hline
\rowcolor{blue!10} & \textbf{Legacy} & \textbf{Cloud-Native} \\
\hline
Design & Monolith in a VM & Microservices \\
\hline
Scaling & Manual / vertical & Auto / horizontal \\
\hline
Failure & Restart whole app & Isolate service \\
\hline
Deploy & Manual steps & CI/CD pipeline \\
\hline
\end{tabular}
\end{center}

:::
::: {.column width="48%"}

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=1.3cm, minimum height=0.42cm, font=\tiny},
    >=Stealth
]
% --- Legacy (left) ---
\node[font=\tiny\bfseries, text=red!70] at (-2.2, 3.3) {Legacy};
\draw[draw=gray, thick, rounded corners, fill=gray!10] (-3.6,-0.2) rectangle (-0.8, 3.0);
\node[box, fill=gray!25, minimum width=2.4cm] at (-2.2, 2.6) {UI};
\node[box, fill=gray!25, minimum width=2.4cm] at (-2.2, 2.0) {Auth};
\node[box, fill=gray!25, minimum width=2.4cm] at (-2.2, 1.4) {Payment};
\node[box, fill=gray!25, minimum width=2.4cm] at (-2.2, 0.8) {Inventory};
\node[box, fill=gray!35, minimum width=2.4cm] at (-2.2, 0.2) {DB};
\node[font=\tiny, text=gray] at (-2.2,-0.5) {One VM, one deploy};

% --- Cloud-Native (right) ---
\node[font=\tiny\bfseries, text=green!60!black] at (2.2, 3.3) {Cloud-Native};
\node[box, fill=green!15] (ui)   at (2.2,  2.7) {UI};
\node[box, fill=green!15] (auth) at (0.9,  1.8) {Auth};
\node[box, fill=green!15] (pay)  at (2.2,  1.8) {Payment};
\node[box, fill=green!15] (inv)  at (3.5,  1.8) {Inventory};
\node[box, fill=purple!15] (db1) at (0.9,  0.9) {Users DB};
\node[box, fill=purple!15] (db2) at (2.2,  0.9) {Pay DB};
\node[box, fill=purple!15] (db3) at (3.5,  0.9) {Inv DB};
\draw[thin,gray] (ui.south) -- ++(0,-0.15) -| (auth.north);
\draw[thin,gray] (ui.south) -- (pay.north);
\draw[thin,gray] (ui.south) -- ++(0,-0.15) -| (inv.north);
\draw[thin,gray] (auth.south) -- (db1.north);
\draw[thin,gray] (pay.south)  -- (db2.north);
\draw[thin,gray] (inv.south)  -- (db3.north);

% K8s platform bar
\draw[draw=blue!50, thick, rounded corners, fill=blue!8]
  (0.2, 0.2) rectangle (4.2, 0.55);
\node[font=\tiny\bfseries, text=blue!70] at (2.2, 0.38) {Kubernetes (K8s)};

\node[font=\tiny, text=gray] at (2.2,-0.5) {Independent containers};
\end{tikzpicture}
\end{center}

:::
::::::::::::::

\vfill
\begin{center}
\tiny $^1$ CNCF, "Cloud Native Definition v1.0," github.com/cncf/toc, 2018.
\end{center}

## Cloud-Native Design Principles

Cloud-native applications are built around a small set of principles: $^1$

\vspace{0.2cm}

- **Microservices**: one responsibility per service; independent deploy and scale
\vspace{0.2cm}
- **Containers**: standard, portable packaging; same image from laptop to production
\vspace{0.2cm}
- **Declarative configuration**: describe *what* you want, not *how* to achieve it
\vspace{0.2cm}
- **Immutable infrastructure**: never patch a running instance; replace it with a new image
\vspace{0.2cm}
- **Automated delivery**: CI/CD pipelines build, test, and deploy without manual steps

\vfill
\begin{center}
\tiny $^1$ Burns et al., \textit{Kubernetes: Up and Running}, 3rd ed., O'Reilly, 2022.
\end{center}

## Microservices: From Monolith to Distributed

\small
\begin{itemize}
  \item \textbf{Monolithic} app: one big process, one deployment, one codebase
  \item \textbf{Microservices}: app split into small, independent services, each in its own container
  \item Rule of thumb: \textbf{1 microservice = 1 container}
\end{itemize}

\vspace{0.2cm}

:::::::::::::: {.columns}
::: {.column width="50%"}
\begin{center}
\begin{tikzpicture}[scale=0.85,
    box/.style={draw, thick, rounded corners, minimum width=1.4cm, minimum height=0.42cm, font=\tiny},
    >=Stealth
]
\node[font=\tiny\bfseries] at (0, 0.75) {Monolith Architecture};
\node[box, fill=gray!20] (mono) at (0,0) {Monolith};
\draw[->, line width=1pt, black!70] (0.85,0) -- (1.55,0);
\node[font=\tiny\bfseries] at (3.3, 1.05) {Microservice Architecture};
\node[box, fill=green!15] (ms1) at (3.3, 0.55) {Microservice 1};
\node[box, fill=green!15] (ms2) at (3.3, 0.0)  {Microservice 2};
\node[box, fill=green!15] (ms3) at (3.3,-0.55) {Microservice 3};
\draw[thin, gray] (1.55, 0.55) -- (ms1.west);
\draw[thin, gray] (1.55, 0.0)  -- (ms2.west);
\draw[thin, gray] (1.55,-0.55) -- (ms3.west);
\draw[thin, gray] (1.55,-0.55) -- (1.55,0.55);
\end{tikzpicture}
\end{center}
:::
::: {.column width="50%"}
\begin{center}
\tiny\textit{Example: e-commerce app}

\vspace{0.1cm}
\begin{tikzpicture}[scale=0.75,
    box/.style={draw, thick, rounded corners, minimum width=1.5cm, minimum height=0.42cm, font=\tiny},
    >=Stealth
]
% Monolith
\node[font=\tiny\bfseries] at (-2.2,1.6) {Monolith};
\draw[draw=gray, thick, rounded corners, fill=gray!10] (-3.4,-1.8) rectangle (-1.0,1.4);
\node[box, fill=green!15] at (-2.2, 1.0) {UI};
\node[box, fill=green!15] at (-2.2, 0.4) {Auth};
\node[box, fill=green!15] at (-2.2,-0.2) {Payment};
\node[box, fill=green!15] at (-2.2,-0.8) {Inventory};
\node[box, fill=purple!15] at (-2.2,-1.4) {DB};

% Arrow
\draw[->, line width=1pt, black!70] (-0.7,0) -- (0.1,0);

% Microservices (shifted left, wider spacing)
\node[font=\tiny\bfseries] at (2.0,1.6) {Microservices};
\node[box, fill=green!15] (ui)   at (2.0, 1.0) {UI};
\node[box, fill=green!15] (auth) at (0.2, 0.2) {Auth};
\node[box, fill=green!15] (pay)  at (2.0, 0.2) {Payment};
\node[box, fill=green!15] (inv)  at (3.8, 0.2) {Inventory};
\node[box, fill=purple!15] (db1) at (0.2,-0.8) {Users DB};
\node[box, fill=purple!15] (db2) at (2.0,-0.8) {Pay DB};
\node[box, fill=purple!15] (db3) at (3.8,-0.8) {Inv DB};

\draw[thin, gray] (ui.south) -- ++(0,-0.2) -| (auth.north);
\draw[thin, gray] (ui.south) -- (pay.north);
\draw[thin, gray] (ui.south) -- ++(0,-0.2) -| (inv.north);
\draw[thin, gray] (auth.south) -- (db1.north);
\draw[thin, gray] (pay.south)  -- (db2.north);
\draw[thin, gray] (inv.south)  -- (db3.north);

\node[font=\tiny, text=gray] at (2.0,-1.5) {Each service: own container \& database};
\end{tikzpicture}
\end{center}
:::
::::::::::::::

## Microservices: Network Challenges

:::::::::::::: {.columns}
::: {.column width="55%"}
\vfill
\begin{center}
\begin{tikzpicture}[scale=0.75,
    svc/.style={draw, thick, rounded corners, fill=green!15, minimum width=1.5cm, minimum height=0.5cm, font=\tiny},
    db/.style={draw, thick, rounded corners, fill=purple!15, minimum width=1.5cm, minimum height=0.5cm, font=\tiny},
    cont/.style={draw, dashed, rounded corners, fill=gray!5, inner sep=6pt},
    lbl/.style={font=\tiny\bfseries, text=black!60, fill=white, inner sep=1pt},
    >=Stealth
]

% Web Frontend
\node[cont, minimum width=2.2cm, minimum height=0.9cm] (cweb) at (0,0) {};
\node[svc] (web) at (0,0) {Web Frontend};
\node[lbl] at (cweb.north west) {Container};

% Auth Service
\node[cont, minimum width=2.2cm, minimum height=0.9cm] (cauth) at (-3,-1.8) {};
\node[svc] (auth) at (-3,-1.8) {Auth Service};
\node[lbl] at (cauth.north west) {Container};

% Payment
\node[cont, minimum width=2.2cm, minimum height=0.9cm] (cpay) at (0,-1.8) {};
\node[svc] (pay) at (0,-1.8) {Payment};
\node[lbl] at (cpay.north west) {Container};

% Inventory
\node[cont, minimum width=2.2cm, minimum height=0.9cm] (cinv) at (3,-1.8) {};
\node[svc] (inv) at (3,-1.8) {Inventory};
\node[lbl] at (cinv.north west) {Container};

% DBs
\node[db] (db1) at (-3,-3.1) {Users DB};
\node[db] (db2) at (3,-3.1) {Products DB};

\draw[->, thick] (web) -- (auth);
\draw[->, thick] (web) -- (pay);
\draw[->, thick] (web) -- (inv);
\draw[->, thick] (auth) -- (db1);
\draw[->, thick] (inv) -- (db2);
\draw[->, thick] (pay) -- (inv);
\end{tikzpicture}
\end{center}
\vfill
:::
::: {.column width="45%"}
\scriptsize
\begin{itemize}\itemsep6pt
  \item Services communicate over the \textbf{network} (HTTP/REST, gRPC)
  \item Network implications for hundreds of containers:
  \begin{itemize}\itemsep3pt
    \item \scriptsize \textbf{Service discovery}: "where is the payment service?"
    \item \scriptsize \textbf{Load balancing}: distribute requests across replicas
    \item \scriptsize \textbf{Observability}: trace requests across services
  \end{itemize}
  \item Every arrow = \textbf{network call} $\rightarrow$ latency and failure risk
  \item If Inventory is down $\rightarrow$ Payment and Web are affected (\textbf{cascading failure})
  \item Solutions: retries, timeouts, circuit breakers, service meshes
\end{itemize}
:::
::::::::::::::

## Kubernetes: The Cloud-Native Platform

These principles require a platform that handles scheduling, networking, scaling, and self-healing automatically. That platform is **Kubernetes (K8s)**, introduced in Block 4 Session 2.

\vspace{0.2cm}

From a networking perspective, K8s provides:

\vspace{0.1cm}

- Each **Pod** gets its own IP address (dynamic, managed by the platform)
- **Services** provide stable DNS names regardless of which host Pods run on
- **Ingress** controllers expose services externally with L7 routing
- **Network Policies** define which Pods can talk to which (micro-segmentation)
- **Container Network Interface (CNI)** plugins handle the overlay wiring (typically VXLAN-based)

\vfill
\footnotesize
Cloud-native networking requirements (dynamic IPs, cross-host comms, load balancing, policies) are exactly what K8s was built to solve.

## Discussion: Is Cloud-Native Always Better?

\begin{center}
\Large\textit{A bank has a 15-year-old monolithic payment application\\running on two dedicated servers.\\Should they rewrite it as cloud-native microservices?}
\end{center}

\vfill

- Hint: think about cost, risk, team skills, and whether the current system actually has a scaling problem
- Is "cloud-native" a tool for specific problems, or always the right answer?

# From VLANs to Overlay Networks

## Why Overlay Networks?

- SDN and NFV give us programmable, virtualized infrastructure
\vspace{0.2cm}
- Multiple tenants share the same physical network: their traffic must be **isolated**
\vspace{0.2cm}
- We know VLANs (Block 3), but VLANs have hard limits:
  - **12-bit ID**: maximum 4,096 networks
  - **Layer 2 only**: cannot span Layer 3 boundaries
  - Moving a VM to another host may require VLAN reconfiguration
\vspace{0.2cm}
- A cloud provider hosting millions of tenants cannot rely on VLANs
\vspace{0.2cm}
- **Overlay networks** solve this: scalable isolation that works across any physical topology

\vfill
\footnotesize We need a technology that scales beyond 4K networks and works across L3 boundaries.

## Overlay Networks: Concept

:::::::::::::: {.columns}
::: {.column width="45%"}

- An **overlay network** is a virtual network built **on top of** the physical one
\vspace{0.2cm}
- Uses **encapsulation**: the original frame is wrapped inside a physical packet
\vspace{0.2cm}
- The physical network only sees the **outer headers**: tenant traffic is invisible
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
- Endpoints: **VTEPs** (VXLAN Tunnel Endpoints) $^1$
  - Encapsulate at source, decapsulate at destination

\vfill
\begin{center}
\tiny $^1$ IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
\end{center}

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
- Decouples **virtual topology** from physical topology $^1$

\vfill
\begin{center}
\tiny $^1$ IETF RFC 7348, "Virtual eXtensible Local Area Network (VXLAN)," 2014.
\end{center}

## Discussion: Overlay Networks

\begin{center}
\Large\textit{Why can the physical network remain simple\\if we use overlay networks?\\What are the trade-offs of encapsulation?}
\end{center}

\vfill

Hints: think about overhead (extra headers), Maximum Transmission Unit (MTU) implications, and troubleshooting complexity.

# Container Networking

## Why Container Networking?

- Overlay networks give us scalable, isolated virtual networks across any physical infrastructure
\vspace{0.2cm}
- Modern applications are split into **dozens of independent services**, each deployed as a container
\vspace{0.2cm}
- Each container needs its own **network identity** (IP address, hostname)
\vspace{0.2cm}
- Containers must reach each other, possibly on **different physical hosts**
\vspace{0.2cm}
- The overlay networks we just studied are exactly what makes cross-host container communication possible at scale

\vfill
\footnotesize How does networking work inside and between container hosts?

## Container Networking: Starting Point

\scriptsize
\begin{itemize}
  \item Every container gets its own \textbf{network namespace}: isolated IP stack, interfaces, routing table
  \begin{itemize}
    \item \scriptsize Network namespace: private isolated environment where the container sees only its own interfaces and routes
  \end{itemize}
  \item Docker wires containers via \textbf{virtual bridges} and \textbf{veth pairs} (virtual cable)
  \item Containers reach each other, the host, and the internet depending on the \textbf{network model}
\end{itemize}

\begin{center}
\begin{tikzpicture}[
    iface/.style={draw, thick, fill=orange!15, rounded corners, minimum width=1.5cm, minimum height=0.4cm, font=\tiny},
    cont/.style={draw, thick, fill=green!15, rounded corners, minimum width=2.8cm, minimum height=1.0cm, font=\scriptsize},
    >=Stealth
]

% Host outer box
\draw[draw=black, thick, rounded corners, fill=gray!5] (-5.2,-2.0) rectangle (5.2,2.4);
\node[font=\small\bfseries] at (0,2.1) {Host};

% Container 1 namespace (top left)
\draw[draw=purple!50, thick, dashed, rounded corners, fill=purple!5] (-4.8,0.1) rectangle (-0.4,1.8);
\node[font=\tiny\bfseries, text=purple!70] at (-2.6,1.6) {Container 1 Network Namespace};
\node[cont] (c1) at (-2.6,1.0) {};
\node[font=\scriptsize] at (-2.6,1.25) {Container 1};
\node[iface] (eth1) at (-2.6,0.75) {\texttt{eth0} \ 172.17.0.2};

% Container 2 namespace (top right)
\draw[draw=purple!50, thick, dashed, rounded corners, fill=purple!5] (0.4,0.1) rectangle (4.8,1.8);
\node[font=\tiny\bfseries, text=purple!70] at (2.6,1.6) {Container 2 Network Namespace};
\node[cont, fill=purple!15] (c2) at (2.6,1.0) {};
\node[font=\scriptsize] at (2.6,1.25) {Container 2};
\node[iface] (eth2) at (2.6,0.75) {\texttt{eth0} \ 172.17.0.3};

% Host network namespace box (wraps bridge + veths)
\draw[draw=blue!50, thick, dashed, rounded corners, fill=blue!5] (-3.2,-1.5) rectangle (3.2,0.0);
\node[font=\tiny\bfseries, text=blue!70] at (0,-0.12) {Host Network Namespace};

% veth nodes on host side
\node[iface, fill=yellow!30, minimum width=1.0cm] (veth1) at (-2.6,-0.25) {\texttt{veth1}};
\node[iface, fill=yellow!30, minimum width=1.0cm] (veth2) at (2.6,-0.25) {\texttt{veth2}};

% Bridge
\node[draw, thick, fill=blue!15, minimum width=6cm, minimum height=0.4cm, font=\tiny] (bridge) at (0,-0.9) {\texttt{docker0} bridge \ 172.17.0.1};

% Physical NIC straddling the bottom border of the host box
\node[iface, fill=orange!15, minimum width=2.8cm] (pnic) at (0,-2.0) {\texttt{eth0} (Physical NIC) \ 192.168.1.10};

% Connections
\draw[thick] (eth1.south) -- (veth1.north);
\draw[thick] (veth1.south) -- (bridge.north -| veth1);
\draw[thick] (eth2.south) -- (veth2.north);
\draw[thick] (veth2.south) -- (bridge.north -| veth2);
\draw[thick] (bridge.south) -- (pnic.north);

% Annotation outside host box on the right, arrow pointing to Physical NIC
\node[font=\tiny, text=gray, align=left] (ann) at (7.5,0.1) {Visible from the host:};
\node[draw, fill=black, rounded corners=1pt, font=\tiny\ttfamily\color{white}, align=left, inner sep=3pt] (code) at (7.5,-1.2) {
  \$ ip a\\
  1: lo ...\\
  2: eth0 ...\\
  3: docker0 ...\\
  4: veth1 ...\\
  5: veth2 ...
};
\draw[->, thick, gray] (code.west) -- (3.2,-0.75);

\end{tikzpicture}
\end{center}

<!-- note: students have seen namespaces/cgroups/Docker in Lab3_Docker_Intro -- no need to repeat here -->

## Container Network Models

\scriptsize
\begin{itemize}
  \item \textbf{Bridge network (default):}
  \begin{itemize}
    \item \scriptsize Containers on the same host connected via a \textbf{virtual bridge} (\texttt{docker0}) $^1$
    \item \scriptsize Each container gets a \textbf{veth pair} (virtual Ethernet interface)
    \item \scriptsize \textbf{NAT} for external traffic; containers share host's IP
  \end{itemize}
  \vspace{0.15cm}
  \item \textbf{Host network:}
  \begin{itemize}
    \item \scriptsize Container uses the \textbf{host's network stack} directly
    \item \scriptsize No network isolation, but \textbf{no NAT overhead}
    \item \scriptsize Use for performance-critical applications
  \end{itemize}
  \vspace{0.15cm}
  \item \textbf{Overlay network:}
  \begin{itemize}
    \item \scriptsize Containers on \textbf{different hosts} connected via VXLAN overlay
    \item \scriptsize Same overlay concept we just covered, now applied to containers
    \item \scriptsize Enables \textbf{multi-host} container deployments
  \end{itemize}
\end{itemize}

\vfill
\begin{center}
\tiny $^1$ Docker, Inc., "Docker Networking Documentation," docs.docker.com/network.
\end{center}

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
\draw[thick, dashed, red] (br1) -- node[below, font=\scriptsize] {Overlay network (VXLAN)} (br2);
\end{tikzpicture}
\end{center}

- Within a host: containers use a **bridge** network
- Across hosts: an **overlay** connects the bridges (VXLAN from the previous section)

## Discussion: Containers vs VMs

\begin{center}
\Large\textit{If containers are faster and lighter than VMs,\\why do companies still use VMs?}
\end{center}

\vfill

- Hint: security isolation, legacy applications, compliance requirements
- In practice, containers often run inside VMs

# Infrastructure as Code \& Network Automation

## Infrastructure as Code (IaC)

- SDN, NFV, overlays, and cloud-native containers are all programmable: if still configured configured **by hand**, we are back to slow, error-prone, and unreproducible
\vspace{0.2cm}
- **IaC**: manage infrastructure through **code files**, not manual clicks or dashboards
\vspace{0.2cm}
- Describe the desired state in a file $\rightarrow$ tools apply it automatically
\vspace{0.2cm}
- **Reproducibility**: same config $\rightarrow$ same infrastructure, every time
\vspace{0.2cm}
- **Version control**: track changes in Git, review in pull requests, rollback instantly
\vspace{0.2cm}
- **Speed**: deploy entire environments in minutes $^1$

\vfill
\begin{center}
\tiny $^1$ Morris, *Infrastructure as Code*, 2nd ed., O'Reilly, 2021.
\end{center}

## IaC Example: Terraform (Conceptual)

:::::::::::::: {.columns}
::: {.column width="50%"}
\colorbox{black}{\begin{minipage}{0.72\columnwidth}
\color{white}\tiny\ttfamily
\# Define a VPC $^1$\\
resource "aws\_vpc" "main" \{\\
\hspace*{1em}cidr\_block = "10.0.0.0/16"\\
\}\\[0.2em]
\# Define a subnet\\
resource "aws\_subnet" "public" \{\\
\hspace*{1em}vpc\_id\hspace*{1.2em}= aws\_vpc.main.id\\
\hspace*{1em}cidr\_block = "10.0.1.0/24"\\
\}\\[0.2em]
\# Define a VM (EC2 instance)\\
resource "aws\_instance" "web" \{\\
\hspace*{1em}ami\hspace*{2.2em}= "ami-0abcdef1234567890"\\
\hspace*{1em}instance\_type = "t2.micro"\\
\hspace*{1em}subnet\_id\hspace*{0.6em}= aws\_subnet.public.id\\
\}\\[0.2em]
\# Define a security group\\
resource "aws\_security\_group" "web" \{\\
\hspace*{1em}vpc\_id = aws\_vpc.main.id\\
\hspace*{1em}ingress \{\\
\hspace*{2em}from\_port = 80\\
\hspace*{2em}to\_port\hspace*{0.6em}= 80\\
\hspace*{2em}protocol\hspace*{0.4em}= "tcp"\\
\hspace*{1em}\}\\
\}
\end{minipage}}
:::
::: {.column width="50%"}
\begin{center}
\begin{tikzpicture}[
    box/.style={draw, thick, rounded corners, font=\tiny, inner sep=4pt},
    >=Stealth
]

% VPC outer box
\draw[draw=blue!60, thick, rounded corners, fill=blue!5]
  (-2.2,-3.2) rectangle (2.2,2.0);
\node[font=\tiny\bfseries, text=blue!70] at (0,1.8) {VPC (10.0.0.0/16)};

% Subnet box inside VPC
\draw[draw=green!60, thick, rounded corners, fill=green!5]
  (-1.8,-2.8) rectangle (1.8,1.2);
\node[font=\tiny, text=green!70] at (0,1.0) {Subnet (10.0.1.0/24)};

% VM inside subnet
\node[box, fill=green!15, minimum width=2.2cm, minimum height=0.6cm] (vm) at (0,0.2) {VM (t2.micro)};

% Security group shield label
\node[box, draw=orange!60, fill=orange!10, minimum width=2.4cm] (sg) at (0,-0.8) {Security Group};
\node[font=\tiny, text=orange!80] at (0,-1.15) {Port 80/tcp allowed};

% Arrow VM -> SG
\draw[->, thick, orange!60] (vm.south) -- (sg.north);

% Arrow from outside pointing to SG (internet traffic)
\draw[->, thick, gray] (-2.2,-0.8) -- (sg.west) node[midway, above, font=\tiny, text=gray] {traffic};

\node[font=\tiny, text=gray] at (0,-2.6) {\textit{result of running terraform apply}};

\end{tikzpicture}
\end{center}
:::
::::::::::::::

<!-- nota: esto es solo para mostrar la idea de infraestructura declarativa, no es un tutorial de Terraform -->

\vfill
\begin{center}
\tiny $^1$ HashiCorp, "Terraform Documentation," terraform.io/docs.
\end{center}

## Discussion: IaC Risks

\begin{center}
\Large\textit{If infrastructure is defined as code,\\what happens when someone pushes a bug?}
\end{center}

\vfill

- Hint: code review, staging environments, automated testing
- How is this similar to software development best practices?

# Session Summary

## Key Takeaways

1. Traditional networks are **manual, rigid, and do not scale**
2. **SDN** separates control from data plane: centralized, programmable, API-driven
3. **NFV** replaces hardware appliances with software: flexible, fast to deploy, cheap
4. SDN and NFV are **complementary**: SDN steers traffic, NFV processes it
5. **VXLAN** overlays scale isolation to 16 million networks (vs 4,096 VLANs)
6. Containers use **bridge networks** on a single host and **overlay networks** across hosts
7. **Cloud-native** means designed for the cloud: microservices, containers, declarative config, immutable infra, automated delivery
8. **Microservices** require service discovery, load balancing, and resilience mechanisms (circuit breakers)
9. **IaC** automates infrastructure: reproducible, version-controlled, auditable

## Discussion

\begin{center}
\Large\textit{A company runs 200 microservices in containers.\\One Friday at 5 PM, a manual network change\\breaks communication for 50 of them.\\How could SDN and IaC have prevented this?}
\end{center}

\vfill

<!-- nota: guiar hacia: SDN da visibilidad global y control centralizado, IaC permite rollback instantáneo con git revert, ambos eliminan la configuración manual que causó el error -->

Hints: centralized control, automated testing, instant rollback, reproducibility.

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
14. CNCF, "Cloud Native Definition v1.0," github.com/cncf/toc, 2018.
15. Burns et al., \textit{Kubernetes: Up and Running}, 3rd ed., O'Reilly, 2022.
16. Latif et al., "A Comprehensive Survey of Interface Protocols for Software Defined Networks," arXiv:1902.07913, 2019.
