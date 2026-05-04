# Arquitectura de Xarxes — Universitat Pompeu Fabra

Slide decks and lab documents for the "Arquitectura de Xarxes" course (Blocks 4–5).

## Structure

```
ax/
├── theory/
│   ├── block4-virtualization-cloud/   # Network Virtualization & Cloud Computing (Sessions 1–2)
│   └── block5-sdn-cloud-native/       # SDN & Cloud Native (Session 1)
├── labs/
│   └── lab3-containers/               # Lab 3: Virtualization with Containers (Docker)
├── Makefile
└── README.md
```

## Subject Syllabus (2025-2026)

| Block | Topic | Sessions |
|-------|-------|----------|
| 1 | Networking Fundamentals | 1 |
| 2 | Application and Transport | 2 |
| 3 | Network Access & Internetworking | 2 |
| **4** | **Network Virtualization & Cloud Computing** | **2** |
| **5** | **Software-Defined and Cloud-Native Networking** | **1** |
| 6 | Network Security & Privacy | 1 |

Blocks 4 and 5 are covered in this repository. Labs complement Block 4.

## Dependencies

- [Docker](https://docs.docker.com/get-docker/) — compiles slides and labs via the `pandoc/extra` image
- [OpenCode](https://opencode.ai/) — AI coding agent used to author and maintain the slides

## Building

Requires Docker. No local pandoc/xelatex installation needed.

**Single file (slides):**
```bash
docker run --rm -v "$(pwd):/data" pandoc/extra:latest \
  theory/<block-folder>/<file>.md -t beamer --slide-level=2 --pdf-engine=xelatex \
  -o theory/<block-folder>/<file>.pdf
```

**Single file (lab document):**
```bash
docker run --rm -v "$(pwd):/data" pandoc/extra:latest \
  labs/<lab-folder>/<file>.md --pdf-engine=xelatex \
  -o labs/<lab-folder>/<file>.pdf
```

**Build all at once via Make:**
```bash
make            # build everything (slides + labs)
make theory     # build all slide decks
make labs       # build all lab documents
make block4     # build Block 4 only
make block5     # build Block 5 only
make lab3       # build Lab 3 only
make clean      # remove generated PDFs
```

## Toolchain

- **Slides**: Markdown → Beamer PDF via [pandoc/extra](https://hub.docker.com/r/pandoc/extra) (`xelatex`, `--slide-level=2`)
- **Labs**: Markdown → article PDF via [pandoc/extra](https://hub.docker.com/r/pandoc/extra) (`xelatex`)

## Contributors

- [Adrian Pino](https://github.com/adrian-pino)
- [Sergio Giménez](https://github.com/sergio-gimenez)
