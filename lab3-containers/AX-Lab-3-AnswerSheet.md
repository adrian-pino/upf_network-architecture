---
title: "Lab 3 -- Answer Sheet"
subtitle: "Arquitectura de Xarxes -- 2025-2026 3rd quarter"
author: "Universitat Pompeu Fabra"
date: ""
geometry: margin=2.5cm
fontsize: 11pt
colorlinks: true
urlcolor: blue
header-includes:
  - \input{lab3-containers/preamble.tex}
---

**Group members:**

| Name | NIA |
|------|-----|
| | |
| | |
| | |

**Submission:** rename this file to `AX_lab3_NIA1_NIA2_NIA3.pdf` and submit before the next lab session.

\newpage

# Questions

\begin{questionbox}
\textbf{Q1:} What is the size of the Nginx image? What factors influence the size of a Docker image? Is a larger image preferable or a smaller one? Justify your answer.
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q2:} What does each line of your Dockerfile do? If the build failed, describe what you found wrong and how you fixed it.
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q3:} Why is \texttt{my-nginx} not significantly larger than \texttt{nginx}, even though you added a file to it? What are Docker image layers?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q4:} What is the purpose of each of the three default Docker networks (\texttt{bridge}, \texttt{host}, \texttt{none})?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q5:} When you run a container without specifying \texttt{--net}, which network does Docker use by default?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q6:} What limitation does the default \texttt{bridge} network have compared to a user-defined network?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q7:} Both \texttt{curl http://172.18.0.2:80} and \texttt{curl http://localhost:8080} reach the same container. Explain why. What role does \texttt{--publish 8080:80} play?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q8:} What do the flags \texttt{-i} and \texttt{-t} mean in \texttt{docker exec -it}?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q9:} Why is the network interface output different inside the container compared to the host?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q10:} Can the host and the container be considered separate network entities? Justify your answer.
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q11:} What happens to a directory created inside a running container when the container is stopped and a new one is started from the same image? Why?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q12:} Add a screenshot of the live log output below. What information does each log line contain?
\end{questionbox}

\vspace{6cm}

\begin{questionbox}
\textbf{Q13:} What happened to the logs from the previous container after restarting? Is this a problem? Describe a real-world scenario where losing logs would have serious consequences.
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q14:} What does \texttt{access.log} contain?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q15:} After stopping and restarting the container with a volume mount, are the previous log entries still there? Why?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q16:} What problem does the volume mount solve? What would happen without it?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q17:} Does communication between containers by IP work? Why?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q18:} Does communication by container name work? Why? Would this work on the default \texttt{bridge} network?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q19:} What happens when you try to reach \texttt{webserver2} from \texttt{webserver} after stopping it?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q20:} In a production environment, what mechanism would you use to avoid hardcoding container IPs?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q21:} You changed the content served by \texttt{webserver2} without rebuilding the image. What does this tell you about the relationship between images and containers? What is the conceptual difference between a Docker \textit{image} and a Docker \textit{container}?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q22:} The image pushed to Docker Hub is public by default. What are the security implications? In what cases would you use a private registry instead?
\end{questionbox}

\vspace{4cm}

\begin{questionbox}
\textbf{Q23 (Optional):} Can \texttt{web} reach \texttt{web2} by service name in Docker Compose? Why?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q24 (Optional):} After running \texttt{docker compose down}, what happens to the containers, the network, and the volume mount?
\end{questionbox}

\vspace{3cm}

\begin{questionbox}
\textbf{Q25 (Optional):} What is the main advantage of \texttt{docker-compose.yml} compared to individual \texttt{docker run} commands?
\end{questionbox}
