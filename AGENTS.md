# Slide Generator - Arquitectura de Xarxes (UPF)

## Context
- Course: Arquitectura de Xarxes
- University: Universitat Pompeu Fabra (UPF)
- Students: heterogeneous mix, from 2nd-year Telecom / Data Science to 4th-year students from neighbouring degrees (elective)
- Primary spoken language in class: Spanish (technical terms may appear in English or Catalan)
- **Slide content language: English** (see Language section below)

## Pedagogical considerations
- Adapt the level: do not assume advanced networking knowledge, since some students come from neighbouring degrees
- When introducing a technical concept, add a brief definition or analogy
- Prioritize intuition over mathematical formality
- Include real-world examples that connect with the student's experience
- **Concept introduction style**: when a slide introduces a networking concept or service (e.g. load balancer, proxy, reverse proxy, VPN), open with 1-2 plain-language sentences explaining *what it is* and *why it exists*, before listing bullet points. Do not jump straight into features without context. Example: *"A reverse proxy sits in front of backend servers and mediates all inbound traffic. Clients never communicate directly with the backend."*

## Bullet point format
- Aim for 5-7 bullets per slide (fewer on diagram-heavy slides; up to 8 if items are short)
- Keep bullets concise: prefer one line, but two-line bullets are acceptable when needed for clarity
- Use active verbs and direct language
- Do not use full sentences; prioritize clear and memorable fragments
- If a concept needs nuance, use a sub-bullet (maximum 1 level of depth)

## Session structure
1. Title + motivating question or real-world scenario
2. Learning objectives (3-4 maximum)
3. Main content divided into thematic blocks (`#` sections)
   - At the end of each section, include a **discussion slide** with an open question to encourage classroom debate
   - Format: centred question in `\Large\textit{...}`, with hints below
   - Goal: students reflect and consolidate before moving to the next section
4. Summary / key takeaways

## Writing style
- **No long dashes** in slide content: do not use em dashes (`—`), en dashes (`–`), or LaTeX double hyphens (`--`) as phrase connectors. This applies to **all visible slide text including slide titles (`##` headings)**; use colons, semicolons, or parentheses instead. HTML comments are exempt. Exception: the YAML `title:` front matter field uses `--` as a conventional Pandoc title separator and must not be changed.
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
- `#` = section title (generates a title slide + auto-TOC entry)
- `##` = slide title
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
  title: "Block N -- Topic Title"
  subtitle: "Subtopic \\& Subtopic"
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
    - \logo{\includegraphics[height=0.6cm]{img/upf-logo.png}}
    - \titlegraphic{\includegraphics[height=1.2cm]{img/upf-logo.png}}
  ```
- Note: `[table]{xcolor}` needed for `\rowcolor`; `decorations.pathreplacing` for TikZ braces; `shapes.symbols` for cloud shapes
- Tables with full borders (`|l|l|`, `\hline` between each row), `\rowcolor{blue!10}` in header, `\renewcommand{\arraystretch}{1.3}` for padding. Do NOT use `booktabs` (`\toprule`/`\midrule`/`\bottomrule`)
- `\vfill` for vertical spacing, `\footnotesize` for annotations
- **Spacing between bullet groups**: blank lines between Markdown bullets with sub-bullets do NOT produce visible spacing in Beamer. Use `\vspace{0.2cm}` or `\vspace{0.3cm}` between bullet groups when needed. Same applies inside Pandoc columns. Only add spacing on slides with few bullets/content (visual judgment); dense slides risk overflow
- **Sparse slides**: when a slide has 5 or fewer bullet points and no diagram, add `\vspace{0.2cm}` between every bullet to avoid the slide looking empty. Do not apply this to diagram-heavy slides or slides where bullets have sub-bullets (risk of overflow).
- Pandoc columns: `:::::::::::::: {.columns}` / `::: {.column width="50%"}`

## TikZ conventions
- **Node colours**: VM 1 / Server 1 = `green!15`, VM 2 / Server 2 = `purple!15`. Alternate for additional VMs
- **Do not use parameterised TikZ styles** (e.g. `fill=#1`) because Pandoc/Beamer breaks them (`#` is interpreted as a macro parameter). Use parameter-free styles and apply `fill=` directly on each node
- **Internet**: represent as `cloud` shape (`shapes.symbols`) with `fill=cyan!10`
- **Physical NIC**: `fill=orange!15`, include connection to Internet when relevant

## Diagram naming conventions
- **Virtual switches**: use `bridge-1`, `bridge-2` (the Linux term students will encounter in practice)
  - First appearance in a presentation: label as `bridge-1 (virtual switch)` to establish the connection
  - Add footnote on first use: "In Linux, a bridge is named `br0`, `br1`, etc. We use `bridge-1` for clarity."
  - Compact diagrams (Packet Flow) and summaries/roadmaps may use the abbreviation `vSwitch`
- **Virtual routers**: spell out as `Virtual Router` in exercise diagrams and bullet text
  - Compact diagrams and summaries may use `vRouter`
- **Virtual NICs**: spell out as `Virtual NIC` in diagrams; abbreviation `vNIC` acceptable in running text
- **Nesting**: NICs should be drawn inside their parent box (NIC inside Server on the physical side, Virtual NIC inside VM on the virtual side)

## Compilation

### Slides (Beamer)
- No local pandoc/xelatex — use Docker:
  ```bash
  docker run --rm -v "/home/adrian/upf/ax:/data" pandoc/extra:latest <file>.md -t beamer --slide-level=2 --pdf-engine=xelatex -o <file>.pdf
  ```

### Lab documents (article PDF)
- Labs are Pandoc Markdown → article PDF via `xelatex` (not Beamer)
- Compile command:
  ```bash
  docker run --rm -v "/home/adrian/upf/ax:/data" pandoc/extra:latest \
    <labN-folder>/<file>.md --pdf-engine=xelatex -o <labN-folder>/<file>.pdf
  ```
- **Do NOT use `-t beamer` or `--slide-level`** for lab documents
- Complex LaTeX (tcolorbox environments, multi-line `\newtcblisting`, mdframed) must go in a separate `preamble.tex` file in the lab folder, included via `header-includes: - \input{<labN-folder>/preamble.tex}`. Do not embed multi-line LaTeX directly in YAML header-includes — pandoc mangles it.
- Image paths in `preamble.tex` and in the document must be relative to the Docker `/data` mount root (i.e. `<labN-folder>/img/upf-logo.png`, not `img/upf-logo.png`)
- Standard YAML front matter for labs:
  ```yaml
  title: "Lab N -- Title"
  subtitle: "Arquitectura de Xarxes -- 2025-2026 3rd quarter"
  author: "Universitat Pompeu Fabra"
  date: ""
  geometry: margin=2.5cm
  fontsize: 11pt
  colorlinks: true
  urlcolor: blue
  header-includes:
    - \input{<labN-folder>/preamble.tex}
  ```
- Standard `preamble.tex` for labs includes:
  - `\usepackage{graphicx}` + fancyhdr with UPF logo in header (right) and page number (centre footer)
  - `tcolorbox` with `shellblock` (gray, for terminal commands) and `dockerblock` (blue, for file contents)
  - `mdframed` `questionbox` environment (blue background) for questions students must answer in their report
  - Notes and warnings as plain bold text (`**Note:**`), no colored box
- See `lab3-containers/preamble.tex` as the reference implementation

## References policy
- Only sources from: standards bodies (IETF RFCs, ETSI, NIST, IEEE), major vendors (AWS, Azure, GCP, VMware, Red Hat, Docker, HashiCorp), or published books (O'Reilly, Pearson, Morgan Kaufmann, Wiley)
- **NO blogs**
- Inline citations with `\footnotesize Source: ...` at the bottom of relevant slides
- Consolidated "References" slide at the end of each presentation

## Prior content (already covered by students)
- **Block 1**: Networking fundamentals
- **Block 2**: Application and transport layer
- **Block 3**: Network and link layer (Ethernet, VLANs 802.1Q, ARP, STP, subnetting CIDR/VLSM, OSPF, BGP, DHCP, NAT/NAPT)

## Self-maintenance rule
- **After every session that modifies slides or project structure**, review this file (AGENTS.md) and evaluate whether any section needs updating: new acronyms, new conventions learned, corrected rules, or structural changes. Apply updates immediately rather than deferring them.
- **After modifying the content of any presentation**, check whether the corresponding `table-of-contents_sessionN.md` file needs updating. Each block directory contains one toc file per session (e.g., `table-of-contents_session1.md`, `table-of-contents_session2.md`). These files are not used for compilation but serve as a structural reference.
- **Before compiling any presentation**, review the "Key Takeaways" slide and verify it accurately reflects the current content of the presentation. Update it if needed before compiling.

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
| OVS | Open vSwitch | B5 Session 1 |
| SDN | Software-Defined Networking | B5 Session 1 |
| ACL | Access Control List | B4 Session 1 |
| VXLAN | Virtual Extensible LAN | B4 Session 1 |
| IaaS | Infrastructure as a Service | B4 Session 2 |
| PaaS | Platform as a Service | B4 Session 2 |
| SaaS | Software as a Service | B4 Session 2 |
| VPC | Virtual Private Cloud | B4 Session 2 |
| NIST | National Institute of Standards and Technology | B4 Session 2 |
| API | Application Programming Interface | B4 Session 2 |
| EC2 | Elastic Compute Cloud | B4 Session 2 |
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
| VPN | Virtual Private Network | B4 Session 2 |
| LB | Load Balancer | B4 Session 2 |
| TLS | Transport Layer Security | B4 Session 2 |
