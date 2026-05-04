---
title: "Lab 3 -- Containers \\& Docker"
subtitle: "From Theory to Practice"
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
  - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
  - \logo{\includegraphics[height=0.6cm]{img/upf-logo.png}}
  - \titlegraphic{\includegraphics[height=1.2cm]{img/upf-logo.png}}
---

# VMs vs Containers: A Quick Recap

## What Is a Container?

- A **container** is a lightweight, isolated environment that runs an application
- Unlike a Virtual Machine (VM), it does **not** include a full operating system
  - It shares the **host's kernel** and only packages the app and its dependencies

\vspace{0.3cm}

- Key characteristics:
  - **Fast**: starts in seconds (no OS to boot)
  - **Small**: measured in MBs, not GBs
  - **Portable**: same container runs identically on any machine with a container runtime
  - **Ephemeral**: designed to be created, destroyed, and replaced quickly

<!-- note: remind students this was introduced in B4S1 -- here we go deeper -->

## How Containers Share the Kernel

\begin{center}
\begin{tikzpicture}[scale=0.75, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2.8cm, minimum height=1cm, font=\scriptsize, align=center},
    cmd/.style={font=\scriptsize\ttfamily},
    lbl/.style={font=\scriptsize\bfseries, align=center},
    >=Stealth
]
\node[lbl] at (-4.5,4.5) {Container A\\(Ubuntu)};
\node[lbl] at (0,4.5) {Container B\\(Alpine)};
\node[lbl] at (4.5,4.5) {Container C\\(Debian)};

\node[cmd] at (-4.5,3.5) {cat dog.txt};
\node[cmd] at (0,3.5) {ls /home};
\node[cmd] at (4.5,3.5) {ps aux};

\draw[thick] (-4.5,3.2) -- (-4.5,2.0);
\draw[thick] (0,3.2) -- (0,2.0);
\draw[thick] (4.5,3.2) -- (4.5,2.0);

\draw[thick] (-4.5,2.0) -- (0,2.0);
\draw[thick] (4.5,2.0) -- (0,2.0);
\draw[->, thick] (0,2.0) -- (0,1.5);

\node[font=\scriptsize, text=gray, anchor=west] at (1.0,1.7) {(all are just syscalls!)};

\node[box, fill=blue!15, minimum width=5cm] (kernel) at (0,0.7) {Linux Kernel\\\textit{"ok, I'll handle it"}};

\draw[->, thick] (0,-0.1) -- (0,-0.6);
\node[box, fill=gray!20, minimum width=5cm] (hw) at (0,-1.4) {Hardware / Infrastructure \\(Disk, CPU, RAM)};
\end{tikzpicture}
\end{center}

\vfill
\footnotesize
Every command inside any container is a syscall to the one shared kernel. The kernel uses **Linux namespaces** to ensure each container only sees its own files, processes, and network.

## VMs vs Containers: Side by Side

:::::::::::::: {.columns}
::: {.column width="50%"}
**Virtual Machines**

- Include a **full guest OS** per instance
\vspace{0.2cm}
- Size: **GBs** (OS + app + dependencies)
\vspace{0.2cm}
- Boot time: usually **minutes**
\vspace{0.2cm}
- Strong isolation: each VM has its own kernel
\vspace{0.2cm}
- Can run **different operating systems**

:::
::: {.column width="50%"}
**Containers**

- **No guest OS**: share the host kernel
\vspace{0.2cm}
- Size: **MBs** (app + dependencies only)
\vspace{0.2cm}
- Boot time: usually **seconds**
\vspace{0.2cm}
- Shared kernel: a kernel vulnerability affects all
\vspace{0.2cm}
- Need a **container runtime** (e.g., Docker), not a hypervisor

:::
::::::::::::::

\vfill
\footnotesize
Reminder: OS = Kernel + userspace (libraries, tools, shell, etc.).

## VMs vs Containers: Visual Comparison

\begin{center}
\includegraphics[width=0.62\textwidth]{img/vm-vs-container.png}
\end{center}

\footnotesize
- **Bins/Libs** = binaries and libraries: the dependencies each app needs to run (e.g., Python, OpenSSL, libc)
- Containers share the same kernel; VMs each carry their own

\vfill
\footnotesize Source: Aqueduct Technologies, "Containers and Virtual Machines," aqueducttech.com.

## When to Use VMs vs Containers

- **Use VMs when:**
  - The app needs a **different OS** than the host (e.g., Windows app on Linux)
  - **Strong tenant isolation** is required (e.g., multi-tenant cloud)
  - Running **legacy software** tied to a specific OS version

\vspace{0.3cm}

- **Use containers when:**
  - Building cloud-native or **microservices** applications
  - Need for **fast scaling** (seconds, not minutes)
  - Working in Continuous Integration / Continuous Deployment (CI/CD) pipelines: build, test, and deploy in identical environments

\vspace{0.3cm}

- **In practice**: most modern platforms combine both
  - VMs provide the isolation layer; containers run inside them

# Docker: Core Concepts

## What Is Docker?

:::::::::::::: {.columns}
::: {.column width="70%"}

- **Docker** is the most widely used container platform (released 2013)
- It provides a complete toolchain to **build, ship, and run** containers
- Built on top of Linux kernel features: **namespaces** and **cgroups**
  - Namespaces: isolate what a container can *see* (filesystem, network, processes)
  - cgroups (control groups): limit what a container can *use* (CPU, RAM)

\vspace{0.3cm}

- Docker made containers **accessible**: simple CLI, image registry, standard format
- Before Docker, using namespaces and cgroups required manual low-level configuration

:::
::: {.column width="30%"}

\begin{center}
\includegraphics[width=0.8\textwidth]{img/docker-logo.png}
\end{center}

:::
::::::::::::::

\footnotesize Source: Docker, Inc. docker.com

## Key Docker Concepts

\renewcommand{\arraystretch}{1.4}
\begin{tabular}{|l|p{9cm}|}
\hline
\rowcolor{blue!10}
\textbf{Concept} & \textbf{What it is} \\
\hline
\textbf{Image} & Read-only template that defines the container (app + dependencies + config) \\
\hline
\textbf{Container} & A running instance of an image \\
\hline
\textbf{Dockerfile} & Text file with instructions to build an image \\
\hline
\textbf{Registry} & Storage for images (Docker Hub is the default public registry) \\
\hline
\textbf{Volume} & Persistent storage that survives container restarts \\
\hline
\textbf{Network} & Virtual network that connects containers to each other and to the outside \\
\hline
\end{tabular}

\vspace{0.3cm}
\footnotesize Analogy: an \textbf{image} is a recipe; a \textbf{container} is the dish you cook from it. You can cook many dishes from the same recipe.

## Docker Architecture

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=3cm, minimum height=0.9cm, font=\small, align=center},
    sbox/.style={draw, thick, rounded corners, minimum width=2.4cm, minimum height=0.7cm, font=\scriptsize, align=center},
    >=Stealth
]

% CLI
\node[box, fill=yellow!20] (cli) at (-5, 2) {Docker CLI\\\texttt{docker run ...}};

% Daemon
\node[box, fill=blue!15, minimum width=4cm] (daemon) at (0, 2) {Docker Daemon\\\texttt{dockerd}};

% Registry
\node[box, fill=cyan!15] (registry) at (5, 2) {Registry\\(Docker Hub)};

% Arrows CLI <-> Daemon
\draw[<->, thick] (cli) -- (daemon) node[midway, above, font=\scriptsize] {REST API};

% Arrows Daemon <-> Registry
\draw[<->, thick] (daemon) -- (registry) node[midway, above, font=\scriptsize] {pull / push};

% Containers below daemon
\node[sbox, fill=green!15] (c1) at (-1.5, 0) {Container 1};
\node[sbox, fill=purple!15] (c2) at (1.5, 0) {Container 2};

\draw[->, thick] (daemon) -- (c1);
\draw[->, thick] (daemon) -- (c2);

% Images
\node[sbox, fill=orange!15] (img1) at (-1.5, -1.5) {Image A};
\node[sbox, fill=orange!15] (img2) at (1.5, -1.5) {Image B};

\draw[dashed, ->] (img1) -- (c1) node[midway, right, font=\tiny] {instantiates};
\draw[dashed, ->] (img2) -- (c2) node[midway, right, font=\tiny] {instantiates};

\end{tikzpicture}
\end{center}

\footnotesize
The CLI sends commands to the **daemon** via a REST Application Programming Interface (API). The daemon manages images, containers, networks, and volumes.

## Docker Images: Layers

- A Docker image is built from **layers**: each instruction in a Dockerfile adds one layer
- Layers are **read-only** and **cached**: only changed layers are rebuilt or re-downloaded

\begin{center}
\begin{tikzpicture}[scale=0.8, every node/.style={transform shape},
    layer/.style={draw, thick, minimum width=7cm, minimum height=0.6cm, font=\scriptsize, align=center}
]
\node[layer, fill=red!15]    at (0, 3.0) {Layer 4 -- \texttt{COPY app.py /app/}  (your code)};
\node[layer, fill=orange!15] at (0, 2.2) {Layer 3 -- \texttt{RUN pip install flask}  (dependencies)};
\node[layer, fill=yellow!15] at (0, 1.4) {Layer 2 -- \texttt{RUN apt-get install python3}};
\node[layer, fill=green!15]  at (0, 0.6) {Layer 1 -- \texttt{FROM ubuntu:22.04}  (base image)};
\node[layer, fill=gray!20]   at (0,-0.2) {Read-only layers (shared across images)};
\draw[thick, dashed] (-3.5, 0.15) -- (3.5, 0.15);
\end{tikzpicture}
\end{center}

\footnotesize
When a container starts, Docker adds a thin **writable layer** on top. All changes (files created, modified) go there. When the container is deleted, that layer is gone.

## The Dockerfile

- A **Dockerfile** is a plain text file that describes how to build an image
- Each line is an instruction; Docker executes them top to bottom

\vspace{0.2cm}

```dockerfile
FROM ubuntu:22.04          # start from base image
RUN apt-get update && \
    apt-get install -y python3 python3-pip   # install deps
WORKDIR /app               # set working directory
COPY app.py .              # copy your code in
RUN pip install flask      # install Python deps
EXPOSE 5000                # document the port
CMD ["python3", "app.py"]  # default command to run
```

\vspace{0.2cm}

- `FROM`: always the first instruction; defines the base
- `RUN`: executes a shell command during build
- `COPY`: copies files from your machine into the image
- `CMD`: what runs when you do `docker run`

## Essential Docker Commands

\renewcommand{\arraystretch}{1.35}
\begin{tabular}{|l|p{7.5cm}|}
\hline
\rowcolor{blue!10}
\textbf{Command} & \textbf{What it does} \\
\hline
\texttt{docker pull nginx} & Download image from registry \\
\hline
\texttt{docker build -t myapp .} & Build image from Dockerfile in current directory \\
\hline
\texttt{docker run nginx} & Create and start a container from image \\
\hline
\texttt{docker run -d -p 8080:80 nginx} & Run detached, map host port 8080 to container port 80 \\
\hline
\texttt{docker ps} & List running containers \\
\hline
\texttt{docker ps -a} & List all containers (including stopped) \\
\hline
\texttt{docker exec -it \textless{}id\textgreater{} bash} & Open a shell inside a running container \\
\hline
\texttt{docker stop \textless{}id\textgreater{}} & Gracefully stop a container \\
\hline
\texttt{docker rm \textless{}id\textgreater{}} & Delete a stopped container \\
\hline
\texttt{docker images} & List locally available images \\
\hline
\texttt{docker rmi \textless{}image\textgreater{}} & Delete a local image \\
\hline
\end{tabular}

# Docker Networking

## How Containers Connect

- By default, Docker creates a **virtual bridge network** called `docker0`
- Every container gets a **virtual Network Interface Card (vNIC)** connected to that bridge
- The bridge handles Layer 2 forwarding between containers on the same host

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2.5cm, minimum height=0.8cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15]  (c1) at (-4, 2) {Container 1\\172.17.0.2};
\node[box, fill=purple!15] (c2) at (0,   2) {Container 2\\172.17.0.3};
\node[box, fill=blue!15]   (c3) at (4,   2) {Container 3\\172.17.0.4};

\node[box, fill=gray!20, minimum width=10cm] (bridge) at (0, 0.5) {docker0 bridge (virtual switch) -- 172.17.0.1};

\draw[thick] (c1) -- (-4, 0.9);
\draw[thick] (c2) -- (0,  0.9);
\draw[thick] (c3) -- (4,  0.9);

\node[box, fill=orange!15] (nic) at (0, -0.8) {Physical NIC (eth0)};
\draw[thick] (bridge) -- (nic);

\node[draw, cloud, cloud puffs=9, fill=cyan!10, minimum width=2.5cm, minimum height=1cm, font=\scriptsize] (inet) at (0, -2.3) {Internet};
\draw[thick] (nic) -- (inet);
\end{tikzpicture}
\end{center}

<!-- note: connect to bridge-1 concept from B4S1 virtual networking section -->

## Docker Network Modes

\renewcommand{\arraystretch}{1.4}
\begin{tabular}{|l|p{4cm}|p{4.5cm}|}
\hline
\rowcolor{blue!10}
\textbf{Mode} & \textbf{How it works} & \textbf{Use case} \\
\hline
\textbf{bridge} (default) & Container gets private IP on \texttt{docker0}; Network Address Translation (NAT) to reach outside & Most single-host scenarios \\
\hline
\textbf{host} & Container shares the host's network stack directly & High-performance / low-latency needs \\
\hline
\textbf{none} & No network interface at all & Isolated batch jobs \\
\hline
\textbf{custom bridge} & User-defined bridge; containers resolve each other by name & Multi-container apps \\
\hline
\end{tabular}

\vspace{0.3cm}
\footnotesize
In bridge mode, containers can reach the internet via NAT (same concept as VM NAT mode in B4S1), but are not directly reachable from outside unless you explicitly expose ports.

## Port Mapping

- Containers run in an isolated network namespace: **their ports are not visible from outside by default**
- To expose a service, you **map** a host port to a container port:

\vspace{0.2cm}

```bash
docker run -d -p 8080:80 nginx
```

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=3cm, minimum height=0.9cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[draw, cloud, cloud puffs=9, fill=cyan!10, minimum width=2.5cm, minimum height=1cm, font=\scriptsize] (inet) at (-5, 1) {Browser / Client};
\node[box, fill=orange!15] (host) at (0, 1) {Host\\port 8080};
\node[box, fill=green!15]  (cont) at (5, 1) {nginx container\\port 80};

\draw[->, thick] (inet) -- (host) node[midway, above, font=\scriptsize] {HTTP :8080};
\draw[->, thick] (host) -- (cont) node[midway, above, font=\scriptsize] {forward to :80};
\end{tikzpicture}
\end{center}

\footnotesize
The Docker daemon intercepts traffic arriving on host port 8080 and forwards it to port 80 inside the container. From the container's perspective, it always listens on port 80.

# Data Persistence

## The Problem: Containers Are Ephemeral

- When a container is **deleted**, everything written inside it is lost
- This is intentional: containers are meant to be stateless and replaceable

\vspace{0.3cm}

- **Problem**: some applications need to persist data:
  - Databases (MySQL, PostgreSQL)
  - Log files
  - User-uploaded files

\vspace{0.3cm}

- **Solution**: Docker provides two mechanisms to persist data outside the container:
  - **Volumes**: managed by Docker, stored in `/var/lib/docker/volumes/`
  - **Bind mounts**: map a specific directory from the host into the container

<!-- note: emphasize that the writable layer dies with the container -- this surprises students -->

## Volumes vs Bind Mounts

:::::::::::::: {.columns}
::: {.column width="50%"}
**Volume**

```bash
docker run -v mydata:/data nginx
```

- Docker manages the storage location
- Portable across hosts
- Survives container deletion
- Best for **production** use

:::
::: {.column width="50%"}
**Bind Mount**

```bash
docker run -v /home/user/app:/app nginx
```

- You specify the exact host path
- Useful during **development**: edit code on host, see changes live in container
- Less portable (path must exist on host)

:::
::::::::::::::

\begin{center}
\begin{tikzpicture}[scale=0.8, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2.8cm, minimum height=0.7cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15]  (cont) at (0, 1.5) {Container};
\node[box, fill=blue!15]   (vol)  at (-3, 0) {Docker Volume\\(managed)};
\node[box, fill=orange!15] (bind) at (3,  0) {Host Directory\\(bind mount)};
\draw[<->, thick] (cont) -- (vol);
\draw[<->, thick] (cont) -- (bind);
\end{tikzpicture}
\end{center}

# Multi-Container Applications

## Docker Compose

- Real applications have **multiple services**: web server, database, cache, etc.
- Running them manually with `docker run` is error-prone and hard to reproduce
- **Docker Compose** lets you define all services in a single `docker-compose.yml` file

\vspace{0.2cm}

```yaml
services:
  web:
    image: nginx
    ports:
      - "8080:80"
  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

\vspace{0.2cm}

- `docker compose up` starts everything; `docker compose down` tears it all down

## Docker Compose: How Services Connect

- Compose automatically creates a **custom bridge network** for the application
- Services can reach each other **by name** (DNS resolution built in)

\begin{center}
\begin{tikzpicture}[scale=0.85, every node/.style={transform shape},
    box/.style={draw, thick, rounded corners, minimum width=2.8cm, minimum height=0.9cm, font=\scriptsize, align=center},
    >=Stealth
]
\node[box, fill=green!15]  (web) at (-3, 1.5) {web\\(nginx)};
\node[box, fill=purple!15] (db)  at (3,  1.5) {db\\(postgres)};
\node[box, fill=blue!10, minimum width=8cm] (net) at (0, 0) {Custom bridge network (app\_default)};

\draw[thick] (web) -- (-3, 0.45);
\draw[thick] (db)  -- (3,  0.45);
\draw[->, thick, dashed] (web) to[bend left=20] node[above, font=\scriptsize] {\texttt{db:5432}} (db);
\end{tikzpicture}
\end{center}

\footnotesize
The \texttt{web} container can connect to the database simply using \texttt{db} as the hostname. No IP addresses needed.

# Summary

## Key Takeaways

- **Containers** package an app with its dependencies but share the host kernel: lighter and faster than VMs
- **Docker** is the standard tool to build, ship, and run containers: images, containers, Dockerfile, registry
- Images are built from **layers**: cache makes rebuilds fast
- Docker networking uses a **bridge** by default: containers are isolated but can communicate and expose ports via mapping
- Data written inside a container is **lost on deletion**: use volumes or bind mounts for persistence
- **Docker Compose** manages multi-container applications declaratively

\vspace{0.3cm}

- You are now ready for the lab: `docker pull`, `docker run`, `docker build`, port mapping, and volumes

## References

- Docker Documentation. \textit{Docker Overview}. docs.docker.com
- Docker Documentation. \textit{Networking overview}. docs.docker.com/network
- Docker Documentation. \textit{Use volumes}. docs.docker.com/storage/volumes
- Docker Documentation. \textit{Docker Compose}. docs.docker.com/compose
- Kerrisk, M. \textit{The Linux Programming Interface}. No Starch Press, 2010. (Namespaces and cgroups)
