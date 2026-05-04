DOCKER_SLIDES = docker run --rm -v "$(CURDIR):/data" pandoc/extra:latest
DOCKER_LAB    = docker run --rm -v "$(CURDIR):/data" pandoc/extra:latest
PANDOC_SLIDES = -t beamer --slide-level=2 --pdf-engine=xelatex
PANDOC_LAB    = --pdf-engine=xelatex

B4_SOURCES = theory/block4-virtualization-cloud/B4_Session1_Network_Virtualization.md \
             theory/block4-virtualization-cloud/B4_Session2_Cloud_Computing.md

B5_SOURCES = theory/block5-sdn-cloud-native/B5_Session1_SDN_CloudNative.md

LAB3_SOURCES = labs/lab3-containers/AX-Lab-3-Containers.md \
               labs/lab3-containers/Lab3_Docker_Intro.md

SLIDE_SOURCES = $(B4_SOURCES) $(B5_SOURCES)
SLIDE_PDFS    = $(SLIDE_SOURCES:.md=.pdf)
LAB_PDFS      = $(LAB3_SOURCES:.md=.pdf)

.PHONY: all theory labs block4 block5 lab3 clean

all: theory labs

theory: $(SLIDE_PDFS)

labs: $(LAB_PDFS)

block4: $(B4_SOURCES:.md=.pdf)

block5: $(B5_SOURCES:.md=.pdf)

lab3: $(LAB3_SOURCES:.md=.pdf)

theory/%.pdf: theory/%.md
	$(DOCKER_SLIDES) $< $(PANDOC_SLIDES) -o $@

labs/lab3-containers/Lab3_Docker_Intro.pdf: labs/lab3-containers/Lab3_Docker_Intro.md
	$(DOCKER_SLIDES) $< $(PANDOC_SLIDES) -o $@

labs/lab3-containers/AX-Lab-3-Containers.pdf: labs/lab3-containers/AX-Lab-3-Containers.md
	$(DOCKER_LAB) $< $(PANDOC_LAB) -o $@

clean:
	rm -f $(SLIDE_PDFS) $(LAB_PDFS)
