DOCKER = docker run --rm -v "$(CURDIR):/data" pandoc/extra:latest
PANDOC_FLAGS = -t beamer --slide-level=2 --pdf-engine=xelatex

B4_SOURCES = block4-virtualization-cloud/B4_Session1_Network_Virtualization.md \
             block4-virtualization-cloud/B4_Session2_Cloud_Computing.md

B5_SOURCES = block5-sdn-cloud-native/B5_Session1_SDN_CloudNative.md

SOURCES = $(B4_SOURCES) $(B5_SOURCES)
PDFS = $(SOURCES:.md=.pdf)

.PHONY: all block4 block5 clean

all: $(PDFS)

block4: $(B4_SOURCES:.md=.pdf)

block5: $(B5_SOURCES:.md=.pdf)

%.pdf: %.md
	$(DOCKER) $< $(PANDOC_FLAGS) -o $@

clean:
	rm -f $(PDFS)
