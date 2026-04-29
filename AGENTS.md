# Generador de slides - Arquitectura de Xarxes (UPF)

## Contexto
- Asignatura: Arquitectura de Xarxes
- Universidad: Universitat Pompeu Fabra (UPF)
- Alumnos: mix heterogéneo, desde 2o de Ingeniería de Telecomunicaciones / Data Science hasta 4o de carreras vecinas (optativa)
- Idioma principal: español (pueden aparecer términos técnicos en inglés o catalán según contexto)

## Consideraciones pedagógicas
- Adapta el nivel: no asumas conocimientos previos avanzados de redes, ya que hay alumnos de carreras vecinas
- Cuando introduzcas un concepto técnico, añade una definición breve o analogía
- Prioriza la intuición antes que la formalidad matemática
- Incluye ejemplos del mundo real que conecten con la experiencia del alumno

## Formato de bullet points
- Máximo 5-6 bullets por slide
- Cada bullet: 1 línea, máximo 15 palabras
- Usa verbos activos y lenguaje directo
- No uses frases completas; prioriza fragmentos claros y memorables
- Si un concepto necesita matiz, usa un sub-bullet (máximo 1 nivel de profundidad)

## Estructura de cada clase
1. Título + pregunta motivadora o situación real
2. Objetivos de aprendizaje (2-3 máximo)
3. Contenido principal dividido en bloques temáticos (secciones `#`)
   - Al final de cada sección, incluir una **slide de discusión** con una pregunta abierta para fomentar el debate en clase
   - Formato: pregunta centrada en `\Large\textit{...}`, con hints o pistas debajo
   - Objetivo: que los alumnos reflexionen y consoliden lo aprendido antes de pasar a la siguiente sección
4. Resumen / puntos clave de la sesión
5. Pregunta de repaso final, ejercicio rápido o tema de debate

## Estilo de redacción
- Evitar el uso de guiones largos (`--`, `—`) como conectores entre frases; usar dos puntos, punto y coma, o reestructurar la frase
- Evitar contracciones en inglés (`don't` → `do not`, `can't` → `cannot`)
- Preferir lenguaje directo y natural, evitando patrones repetitivos que parezcan generados por LLM
- **Acrónimos**: siempre definir un acrónimo la primera vez que aparece (ej. "Virtual Private Cloud (VPC)"). En usos posteriores se puede usar solo el acrónimo. No asumir que el alumno conoce el significado.
  - **CRÍTICO**: antes de entregar o compilar cualquier presentación, hacer un audit de acrónimos: buscar todos los acrónimos en el archivo y verificar que cada uno está expandido antes de su primer uso. Esto incluye acrónimos en títulos y tablas.
  - Excepción: la slide de "References" al final no requiere expansión de acrónimos (son citas bibliográficas, no contenido docente).
  - Excepción: footnotes inline (`\footnotesize Source: ...`) no requieren expansión de acrónimos (son citas, no contenido docente).
  - Excepción: los "Learning objectives" al inicio de la presentación son un preview/roadmap; los acrónimos se expanden en el contenido principal, no en los objetivos.
  - Excepción: acrónimos universales que cualquier estudiante de 2o conoce (CPU, RAM, IP, OS, USB, HTTP, TCP, UDP, DNS, MAC, Wi-Fi).
  - Excepción: acrónimos ya definidos en Blocks anteriores (los alumnos ya los conocen, no hace falta redefinirlos). Incluye: VLAN, NAT, NAPT, ARP, STP, CIDR, VLSM, OSPF, BGP, DHCP, L2, L3, L4, NIC, vNIC, VM, VMs, VXLAN, ACL, SDN, NFV, IaaS, PaaS, SaaS, NIST, VPC, API.

## Formato de salida
- Genera archivos Markdown
- Usa `---` como separador entre slides
- `#` = título de slide
- `-` = bullet points
- Usa **negrita** para términos clave que el alumno debe retener
- Usa `código` para comandos, protocolos o direcciones (ej. `traceroute`, `192.168.0.0/24`)
- Incluye notas para el profesor entre comentarios HTML `<!-- nota: ... -->` cuando sea relevante

## Idioma
- Slides en **inglés** (consistente con Blocks 1-2 existentes en .pptx)
- Título de la asignatura en catalán; contenido técnico en inglés

## Beamer / Pandoc — configuración técnica
- Formato: Pandoc Markdown → Beamer PDF via `xelatex`
- `#` = sección (genera slide de título + auto-TOC), `##` = slide normal (`--slide-level=2`)
- YAML front matter estándar:
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
- Nota: `[table]{xcolor}` necesario para `\rowcolor`; `decorations.pathreplacing` para llaves TikZ; `shapes.symbols` para cloud shapes
- Tablas con bordes completos (`|l|l|`, `\hline` entre cada fila), `\rowcolor{blue!10}` en cabecera, `\renewcommand{\arraystretch}{1.3}` para padding. NO usar `booktabs` (`\toprule`/`\midrule`/`\bottomrule`)
- `\vfill` para espaciado vertical, `\footnotesize` para anotaciones
- Columnas Pandoc: `:::::::::::::: {.columns}` / `::: {.column width="50%"}`

## Convenciones TikZ
- **Colores de nodos**: VM 1 / Server 1 = `green!15`, VM 2 / Server 2 = `purple!15`. Alternar para VMs adicionales
- **No usar estilos TikZ parametrizados** (ej. `fill=#1`) porque Pandoc/Beamer los rompe (el `#` se interpreta como parámetro de macro). Usar estilos sin parámetro y aplicar `fill=` directamente en cada nodo
- **Internet**: representar como `cloud` shape (`shapes.symbols`) con `fill=cyan!10`
- **Physical NIC**: `fill=orange!15`, incluir conexión a Internet cuando sea relevante

## Compilación
- Sin pandoc/xelatex local — usar Docker:
  ```bash
  docker run --rm -v "/home/adrian/upf/ax:/data" pandoc/extra:latest <file>.md -t beamer --slide-level=2 --pdf-engine=xelatex -o <file>.pdf
  ```

## Política de referencias
- Solo fuentes de: organismos de estándares (IETF RFCs, ETSI, NIST, IEEE), vendors principales (AWS, Azure, GCP, VMware, Red Hat, Docker, HashiCorp), o libros publicados (O'Reilly, Pearson, Morgan Kaufmann, Wiley)
- **NO blogs**
- Citas inline con `\footnotesize Source: ...` al pie de slides relevantes
- Slide de "References" consolidada al final de cada presentación

## Contenido previo (ya cubierto por los alumnos)
- **Block 1**: Fundamentos de redes
- **Block 2**: Capa de aplicación y transporte
- **Block 3**: Capa de red y enlace (Ethernet, VLANs 802.1Q, ARP, STP, subnetting CIDR/VLSM, OSPF, BGP, DHCP, NAT/NAPT)
