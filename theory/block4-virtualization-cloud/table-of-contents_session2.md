# Block 4 — Cloud Computing & Cloud Architectures (Session 2)

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

### From Virtualization to Cloud
- If We Can Virtualize Everything... Why Not Sell It? (learning objectives)
- Recap — What We Virtualized (Session 1) (packet flow diagram)
- The Leap to Cloud (technology → business model, comparison table)
- Discussion: from virtualization to cloud

### Fundamentals of Cloud Computing
- Cloud Computing — Definition (NIST)
- Five Essential Characteristics (table, all five must be present)
- Cloud Service Models — The Stack (TikZ layer diagram with IaaS/PaaS/SaaS braces)
- IaaS, PaaS, SaaS — In Practice (examples and use cases)
- Service Models — Who Manages What? (responsibility table)
- Discussion: cloud fundamentals

### Cloud & Container Platforms
- Putting It All Together (building blocks → platforms)
- Cloud Platforms: private (OpenStack, VMware, Proxmox) and public (AWS, Azure, GCP)
- Container Orchestration Platforms: Docker, Kubernetes, OpenShift (private + hosted)
- Discussion: platforms

### Cloud Network Architecture
- Virtual Networks in the Cloud (CIDR, subnets, routing, security; forward ref to B5 overlays)
- Virtual Network Architecture (TikZ: VPC with public/private subnets and Internet Gateway)
- Subnets: Public vs Private (2-column slide with subnet boundary diagram)
- Route Tables
- Internet Gateway (with optional NAT Gateway note)
- Security Groups: Instance-Level Firewall (instance filter diagram)
- Network ACLs (Access Control Lists): Subnet-Level Firewall (subnet filter diagram)
- Security Groups vs Network ACLs (comparison table + stateless ACL warning)
- Discussion: cloud networking

### Cloud Network Services
- Load Balancer (L4 vs L7, distribute traffic, TikZ diagram)
- Reverse Proxy (TLS termination, URL routing, caching, TikZ diagram)
- Forward Proxy (access control, caching, anonymity, TikZ diagram)
- Reverse Proxy vs Forward Proxy (comparison table)
- VPN — Virtual Private Network (site-to-site vs client, TikZ diagram)
- Discussion: cloud network services

### Session Summary
- Key Takeaways (7 points)
- Discussion
- References
