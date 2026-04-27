PANDOC = pandoc
PANDOC_FLAGS = --pdf-engine=xelatex -t beamer --slide-level=2

SOURCES = B4_Session1_Network_Virtualization.md \
          B4_Session2_Cloud_Computing.md \
          B5_Session1_SDN_CloudNative.md

PDFS = $(SOURCES:.md=.pdf)

.PHONY: all clean

all: $(PDFS)

%.pdf: %.md
	$(PANDOC) $(PANDOC_FLAGS) -o $@ $<

clean:
	rm -f $(PDFS)
