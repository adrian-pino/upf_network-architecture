# Block 4 — Network Virtualization (Session 1)

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

### Introduction
- Motivating question: what happens inside the buildings that run Netflix, Gmail, ChatGPT?
- Learning objectives: data centers, VMs/hypervisors/containers, virtual networking
- Block 4 Roadmap (Session 1 vs Session 2 overview)

### Data Centers
- What is a data center? (enterprises, cloud providers, colocation)
- A Data Center from the Inside (photo: server racks, cabling)
- Five Pillars: compute, accelerators (GPUs/TPUs), storage, network, facilities
- The Problem with Physical Infrastructure (one server = one app, 10–15% utilization)
- The Cloud: From Waste to Efficiency (timeline: VMs → cloud → containers)
- Scalability and Elasticity (definitions, why physical infra fails at both)
- Discussion: 50 servers at 10% utilization — what would you do?

### Virtualization Concepts
- What Is Virtualization? (hypervisor divides resources into VMs)
- Virtual Machines (VMs): software emulation, own vCPU/RAM/disk/vNIC
- Host and Guest Systems (TikZ diagram)
- Hypervisors: Type 1 (bare-metal) vs Type 2 (hosted)
- Hypervisors Type 1 vs Type 2: Visual Comparison (TikZ diagram)
- Discussion: Type 1 or Type 2 at home vs production?

### VMs vs Containers
- What Is a Container? (lightweight, no full OS, shares host kernel, Docker/Kubernetes)
- Containers Share the Same... Kernel? (TikZ diagram: syscalls, namespaces)
- VMs vs Containers: Overview (columns: isolation, size, boot time, security)
- VMs vs Containers: Visual Comparison (image)
- When to Use VMs vs Containers (decision criteria, evolution toward container-first)
- Discussion: 200 web app instances — VMs, containers, or both?

### Virtual Networking
- From Physical to Virtual Networks (concept introduction, comparison table)
- Virtual NIC, Virtual Switch, Virtual Router (definitions with sub-bullets)
- Physical vs Virtual: Side by Side — Same Network (TikZ comparison)
- Physical vs Virtual: Side by Side — Different Networks (TikZ comparison)
- Example: VM-to-VM Communication (exercise)
- Example: VM-to-VM Communication (Solution)
- Example: VMs on Different Subnets (exercise)
- Example: VMs on Different Subnets (Solution)
- VM Networking Modes: NAT (default), Bridged, Host-only
- Packet Flow: Virtual to Physical (end-to-end path)
- Discussion: virtual networking

### Network Isolation and Multi-Tenancy
- The Problem: Shared Infrastructure, Private Data (security, performance, address independence)
- Layer 1: VLANs (on virtual switches, 4,096 limit)
- Layer 2: Overlay Networks (VXLAN conceptual intro, 16M networks)
- Layer 3: Micro-Segmentation (security groups + ACLs, zero trust)
- Isolation: The Full Picture (summary table)
- Discussion: 5,000 tenants — can you use VLANs alone?

### Session Summary
- Key Takeaways (6 points)
- References
