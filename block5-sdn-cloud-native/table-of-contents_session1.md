# Block 5 — Software-Defined and Cloud-Native Networking (Session 1)

**Overarching questions:**
- What is the Cloud and how is it formed?
- How do networks work in the cloud?

---

### Limitations of Traditional Networks
- What If You Could Program Your Entire Network? (motivating question)
- Traditional Network Management (CLI per device, vendor-specific, error-prone)
- Scalability Challenges (hundreds of thousands of devices, manual doesn't scale)
- The Control Plane Problem (distributed, no global view, limited programmability)
- Discussion: The Cost of Manual Networks

### Software-Defined Networking (SDN)
- SDN -- Core Idea (separate control from data plane, centralize intelligence)
- SDN Architecture -- Three Planes (data, control, application)
- SDN Controllers (OpenDaylight, ONOS, Cisco ACI, VMware NSX)
- Southbound Interface -- OpenFlow (match → action flow rules)
- Northbound Interface -- REST APIs (programmable network)
- SDN Benefits -- Summary (centralized, programmable, agile, vendor-independent)
- Discussion: SDN Trade-offs

### Network Function Virtualization (NFV)
- From Hardware Appliances to Software (physical → virtual: firewall, LB, router)
- Virtual Network Functions (VNFs) (software on VMs or containers)
- NFV + Cloud Integration (deploy in minutes, scale horizontally)
- SDN + NFV -- Complementary Technologies (SDN steers, NFV processes)
- Discussion: When Hardware Still Wins

### Container Networking
- Containers -- Deep Dive (namespaces, cgroups, Docker, expanding Block 4)
- VM vs Container -- Revisited (TikZ comparison diagram)
- Container Network Models (bridge, host, overlay)
- Container Networking -- Visual (TikZ diagram)
- Microservices -- From Monolith to Distributed (split into independent services)
- Microservices -- Network Challenges (service discovery, cascading failures, circuit breakers)
- Discussion: Containers vs VMs

### Infrastructure as Code & Network Automation
- Infrastructure as Code (IaC) (manage infra through code, benefits)
- IaC Example -- Terraform (Conceptual) (HCL code snippet: VPC, subnet, SG)
- Discussion: IaC Risks

### Emerging Trends
- Serverless Computing (FaaS) (event-driven, pay per execution)
- Edge Computing (process data close to source, complementary to cloud)
- The Full Picture -- Where Everything Fits (TikZ evolution diagram)
- References

### Session Summary
- Key Takeaways (7 points)
- Discussion
