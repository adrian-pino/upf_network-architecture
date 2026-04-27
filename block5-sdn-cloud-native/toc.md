# Block 5 — Software-Defined and Cloud-Native Networking

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

## Session 1 (single session): SDN, NFV, Containers & Trends (5.1–5.6)

### 5.1 Limitations of Traditional Network Architectures
- Manual configuration and management
  - Each device configured individually via CLI
  - Vendor-specific commands and interfaces
  - Imagine updating 1,000 switches one by one
- Scalability challenges
  - Data centers growing to hundreds of thousands of devices
  - Manual config doesn't scale; changes take days/weeks
  - Human errors increase with complexity
- Control plane limitations
  - Every device runs its own distributed control plane (OSPF, BGP)
  - No centralized view of the entire network
  - Difficult to implement network-wide policies
  - Limited programmability — can't easily add new features

### 5.2 Software-Defined Networking (SDN)
- Core idea: separate control plane from data plane, centralize intelligence
- SDN architecture — three planes
  - Data plane (infrastructure): switches that forward packets, receive rules from controller
  - Control plane (controller): centralized software, global view, computes paths, installs rules
  - Application plane: apps that define behavior (firewall, LB, monitor) via APIs
- SDN controllers
  - The "brain" of the SDN network
  - Examples: OpenDaylight (Linux Foundation), ONOS (carrier-grade), Floodlight
  - Proprietary: Cisco ACI, VMware NSX
  - Expose REST APIs, support HA (clustered), maintain real-time topology DB
- SDN interfaces and protocols
  - Southbound (OpenFlow): controller ↔ switches, installs flow rules (match → action)
    - If no rule matches → packet sent to controller for decision
  - Northbound (REST APIs): applications ↔ controller
    - GET topology, POST flow rules, GET statistics
    - Network becomes programmable like any other software system
- Benefits: centralized management, programmability, agility, vendor independence
- SDN is the foundation for modern cloud networking (AWS, Azure, GCP use it internally)

### 5.3 Network Function Virtualization (NFV)
- Concept: replace dedicated hardware appliances with software on commodity servers
  - Traditional: physical firewall, physical load balancer, physical router
  - NFV: virtual firewall (pfSense, iptables), virtual LB (HAProxy, NGINX), virtual router (FRRouting)
- VNFs (Virtual Network Functions)
  - Network function implemented as software, runs on VMs or containers
  - Examples: firewalls, routers, load balancers, WAN optimizers, IDS/IPS
- NFV + Cloud integration
  - Deploy VNFs on cloud infrastructure (IaaS) in minutes instead of months
  - Scale horizontally: add more instances under load
  - Software upgrades, no hardware procurement or truck rolls
- SDN + NFV complementary
  - SDN controls HOW traffic flows (forwarding rules)
  - NFV controls WHAT processes the traffic (firewall, LB, encrypt)
  - SDN steers traffic to the right VNF

### 5.4 Container Networking
- Containers in depth (deep-dive, expanding Block 4 overview)
  - Share host kernel (unlike VMs with full guest OS)
  - Isolation via Linux namespaces (process, network, filesystem) + cgroups (CPU, memory limits)
  - Docker: most popular platform, packages app + deps into image, runs as container
  - Milliseconds to start, MBs in size (vs minutes/GBs for VMs)
- Container network models
  - Bridge network (default): containers on same host via virtual bridge, NAT for external
  - Host network: container uses host's network stack directly, no isolation, max performance
  - Overlay network: containers on different hosts connected via VXLAN (same concept as B4)
- Microservices and distributed systems
  - Monolithic app → split into small, independent services, each in its own container
  - Services communicate over the network (HTTP/REST, gRPC)
  - Network implications: service discovery, load balancing, observability
  - Challenge: every service-to-service call = network call → latency, failure risk
  - Cascading failures: one service down affects dependents
  - Solutions: retries, timeouts, circuit breakers, service meshes

### 5.5 Infrastructure as Code and Network Automation *(1–2 slides, conceptual)*
- IaC: manage infrastructure through code files, not manual clicks
  - Describe desired state in config file → tools apply changes automatically
  - Terraform as example (conceptual, not tutorial): declarative HCL for VPCs, subnets, SGs
- Benefits: reproducibility, version control (Git), automation, speed
- Network automation: code change → review → deploy in minutes (vs days/weeks manual)
  - Reduced human error, faster deployment, scalability to 1000s of devices

### 5.6 Emerging Trends *(1–2 slides, closing)*
- Serverless (FaaS)
  - Deploy individual functions, not servers
  - Event-driven (HTTP request, file upload, timer)
  - Provider manages all infrastructure; pay per execution time (ms)
  - Examples: AWS Lambda, Azure Functions, Google Cloud Functions
  - Trade-off: less control, vendor lock-in, cold start latency
- Edge computing
  - Process data close to where it is generated (not in central cloud)
  - Lower latency (IoT, autonomous vehicles, gaming), less bandwidth, better privacy
  - Cloud and edge are complementary, not competing
