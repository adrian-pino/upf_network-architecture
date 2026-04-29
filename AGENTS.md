# Slide Generator - Arquitectura de Xarxes (UPF)

## Context
- Course: Arquitectura de Xarxes
- University: Universitat Pompeu Fabra (UPF)
- Students: heterogeneous mix, from 2nd-year Telecom / Data Science to 4th-year students from neighbouring degrees (elective)
- Primary language: Spanish (technical terms may appear in English or Catalan)

## Pedagogical considerations
- Adapt the level: do not assume advanced networking knowledge, since some students come from neighbouring degrees
- When introducing a technical concept, add a brief definition or analogy
- Prioritize intuition over mathematical formality
- Include real-world examples that connect with the student's experience

## Bullet point format
- Maximum 5-6 bullets per slide
- Each bullet: 1 line, maximum 15 words
- Use active verbs and direct language
- Do not use full sentences; prioritize clear and memorable fragments
- If a concept needs nuance, use a sub-bullet (maximum 1 level of depth)

## Session structure
1. Title + motivating question or real-world scenario
2. Learning objectives (2-3 maximum)
3. Main content divided into thematic blocks (`#` sections)
   - At the end of each section, include a **discussion slide** with an open question to encourage classroom debate
   - Format: centred question in `\Large\textit{...}`, with hints below
   - Goal: students reflect and consolidate before moving to the next section
4. Summary / key takeaways
5. Final review question, quick exercise, or debate topic

## Writing style
- Avoid long dashes (`--`, `—`) as connectors between phrases; use colons, semicolons, or restructure the sentence
- Avoid English contractions (`don't` → `do not`, `can't` → `cannot`)
- Prefer direct and natural language, avoiding repetitive patterns that look LLM-generated
- **Acronyms**: always expand an acronym on first use (e.g. "Virtual Private Cloud (VPC)"). Subsequent uses can use the acronym alone. Do not assume the student knows the meaning.
  - **CRITICAL**: before delivering or compiling any presentation, run an acronym audit: search all acronyms in the file and verify each one is expanded before its first use. This includes acronyms in titles and tables.
  - Exception: the "References" slide at the end does not require acronym expansion (bibliographic citations, not teaching content).
  - Exception: inline footnotes (`\footnotesize Source: ...`) do not require acronym expansion (citations, not teaching content).
  - Exception: universal acronyms that any 2nd-year student knows (CPU, RAM, IP, OS, USB, HTTP, TCP, UDP, DNS, MAC, Wi-Fi).
  - Exception: acronyms already defined in previous Blocks (students already know them, no need to redefine). See the table in the "Defined acronyms" section at the end of this file.

## Output format
- Generate Markdown files
- `#` = slide title
- `-` = bullet points
- Use **bold** for key terms the student should retain
- Use `code` for commands, protocols, or addresses (e.g. `traceroute`, `192.168.0.0/24`)
- Include instructor notes in HTML comments `<!-- note: ... -->` when relevant

## Language
- Slides in **English** (consistent with existing Blocks 1-2 in .pptx)
- Course title in Catalan; technical content in English

## Beamer / Pandoc — technical configuration
- Format: Pandoc Markdown → Beamer PDF via `xelatex`
- `#` = section (generates title slide + auto-TOC), `##` = normal slide (`--slide-level=2`)
- Standard YAML front matter:
  ```yaml
  title: "Block N -- Session M"
  subtitle: "Topic \\& Topic"
  author: "Arquitectura de Xarxes"
  institute: "Universitat Pompeu Fabra"
  theme: "Madrid"
  colortheme: "dolphin"
  fonttheme: "structurebold"
  aspectratio: 169
  navigation: horizontal
  toc: true
  header-includes:
    - \usepackage{booktabs}
    - \usepackage[table]{xcolor}
    - \usepackage{tikz}
    - \usetikzlibrary{positioning, arrows.meta, calc, shapes.geometric, shapes.symbols, fit, decorations.pathreplacing}
    - \setbeamerfont{footnote}{size=\tiny}
    - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
  ```
- Note: `[table]{xcolor}` needed for `\rowcolor`; `decorations.pathreplacing` for TikZ braces; `shapes.symbols` for cloud shapes
- Tables with full borders (`|l|l|`, `\hline` between each row), `\rowcolor{blue!10}` in header, `\renewcommand{\arraystretch}{1.3}` for padding. Do NOT use `booktabs` (`\toprule`/`\midrule`/`\bottomrule`)
- `\vfill` for vertical spacing, `\footnotesize` for annotations
- Pandoc columns: `:::::::::::::: {.columns}` / `::: {.column width="50%"}`

## TikZ conventions
- **Node colours**: VM 1 / Server 1 = `green!15`, VM 2 / Server 2 = `purple!15`. Alternate for additional VMs
- **Do not use parameterised TikZ styles** (e.g. `fill=#1`) because Pandoc/Beamer breaks them (`#` is interpreted as a macro parameter). Use parameter-free styles and apply `fill=` directly on each node
- **Internet**: represent as `cloud` shape (`shapes.symbols`) with `fill=cyan!10`
- **Physical NIC**: `fill=orange!15`, include connection to Internet when relevant

## Compilation
- No local pandoc/xelatex — use Docker:
  ```bash
  docker run --rm -v "/home/adrian/upf/ax:/data" pandoc/extra:latest <file>.md -t beamer --slide-level=2 --pdf-engine=xelatex -o <file>.pdf
  ```

## References policy
- Only sources from: standards bodies (IETF RFCs, ETSI, NIST, IEEE), major vendors (AWS, Azure, GCP, VMware, Red Hat, Docker, HashiCorp), or published books (O'Reilly, Pearson, Morgan Kaufmann, Wiley)
- **NO blogs**
- Inline citations with `\footnotesize Source: ...` at the bottom of relevant slides
- Consolidated "References" slide at the end of each presentation

## Prior content (already covered by students)
- **Block 1**: Networking fundamentals
- **Block 2**: Application and transport layer
- **Block 3**: Network and link layer (Ethernet, VLANs 802.1Q, ARP, STP, subnetting CIDR/VLSM, OSPF, BGP, DHCP, NAT/NAPT)

## Defined acronyms (centralised registry)

Check this list before using an acronym. If it was already defined in a previous Block, there is no need to redefine it. If it is new, expand it on first use and add it here.

| Acronym | Expansion | Defined in |
|---------|-----------|------------|
| VLAN | Virtual LAN | Block 3 |
| NAT | Network Address Translation | Block 3 |
| NAPT | Network Address Port Translation | Block 3 |
| ARP | Address Resolution Protocol | Block 3 |
| STP | Spanning Tree Protocol | Block 3 |
| CIDR | Classless Inter-Domain Routing | Block 3 |
| VLSM | Variable-Length Subnet Mask | Block 3 |
| OSPF | Open Shortest Path First | Block 3 |
| BGP | Border Gateway Protocol | Block 3 |
| DHCP | Dynamic Host Configuration Protocol | Block 3 |
| VMs | Virtual Machines | B4 Session 1 |
| NIC | Network Interface Card | B4 Session 1 |
| vNIC | virtual NIC | B4 Session 1 |
| VMM | Virtual Machine Monitor | B4 Session 1 |
| KVM | Kernel-based VM | B4 Session 1 |
| CI/CD | Continuous Integration / Continuous Deployment | B4 Session 1 |
| OVS | Open vSwitch | B4 Session 1 |
| SDN | Software-Defined Networking | B4 Session 1 |
| ACL | Access Control List | B4 Session 1 |
| VXLAN | Virtual Extensible LAN | B4 Session 1 |
| IaaS | Infrastructure as a Service | B4 Session 2 |
| PaaS | Platform as a Service | B4 Session 2 |
| SaaS | Software as a Service | B4 Session 2 |
| VPC | Virtual Private Cloud | B4 Session 2 |
| NIST | National Institute of Standards and Technology | B4 Session 2 |
| API | Application Programming Interface | B4 Session 2 |
| EC2 | Elastic Compute Cloud | B4 Session 2 |
| IAM | Identity and Access Management | B4 Session 2 |
| GDPR | General Data Protection Regulation | B4 Session 2 |
| VNI | VXLAN Network Identifier | B4 Session 2 |
| VTEP | VXLAN Tunnel Endpoint | B4 Session 2 |
| NFV | Network Functions Virtualization | B5 Session 1 |
| VNF | Virtual Network Function | B5 Session 1 |
| REST | Representational State Transfer | B5 Session 1 |
| gRPC | gRPC Remote Procedure Call | B5 Session 1 |
| ONOS | Open Network Operating System | B5 Session 1 |
| IDS/IPS | Intrusion Detection / Prevention System | B5 Session 1 |
| IaC | Infrastructure as Code | B5 Session 1 |
| FaaS | Function as a Service | B5 Session 1 |
| MEC | Multi-access Edge Computing | B5 Session 1 |
| OCI | Open Container Initiative | B5 Session 1 |
