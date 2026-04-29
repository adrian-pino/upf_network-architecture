# Arquitectura de Xarxes — Universitat Pompeu Fabra

Beamer slide decks for the "Arquitectura de Xarxes" course (Blocks 4–5).

## Structure

| Directory | Content |
|-----------|---------|
| `block4-virtualization-cloud/` | Network Virtualization & Cloud Computing (Sessions 1–2) |
| `block5-sdn-cloud-native/` | SDN & Cloud Native (Session 1) |

## Course Flow

**Overarching questions:** What is the Cloud and how is it formed? How do networks work in the cloud?

```
B4 Session 1: Network Virtualization
  VMs, hypervisors, containers → virtual NICs, switches, routers → VLANs, isolation
  "What are the building blocks of virtual networking?"
                                        ↓
B4 Session 2: Cloud Computing & Cloud Architectures
  Cloud business model (NIST, IaaS/PaaS/SaaS) → platforms → VPC architecture → LB, proxy, VPN
  "How is the cloud sold, and how do you architect a cloud network?"
                                        ↓
B5 Session 1: Software-Defined & Cloud-Native Networking
  SDN → NFV → VXLAN overlays → container networking, microservices → IaC → serverless, edge
  "How are modern networks built and automated under the hood?"
```

## Dependencies

- [Docker](https://docs.docker.com/get-docker/) — compiles slides via the `pandoc/extra` image
- [OpenCode](https://opencode.ai/) — AI coding agent used to author and maintain the slides

## Building

Requires Docker. No local pandoc/xelatex installation needed.

```bash
make          # build all PDFs
make block4   # build Block 4 only
make block5   # build Block 5 only
make clean    # remove generated PDFs
```

## Toolchain

Markdown → Beamer PDF via [pandoc/extra](https://hub.docker.com/r/pandoc/extra) Docker image (`xelatex` engine, `--slide-level=2`).
