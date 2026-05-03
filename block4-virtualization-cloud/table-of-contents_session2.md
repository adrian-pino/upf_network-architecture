# Block 4 — Cloud Computing & Cloud Architectures (Session 2)

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

**Narrative thread:** CloudBite, a 3-person startup building a food-delivery app from zero infrastructure. Each section answers our next question.

---

### From Virtualization to Cloud
- If We Can Virtualize Everything... Why Not Sell It? (learning objectives)
- Meet the Scenario: A Startup from Zero (CloudBite intro, section roadmap)
- Recap: What We Virtualized (Session 1) (packet flow diagram)
- The Leap to Cloud (technology → business model, comparison table)
- Discussion: from virtualization to cloud

### Fundamentals of Cloud Computing
- CloudBite Asks: "What Exactly Is Cloud Computing?" (transition slide)
- Cloud Computing: Definition (NIST) (block highlight + 3 unpacking bullets)
- Five Essential Characteristics (table with real-world examples column)
- Cloud Service Models: The Stack (TikZ layer diagram with IaaS/PaaS/SaaS braces)
- IaaS, PaaS, SaaS: In Practice (examples and use cases)
- Service Models: Who Manages What? (responsibility table)
- Discussion: cloud fundamentals

### Cloud & Container Platforms
- CloudBite Asks: "Which Platform Do We Use?" (transition slide)
- Putting It All Together (2-column: building blocks → platforms)
- Private Cloud Platforms (OpenStack, VMware, Proxmox)
- Public Cloud Platforms (AWS, Azure, GCP)
- Container Orchestration Platforms: Docker, Kubernetes, OpenShift (private + hosted)
- Discussion: platforms

### Cloud Network Architecture
- CloudBite Asks: "We Picked AWS. Now What?" (transition slide)
- Virtual Networks in the Cloud (CIDR, subnets, routing, security; forward ref to B5 overlays)
- Virtual Network Architecture (TikZ: VPC with public/private subnets, IGW, NAT GW)
- Subnets: Public vs Private
- Route Tables
- Internet Gateway vs NAT Gateway
- Security Groups: Instance-Level Firewall
- Network ACLs (Access Control Lists): Subnet-Level Firewall
- Security Groups vs Network ACLs (comparison table + alertblock on stateless ACLs)
- Discussion: cloud networking

### Cloud Network Services
- CloudBite Asks: "We Need HTTPS, Scaling, and Office Access" (transition slide)
- Load Balancer (L4 vs L7, distribute traffic, TikZ diagram)
- Reverse Proxy (TLS termination, URL routing, caching, TikZ diagram)
- Forward Proxy (access control, caching, anonymity, TikZ diagram)
- Reverse Proxy vs Forward Proxy (comparison table)
- VPN: Virtual Private Network (site-to-site vs client, TikZ diagram)
- Discussion: cloud network services

### The Cloud Trade-Off
- CloudBite, Five Years Later (scenario continuation: $40K/month, should they leave?)
- Case Study: Basecamp Leaves the Cloud ($10M saved, Kamal, when it works)
- Vendor Lock-In: The Hidden Cost (proprietary services, egress fees, data)
- The Pricing Ratchet (price increases 2024-2025, streaming analogy)
- So... Cloud or Not? (comparison table, hybrid as pragmatic answer)
- Discussion: the cloud trade-off

### Session Summary
- Key Takeaways: CloudBite's Journey (2-column: what we built + what we learned)
- References
