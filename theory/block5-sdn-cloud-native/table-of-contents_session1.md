# Block 5 -- SDN & Cloud-Native Networking (Session 1)

**Overarching questions:**
- How can networks be programmed and automated at scale?
- How do containers communicate with each other and with the outside world?

---

### Limitations of Traditional Networks
- What If You Could Program Your Entire Network? (motivating question + learning objectives)
- Traditional Network Management (CLI per device, vendor-specific, error-prone)
- Scalability Challenges (hundreds of thousands of devices, manual does not scale)
- The Control Plane Problem (distributed, no global view, limited programmability)
- Discussion: The Cost of Manual Networks

### Software-Defined Networking (SDN)
- SDN -- Core Idea (separate control from data plane, centralize intelligence)
- SDN Architecture -- Three Planes (data, control, application)
- SDN Controllers (OpenDaylight, ONOS, Cisco ACI, VMware NSX)
- Southbound Interface -- OpenFlow (match/action flow rules)
- Northbound Interface -- REST APIs (programmable network)
- SDN Benefits -- Summary (centralized, programmable, agile, vendor-independent)
- Discussion: SDN Trade-offs

### Network Function Virtualization (NFV)
- From Hardware Appliances to Software (physical appliance vs VNF, cost/flexibility)
- Virtual Network Functions (VNFs) (software on VMs or containers, comparison table)
- NFV + Cloud Integration (deploy in minutes, scale horizontally)
- SDN + NFV -- Complementary Technologies (SDN steers, NFV processes)
- Discussion: When Hardware Still Wins

### From VLANs to Overlay Networks
- The VLAN Scalability Problem (12-bit ID, 4,096 limit, L2 domain constraint)
- Overlay Networks: Concept (encapsulation, outer headers, tenant isolation)
- VXLAN: Overview (24-bit VNI, 16M networks, VTEPs)
- VXLAN: How It Works (TikZ: VM → VTEP → tunnel → VTEP → VM)
- Overlay Benefits for Scalability (migration, decoupling virtual/physical)
- Discussion: Overlay Networks

### Container Networking
- Container Networking: Starting Point (network namespace, veth pairs, bridge wiring)
- Container Network Models (bridge, host, overlay)
- Container Networking -- Visual (TikZ: two hosts with bridge + VXLAN overlay)
- Microservices -- From Monolith to Distributed (independent services, network implications)
- Microservices -- Network Challenges (service discovery, cascading failures, circuit breakers)
- Discussion: Containers vs VMs

### Infrastructure as Code & Network Automation
- Infrastructure as Code (IaC) (manage infra through code, key benefits)
- IaC Example -- Terraform (Conceptual) (HCL: VPC, subnet, security group)
- Discussion: IaC Risks

### Session Summary
- The Full Picture -- Where Everything Fits (TikZ evolution diagram)
- References
- Key Takeaways (8 points)
- Discussion
