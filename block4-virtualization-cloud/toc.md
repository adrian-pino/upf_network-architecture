# Block 4 — Network Virtualization and Cloud Computing

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

## Session 1: Network Virtualization (4.1–4.4)

### 4.1 Introduction to Network Virtualization
- Motivation for virtualization
  - Physical infrastructure is rigid: one server = one application
  - Typical server utilization is only 10–15% → massive waste
  - Adding capacity requires buying, racking, cabling hardware → weeks/months
  - Hardware failure = entire service down, no flexibility
- Resource utilization and consolidation
  - Run multiple workloads on fewer physical machines → 60–80% utilization
  - Reduce energy, cooling, and physical space costs
  - Trade-off: shared hardware requires strong isolation between workloads
- Scalability and elasticity requirements
  - Scalability: grow resources as demand increases
  - Elasticity: grow AND shrink automatically (e.g., Netflix peak hours)
  - Physical infrastructure provides neither → virtualization enables both
  - This is the foundation that makes cloud computing possible

### 4.2 Virtualization Concepts
- Host and guest systems
  - Host: physical machine providing hardware resources (CPU, RAM, disk, NIC)
  - Guest: virtual machine running its own OS on top of the host
  - Each guest believes it has dedicated hardware (abstraction)
- Virtual machines (VMs)
  - Software emulation of a complete computer system
  - Own virtual CPU, RAM, disk, network interfaces
  - Runs a full OS (Linux, Windows, etc.) independently
  - Key properties: encapsulation (VM = files), hardware independence, snapshotting
- Hypervisors (Type 1 and Type 2)
  - Hypervisor (VMM): software layer that manages and allocates resources to VMs
  - Type 1 (bare-metal): runs directly on hardware, near-native performance
    - Examples: VMware ESXi, KVM, Microsoft Hyper-V
    - Used in data centers and production environments
  - Type 2 (hosted): runs on top of a host OS, some overhead
    - Examples: VirtualBox, VMware Workstation
    - Used for development and testing
- VMs vs Containers (overview — deep-dive in Block 5)
  - VMs: full OS per instance, GBs in size, minutes to boot, strong isolation
  - Containers: shared kernel, MBs in size, seconds to boot, lighter isolation
  - Isolation models: hardware-level (VMs) vs kernel-level (containers via namespaces/cgroups)
  - Performance trade-offs: containers are more efficient but less isolated
  - In practice: containers often run inside VMs for defense-in-depth
  - When to use which: different OS → VM; many similar services → containers

### 4.3 Virtual Networking
- Virtual NICs (vNICs)
  - Software-emulated network interface card
  - Each VM gets one or more vNICs (behaves like a real NIC to the guest)
  - Has its own MAC address (software-assigned, not burned-in)
  - Common vendor prefixes: 00:50:56 (VMware), 52:54:00 (KVM), 00:15:5D (Hyper-V)
  - Multiple vNICs per VM enable multi-network connectivity
- Virtual switches (vSwitches)
  - Connects VMs on the same host — works like a physical L2 switch
  - Maintains MAC address table, forwards frames based on destination MAC
  - Connected to physical NIC via an uplink for external traffic
  - Supports VLANs for traffic segmentation between VMs
  - Types: standard vSwitch, distributed vSwitch (multi-host), Open vSwitch (OVS, programmable)
- Bridging modes
  - Bridged: VM appears directly on the physical network (same subnet as host)
  - NAT: VM traffic translated through host's IP (VM hidden from external network)
  - Host-only: VM communicates only with the host (fully isolated)
- Virtual routing and NAT
  - Virtual router: forwards traffic between virtual networks (same as physical, in software)
  - Handles routing between VMs on different subnets, NAT, default gateway
  - Packet flow: VM → vNIC → vSwitch → vRouter → physical NIC → external network
  - NAT in virtual environments: same concept as Block 3, now managed by the hypervisor

### 4.4 Cloud & Container Platforms
- Cloud management platforms (VMs)
  - OpenStack (open-source, widely used in private clouds)
  - VMware vSphere (enterprise leader, proprietary)
  - Proxmox VE (open-source, lightweight alternative)
- Public cloud providers as alternative (pay-per-use, no hardware to manage)
  - AWS, Microsoft Azure, Google Cloud Platform
- Container orchestration platforms
  - Docker: standard container runtime; package and run containers
  - Kubernetes (K8s): de facto standard for orchestration at scale
  - OpenShift: enterprise K8s distribution by Red Hat

### 4.5 Network Isolation and Multi-Tenancy
- Multi-tenant architectures
  - Multiple independent users (tenants) share the same physical infrastructure
  - Examples: cloud providers, enterprise data centers, university IT
  - Requirements: performance isolation, security isolation, address independence
  - Each tenant can use overlapping IP ranges (e.g., both use 10.0.0.0/24)
- VLANs in virtual environments
  - Same 802.1Q concept from Block 3, applied to virtual switches
  - Hypervisors assign VMs to VLANs via vSwitch port groups
  - Limitation: 12-bit VLAN ID → max 4,096 VLANs (not enough for large clouds)
- Network segmentation and micro-segmentation
  - VLANs for L2 segmentation
  - Firewall rules and ACLs between VLAN groups
  - Micro-segmentation: per-VM firewall policies (least privilege principle)
- Overlay networks (conceptual introduction)
  - Virtual network built on top of the physical network using encapsulation
  - Physical network only sees outer headers → tenant traffic is hidden
  - VXLAN: most widely used overlay protocol
    - Encapsulates L2 frames in UDP packets
    - 24-bit VNI → 16 million virtual networks (vs 4,096 VLANs)
    - VTEPs (VXLAN Tunnel Endpoints) encapsulate/decapsulate at the edge
  - Benefits: massive scalability, VM mobility, decoupled virtual/physical topology
  - Foundation for cloud networking (AWS VPC, Azure VNet use overlays internally)

---

## Session 2: Cloud Computing (4.5–4.8)

### 4.5 From Virtualization to Cloud *(slide-puente)*
- Virtualization = technology (how), Cloud = business model (what you sell)
- VMs + vNICs + vSwitches + overlays = the building blocks of cloud
- The leap: offer compute, storage, and networking as automated, self-service, metered services
- Key difference: automation and self-service (no phone calls, no tickets)

### 4.6 Fundamentals of Cloud Computing
- Definition (NIST SP 800-145)
  - On-demand network access to shared pool of configurable computing resources
  - Rapidly provisioned and released with minimal management effort
- Five essential characteristics (all must be present to qualify as "cloud")
  - On-demand self-service: provision through portal/API, no human interaction
  - Broad network access: available over the network from any device
  - Resource pooling: shared infrastructure, multi-tenant, location-transparent
  - Rapid elasticity: scale up/down automatically (appears unlimited to user)
  - Measured service: pay for what you use, metered (CPU-hours, GB, etc.)
- Cloud service models
  - IaaS (Infrastructure as a Service): provider gives VMs, storage, networks; you manage OS, apps
    - Examples: AWS EC2, Azure Virtual Machines, Google Compute Engine
  - PaaS (Platform as a Service): provider gives runtime + tools; you manage app code and data
    - Examples: Google App Engine, AWS Elastic Beanstalk, Heroku
  - SaaS (Software as a Service): provider gives complete application; you manage data/config
    - Examples: Google Workspace, Microsoft 365, Salesforce, Slack
  - Responsibility spectrum: IaaS (most control) → SaaS (least control)
  - Major providers (AWS, Azure, GCP) mentioned as context, not a separate section

### 4.7 Cloud Network Architecture
- Virtual Private Cloud (VPC)
  - Your own isolated virtual network inside a cloud provider
  - Built on top of overlay networks (VXLAN or similar) — connects back to 4.4
  - You define: address space (e.g., 10.0.0.0/16), subnets, routing rules, security
- Subnets and routing
  - Public subnets: route to Internet Gateway, instances can have public IPs
    - Use for: web servers, load balancers, bastion hosts
  - Private subnets: no direct Internet route, only private IPs
    - Use for: databases, internal services, backends
    - Can reach Internet outbound via NAT Gateway
  - Route tables: rules determining where traffic goes
    - Local route (within VPC) + default route (0.0.0.0/0 → IGW or NAT GW)
- Internet connectivity
  - Internet Gateway: bidirectional, allows world to reach public instances
  - NAT Gateway: outbound only, lets private instances reach Internet without being reachable
  - Same NAT concept from Block 3, now as a managed cloud service
- Network security in the cloud
  - Security groups: virtual firewall per instance, stateful (allow-only rules)
  - Network ACLs: firewall per subnet, stateless (allow + deny, numbered rules, first match)
  - Defense in depth: use both — SGs for fine-grained, ACLs for broad guardrails

### 4.8 Cloud Governance, Sovereignty and Compliance *(2–3 slides)*
- Cloud governance: policies for resource management, cost control, access (IAM)
- Data sovereignty
  - Data subject to laws of the country where stored
  - Cloud providers have global data centers → your data location matters
  - Risks: legal jurisdiction conflicts, government access (e.g., US CLOUD Act)
- GDPR as regulatory example
  - Key principles: lawfulness, purpose limitation, data minimization, right to erasure
  - 72-hour breach notification requirement
  - Relevance to cloud: you must know where your data is and who can access it
- Shared responsibility model
  - Provider: physical security, hardware, hypervisors, network fabric
  - Customer: data, access policies, OS patches, application security
  - Line shifts depending on service model (IaaS/PaaS/SaaS)
