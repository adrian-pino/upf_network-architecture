# Block 4 — Network Virtualization and Cloud Computing

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

## Session 1: Network Virtualization

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
- Type 1 vs Type 2: Visual Comparison (TikZ diagram)
- VMs vs Containers: Overview (table: isolation, size, boot time)
- VMs vs Containers: Visual Comparison (TikZ diagram)
- When to Use VMs vs Containers (decision criteria)
- Discussion: hypervisor failure scenario

### Virtual Networking
- From Physical to Virtual Networks (concept introduction)
- Physical vs Virtual: Side by Side — Same Network (TikZ comparison)
- Physical vs Virtual: Side by Side — Different Networks (TikZ comparison)
- Example: VM-to-VM Communication (exercise)
- Example: VM-to-VM Communication (Solution)
- Example: VMs on Different Subnets (exercise)
- Example: VMs on Different Subnets (Solution)
- Virtual NIC, Virtual Switch, Virtual Router
- VM Networking Modes: NAT (default), Bridged, Host-only
- Packet Flow: Virtual to Physical (end-to-end path)
- Discussion: virtual networking

### Network Isolation and Multi-Tenancy
- The Problem: Shared Infrastructure, Private Data (security, performance, address independence)
- Layer 1: VLANs (802.1Q on virtual switches, 4,096 limit)
- Layer 2: Overlay Networks (VXLAN conceptual intro, 16M networks)
- Layer 3: Micro-Segmentation (security groups + ACLs, zero trust)
- Isolation: The Full Picture (summary table)
- Discussion: 5,000 tenants — can you use VLANs alone?

### Session Summary
- Key Takeaways (6 points)
- Next Session: Preview (overlays, NIST, IaaS/PaaS/SaaS, virtual networks, security, governance)
- References

---

## Session 2: Cloud Computing

### From Virtualization to Cloud
- If We Can Virtualize Everything... Why Not Sell It?
- Recap — What We Virtualized (Session 1)
- The Leap to Cloud (technology → business model)
- Discussion: from virtualization to cloud

### Fundamentals of Cloud Computing
- Cloud Computing — Definition (NIST SP 800-145)
- Five Essential Characteristics (all must be present)
- On-Demand Self-Service
- Broad Network Access + Resource Pooling
- Rapid Elasticity + Measured Service
- Cloud Service Models — The Stack (IaaS / PaaS / SaaS)
- IaaS — Infrastructure as a Service
- PaaS — Platform as a Service
- SaaS — Software as a Service
- Service Models — Who Manages What? (responsibility spectrum)
- Discussion: cloud fundamentals

### Cloud & Container Platforms
- Putting It All Together (building blocks → platforms)
- Cloud Platforms: private (OpenStack, VMware, Proxmox) and public (AWS, Azure, GCP)
- Container Orchestration Platforms: Docker, Kubernetes, OpenShift (private + hosted)
- Discussion: startup choosing private vs public cloud

### From VLANs to Overlay Networks
- The VLAN Scalability Problem
- Overlay Networks: Concept
- VXLAN: Overview
- VXLAN: How It Works
- Overlay Benefits for Scalability
- Discussion: overlay networks

### Cloud Network Architecture
- Virtual Networks in the Cloud (generic concept; VPC/VNet as provider names)
- Virtual Network Architecture
- Subnets — Public vs Private
- Route Tables
- Internet Gateway vs NAT Gateway
- Security Groups — Instance-Level Firewall
- Network ACLs — Subnet-Level Firewall
- Security Groups vs Network ACLs
- Discussion: cloud networking

### Cloud Governance, Sovereignty & Compliance
- Cloud Governance (policies, cost control, IAM)
- Data Sovereignty and GDPR
- Shared Responsibility Model

### Session Summary
- Key Takeaways
- Discussion
- References
