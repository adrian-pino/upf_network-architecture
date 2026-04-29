# Arquitectura de Xarxes — Universitat Pompeu Fabra

Beamer slide decks for the "Arquitectura de Xarxes" course (Blocks 4–5).

## Structure

| Directory | Content |
|-----------|---------|
| `block4-virtualization-cloud/` | Network Virtualization & Cloud Computing (Sessions 1–2) |
| `block5-sdn-cloud-native/` | SDN & Cloud Native (Session 1) |

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
