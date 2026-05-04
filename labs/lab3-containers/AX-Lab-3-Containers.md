---
geometry: margin=2.5cm
fontsize: 11pt
colorlinks: true
urlcolor: blue
header-includes:
  - \input{labs/lab3-containers/preamble.tex}
---

```{=latex}
\begin{center}
  {\Large\textbf{Lab 3 -- Virtualization with Containers (Docker)}}\\[0.4cm]
  {\large Arquitectura de Xarxes -- 2025-2026 3rd quarter}\\[0.4cm]
  \includegraphics[height=1.5cm]{labs/lab3-containers/img/upf-logo.png}\\[0.3cm]
  {\normalsize Universitat Pompeu Fabra}
\end{center}
\vspace{0.5cm}
```

# Introduction

In this lab, we explore **containerization** using Docker -- one of the core technologies behind modern cloud infrastructure, used by AWS, Microsoft Azure, Google Cloud, and most production environments today.

In the theory sessions, we compared Virtual Machines (VMs) and containers: both provide isolation, but containers share the host operating system kernel and are significantly more lightweight, faster to start, and easier to distribute. This lab puts that theory into practice.

We will use **Nginx** as our example application throughout this lab.

**By the end of this lab, you will be able to:**

- Build a custom Docker image from a Dockerfile
- Run and manage containers on a dedicated network
- Understand how container networking and port mapping work
- Persist data across container restarts using volume mounts
- Run multiple containers that communicate with each other
- Publish an image to a public registry (Docker Hub)

**Note:** use the same VM from previous sessions (one dedicated VM was assigned per group). Docker is already installed. Feel free to use your own Linux environment if you prefer.

---

## Submission instructions

- Deliver a **PDF report** containing each question (Q1--Q26) followed by your answer and any relevant screenshots. Question Q27 is optional.
- Include the names and NIAs of all group members on the cover page.
- Name the file: `AX_lab3_NIA1_NIA2_NIA3.pdf`
- Deadline: before the next lab session starts.
- **Academic integrity:** write your answers in your own words. AI-generated text is easy to spot. If we detect it, the grade is 0.

---

\newpage

**Before starting:** review the Docker intro slide deck shared in the course materials. It covers the key concepts (images, containers, layers, networks, volumes) that you will need throughout this lab.

# Lab Work

## Step 1 -- Verify Docker installation

Run the following commands to confirm Docker is installed:

```{=latex}
\begin{shellblock}[Terminal -- verify installation]
# Show available Docker arguments
sudo docker --help

# Check the installed version
sudo docker --version
sudo docker -v
\end{shellblock}
```

**Note:** if Docker is not installed, follow the official installation guide at `docs.docker.com/engine/install`.

## Step 2 -- Run Docker without sudo

By default, Docker requires `sudo`, which grants root-level privileges to every container and command. This is a security risk: if a malicious container escapes, it could compromise the entire host system.

A safer approach is adding your user to the `docker` group:

```{=latex}
\begin{shellblock}[Terminal -- add user to docker group]
# Add current user to the docker group
sudo usermod -aG docker $USER

# Reboot the VM to apply the change
sudo reboot
\end{shellblock}
```

After the reboot:

```{=latex}
\begin{shellblock}[Terminal -- verify Docker works without sudo]
docker --version

# Run the hello-world container to verify end-to-end
docker run hello-world
\end{shellblock}
```

The `hello-world` container is a minimal image that prints a confirmation message and exits. It verifies the full installation pipeline: daemon, image pull, and container execution.

## Step 3 -- Pull the Nginx image

Docker images are downloaded from a **registry** -- a centralised repository of container images. The default registry is Docker Hub (`hub.docker.com`).

Pull the official Nginx image:

```{=latex}
\begin{shellblock}[Terminal -- pull Nginx image]
docker pull nginx
\end{shellblock}
```

List the images available on your host:

```{=latex}
\begin{shellblock}[Terminal -- list local images]
docker images
\end{shellblock}
```

\begin{questionbox}
\textbf{Q1:} What is Nginx? What is it used for in practice? Have you interacted with it before without knowing?
\end{questionbox}

\begin{questionbox}
\textbf{Q2:} What is the size of the Nginx image? What factors do you think influence the size of a Docker image? Is a larger image preferable or a smaller one? Justify your answer.
\end{questionbox}

## Step 4 -- Write a Dockerfile for a custom Nginx image

Rather than using the official Nginx image directly, we will build a **custom image** that serves our own HTML page.

Create a working folder and move into it:

```{=latex}
\begin{shellblock}[Terminal -- create working folder]
mkdir ~/lab3-docker && cd ~/lab3-docker
\end{shellblock}
```

Create a simple HTML file named `index.html`. You can use `nano` or `gedit`:

```{=latex}
\begin{shellblock}[Terminal -- create index.html]
nano index.html
# Press Ctrl+O to save, Ctrl+X to exit
\end{shellblock}
```

Content of `index.html`:

```{=latex}
\begin{dockerblock}[index.html]
<!DOCTYPE html>
<html>
  <head><title>AX Lab 3</title></head>
  <body>
    <h1>Hello from Docker!</h1>
    <p>This page is served by Nginx inside a container.</p>
  </body>
</html>
\end{dockerblock}
```

Now, **write the Dockerfile from scratch** without referring to the theory slides. Create a file named `Dockerfile` (no extension) in the same folder. Your image must satisfy these requirements:

- Base image: `nginx:latest`
- Copy `index.html` into the directory Nginx uses to serve static files: `/usr/share/nginx/html/`
- Expose port `80`

Once written, verify the file content:

```{=latex}
\begin{shellblock}[Terminal -- inspect your Dockerfile]
cat Dockerfile
\end{shellblock}
```

\begin{questionbox}
\textbf{Q3:} What does each line of your Dockerfile do? If the build fails, describe what you found wrong and how you fixed it.
\end{questionbox}

## Step 5 -- Build the image

Build your custom image using the name `my-nginx`:

```{=latex}
\begin{shellblock}[Terminal -- build image]
docker build -t my-nginx .
\end{shellblock}
```

The `-t` flag sets the image name. The `.` tells Docker to look for the Dockerfile in the current directory. If you are unsure what a flag does, use `--help`:

```{=latex}
\begin{shellblock}[Terminal -- explore flags]
docker build --help
\end{shellblock}
```

Verify the image was created:

```{=latex}
\begin{shellblock}[Terminal -- list images]
docker images
\end{shellblock}
```

\begin{questionbox}
\textbf{Q4:} You now see both \texttt{nginx} (the official image from step 3) and \texttt{my-nginx} (your custom image). Why is \texttt{my-nginx} not significantly larger, even though you added a file to it? What are Docker image layers?
\end{questionbox}

## Step 6 -- Create a dedicated network

Docker provides networking capabilities so containers can communicate with each other and with the outside world. Before creating our own network, let us inspect what Docker provides by default:

```{=latex}
\begin{shellblock}[Terminal -- inspect default Docker networks]
docker network ls
docker network inspect bridge
docker network inspect host
docker network inspect none
\end{shellblock}
```

\begin{questionbox}
\textbf{Q5--Q7:}
\begin{itemize}
  \item[Q5.] What is the purpose of each of the three default networks (\texttt{bridge}, \texttt{host}, \texttt{none})?
  \item[Q6.] When you run a container without specifying \texttt{--net}, which network does Docker use by default?
  \item[Q7.] What limitation does the default \texttt{bridge} network have compared to a user-defined network?
\end{itemize}
\end{questionbox}

Now create a dedicated network for our lab:

```{=latex}
\begin{shellblock}[Terminal -- create custom network]
docker network create --subnet=172.18.0.0/16 dockerNet
docker network ls
\end{shellblock}
```

Check the host network interfaces:

```{=latex}
\begin{shellblock}[Terminal -- inspect host interfaces]
ip a
\end{shellblock}
```

You will notice a new interface with IP `172.18.0.1` has appeared. This is the gateway that connects your host to containers on `dockerNet`.

**Note:** you will also see a `docker0` interface. This is the default bridge interface created by Docker at installation time. We will not use it in this lab, as we want a dedicated and isolated network.

## Step 7 -- Run a container

Start a container from your `my-nginx` image:

```{=latex}
\begin{shellblock}[Terminal -- run container]
docker run --detach --rm \
  --publish 8080:80 \
  --name webserver \
  --net dockerNet \
  --ip 172.18.0.2 \
  my-nginx
\end{shellblock}
```

Here is what each flag does:

| Flag | Meaning |
|------|---------|
| `--detach` | Run in the background |
| `--rm` | Remove container automatically when stopped |
| `--publish 8080:80` | Map port 8080 on the host to port 80 inside the container |
| `--name` | Assign a human-readable name to the container |
| `--net` | Connect to a specific Docker network |
| `--ip` | Assign a static IP within that network |

Verify the container is running:

```{=latex}
\begin{shellblock}[Terminal -- list running containers]
docker container ls
\end{shellblock}
```

**Try it:** attempt to start a second container with the same IP (`172.18.0.2`). What happens? Also try an IP outside the subnet (e.g. `172.20.0.5`). What does this tell you about how Docker validates IP assignments?

## Step 8 -- Test the web server and inspect container networking

Verify Nginx is serving your custom page. We use `curl` to make HTTP requests from the terminal -- it is the equivalent of typing a URL in your browser and reading the response, just without the graphical interface.

```{=latex}
\begin{shellblock}[Terminal -- test web server]
# Using the container IP directly
curl http://172.18.0.2:80

# Using the host port mapping
curl http://localhost:8080
\end{shellblock}
```

\begin{questionbox}
\textbf{Q8:} Both commands reach the same container. Explain why. What role does the \texttt{--publish 8080:80} flag play?
\end{questionbox}

\begin{questionbox}
\textbf{Q9:} Draw a simple diagram showing the relationship between your laptop, the VM, and the Docker container. Show how a request from your laptop reaches the Nginx process inside the container. Include the relevant port numbers.
\end{questionbox}

Now enter the container and inspect its network configuration from the inside:

```{=latex}
\begin{shellblock}[Terminal -- open shell inside container]
docker exec -it webserver sh
\end{shellblock}
```

Once inside, run:

```{=latex}
\begin{shellblock}[Inside container]
ip a
exit
\end{shellblock}
```

Then run `ip a` again on the host.

\begin{questionbox}
\textbf{Q10--Q12:}
\begin{itemize}
  \item[Q10.] What do the flags \texttt{-i} and \texttt{-t} mean in \texttt{docker exec -it}?
  \item[Q11.] Why is the network interface output different inside the container compared to the host?
  \item[Q12.] Can the host and the container be considered separate network entities? Justify your answer.
\end{itemize}
\end{questionbox}

## Step 9 -- Execute commands inside a container

You can run individual commands inside a running container without opening an interactive shell:

```{=latex}
\begin{shellblock}[Terminal -- inject commands into container]
docker exec webserver ls
docker exec webserver mkdir test
docker exec webserver ls
\end{shellblock}
```

\begin{questionbox}
\textbf{Q13:} You created a directory inside the running container. What do you think happens to that directory when the container is stopped and a new one is started from the same image? Why?
\end{questionbox}

## Step 10 -- Fetch and follow container logs

Nginx logs every HTTP request it receives. Fetch the logs of your running container:

```{=latex}
\begin{shellblock}[Terminal -- fetch container logs]
docker logs webserver
\end{shellblock}
```

Now follow the logs in real time (use `docker logs --help` to find the right flag). Then, in a **separate terminal**, send a few requests:

```{=latex}
\begin{shellblock}[Terminal 2 -- generate traffic]
curl http://localhost:8080
curl http://localhost:8080
\end{shellblock}
```

\begin{questionbox}
\textbf{Q14:} Add a screenshot of the live log output. What information does each log line contain?
\end{questionbox}

## Step 11 -- Log persistence problem

Stop the container:

```{=latex}
\begin{shellblock}[Terminal -- stop container]
docker container stop webserver
\end{shellblock}
```

Since we used `--rm`, the container is automatically deleted when stopped. Verify:

```{=latex}
\begin{shellblock}[Terminal -- verify container is gone]
docker container ls -a
\end{shellblock}
```

Start a new container from the same image and check its logs:

```{=latex}
\begin{shellblock}[Terminal -- start fresh container and check logs]
docker run --detach --rm \
  --publish 8080:80 \
  --name webserver \
  --net dockerNet \
  --ip 172.18.0.2 \
  my-nginx

docker logs webserver
\end{shellblock}
```

\begin{questionbox}
\textbf{Q15:} What happened to the logs from the previous container? Is this a problem in a real-world scenario? Describe a concrete case where losing logs would have serious consequences.
\end{questionbox}

## Step 12 -- Persist logs with a volume mount

To solve the log persistence problem, we use a **volume mount**: a host directory is linked to a path inside the container, so data written there survives container restarts.

Stop the current container and start a new one with a volume:

```{=latex}
\begin{shellblock}[Terminal -- run container with volume mount]
docker container stop webserver

docker run --detach --rm \
  --publish 8080:80 \
  --name webserver \
  --net dockerNet \
  --ip 172.18.0.2 \
  --volume /tmp/nginx-logs:/var/log/nginx \
  my-nginx
\end{shellblock}
```

The flag `--volume /tmp/nginx-logs:/var/log/nginx` maps the host directory `/tmp/nginx-logs` to the path where Nginx writes its access and error logs inside the container.

Generate some log entries:

```{=latex}
\begin{shellblock}[Terminal -- generate traffic]
curl http://localhost:8080
curl http://localhost:8080
\end{shellblock}
```

Inspect the log files on the host:

```{=latex}
\begin{shellblock}[Terminal -- inspect logs on host]
ls /tmp/nginx-logs
cat /tmp/nginx-logs/access.log
\end{shellblock}
```

\begin{questionbox}
\textbf{Q16--Q18:}
\begin{itemize}
  \item[Q16.] What does \texttt{access.log} contain?
  \item[Q17.] Stop the container and start it again. Are the previous log entries still there? Why?
  \item[Q18.] What problem does the volume mount solve? What would happen without it?
\end{itemize}
\end{questionbox}

## Step 13 -- Two-container communication

In real deployments, applications are split across multiple containers that need to communicate. Let us simulate this by running a second container on the same network.

```{=latex}
\begin{shellblock}[Terminal -- run second container]
docker run --detach --rm \
  --publish 8081:80 \
  --name webserver2 \
  --net dockerNet \
  --ip 172.18.0.3 \
  my-nginx
\end{shellblock}
```

Test connectivity from `webserver` to `webserver2`, both by IP and by container name:

```{=latex}
\begin{shellblock}[Terminal -- test inter-container connectivity]
# By IP address
docker exec webserver curl http://172.18.0.3:80

# By container name
docker exec webserver curl http://webserver2:80
\end{shellblock}
```

\begin{questionbox}
\textbf{Q19--Q22:}
\begin{itemize}
  \item[Q19.] Does communication by IP work? Why?
  \item[Q20.] Does communication by container name work? Why? Would this work on the default \texttt{bridge} network?
  \item[Q21.] Stop \texttt{webserver2}. What happens when you try to reach it from \texttt{webserver}?
  \item[Q22.] In a production environment, what mechanism would you use to avoid hardcoding container IPs?
\end{itemize}
\end{questionbox}

## Step 14 -- Serve different content per container

Currently both containers serve identical content. Let us change the page served by `webserver2` using a volume mount, without rebuilding the image.

Create a second HTML file:

```{=latex}
\begin{shellblock}[Terminal -- create second HTML page]
echo "<h1>This is webserver2</h1>" > ~/lab3-docker/index2.html
\end{shellblock}
```

Stop `webserver2` and restart it mounting the new file:

```{=latex}
\begin{shellblock}[Terminal -- restart webserver2 with custom content]
docker container stop webserver2

docker run --detach --rm \
  --publish 8081:80 \
  --name webserver2 \
  --net dockerNet \
  --ip 172.18.0.3 \
  --volume ~/lab3-docker/index2.html:/usr/share/nginx/html/index.html \
  my-nginx
\end{shellblock}
```

Verify both containers serve different content:

```{=latex}
\begin{shellblock}[Terminal -- verify different content]
curl http://localhost:8080
curl http://localhost:8081
\end{shellblock}
```

\begin{questionbox}
\textbf{Q23:} You changed the content served by \texttt{webserver2} without rebuilding the image. What does this tell you about the relationship between images and containers? What is the conceptual difference between a Docker \textit{image} and a Docker \textit{container}?
\end{questionbox}

## Step 15 -- Publish your image to Docker Hub

Docker Hub is the default public registry where images are stored and shared. We will publish `my-nginx` so that others (including your teacher) can download and run it.

**Create an account** at `https://hub.docker.com`.

Then create a personal access token: go to **Account Settings > Personal Access Tokens**. Grant at least **Read and Write** permissions.

**Note:** using a token instead of your password is a common security practice. If the token is accidentally exposed, you can revoke it without losing access to your account.

Log in from the terminal:

```{=latex}
\begin{shellblock}[Terminal -- log in to Docker Hub]
docker login -u <your-username>
# Paste your token when prompted
\end{shellblock}
```

Tag and push the image:

```{=latex}
\begin{shellblock}[Terminal -- tag and push image]
docker tag my-nginx <your-username>/my-nginx:latest
docker push <your-username>/my-nginx:latest
\end{shellblock}
```

**Note:** it is not necessary to create the repository on Docker Hub beforehand. The push operation creates it automatically.

Verify the image is visible at `https://hub.docker.com/repositories/<your-username>`. Add a screenshot to your report.

\begin{questionbox}
\textbf{Q24:} The image is public by default, meaning anyone can download and run it. What are the security implications of this? In what cases would you use a private registry instead?
\end{questionbox}

## Step 16 -- Multi-container application with Docker Compose

So far, we have managed containers with individual `docker run` commands. In practice, multi-container applications are defined declaratively using **Docker Compose**, which describes the entire application stack in a single file.

Create a file named `docker-compose.yml` in `~/lab3-docker/`:

```{=latex}
\begin{dockerblock}[docker-compose.yml]
services:
  web:
    image: my-nginx
    ports:
      - "8080:80"
    networks:
      appnet:
        ipv4_address: 172.19.0.2
    volumes:
      - /tmp/nginx-logs:/var/log/nginx

  web2:
    image: my-nginx
    ports:
      - "8081:80"
    networks:
      appnet:
        ipv4_address: 172.19.0.3

networks:
  appnet:
    driver: bridge
    ipam:
      config:
        - subnet: 172.19.0.0/16
\end{dockerblock}
```

Start the application:

```{=latex}
\begin{shellblock}[Terminal -- start Compose application]
docker compose up -d
docker compose ps
\end{shellblock}
```

\begin{questionbox}
\textbf{Q25--Q27:}
\begin{itemize}
  \item[Q25.] Can \texttt{web} reach \texttt{web2} by service name (e.g. \texttt{docker exec ... curl http://web2})? Why?
  \item[Q26.] Run \texttt{docker compose down}. What happens to the containers, the network, and the volume mount?
  \item[Q27.] What is the main advantage of \texttt{docker-compose.yml} compared to running individual \texttt{docker run} commands?
\end{itemize}
\end{questionbox}

\begin{questionbox}
\textbf{Q28 (Optional):} So far we have used \texttt{curl} to test the web server. SSH supports port forwarding, which allows you to tunnel a port from the VM to your laptop so you can open the page in your own browser. Research how to do this and try it. What command did you use? Add a screenshot of the page open in your browser. What is the conceptual similarity between SSH port forwarding and Docker's \texttt{--publish} flag?
\end{questionbox}

## Step 17 (Optional) -- Clean up

To remove all containers, images, and networks and free up disk space:

```{=latex}
\begin{shellblock}[Terminal -- clean up Docker environment]
docker system prune -a
\end{shellblock}
```

**Warning:** this removes all local images, including ones you may want to keep. Read the confirmation prompt carefully before proceeding.

---

# Summary of key Docker commands

| Command | Description |
|---------|-------------|
| `docker pull <image>` | Download an image from a registry |
| `docker build -t <name> .` | Build an image from a Dockerfile |
| `docker images` | List local images |
| `docker run ...` | Create and start a container |
| `docker container ls` | List running containers |
| `docker container ls -a` | List all containers (including stopped) |
| `docker exec -it <name> sh` | Open a shell inside a running container |
| `docker logs <name>` | Fetch container logs |
| `docker logs -f <name>` | Follow container logs in real time |
| `docker container stop <name>` | Stop a running container |
| `docker network ls` | List Docker networks |
| `docker network inspect <name>` | Show network details |
| `docker system prune -a` | Remove all unused Docker resources |
