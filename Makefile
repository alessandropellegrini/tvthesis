LATEX = pdflatex
MAKEINDEX = makeindex

PACKAGE = tvthesis
DTX = $(PACKAGE).dtx
INS = $(PACKAGE).ins
CLS = $(PACKAGE).cls
DOC = $(PACKAGE).pdf

EXAMPLES = example-master example-phd
EXAMPLE_TEX = $(addsuffix .tex,$(EXAMPLES))
EXAMPLE_PDF = $(addsuffix .pdf,$(EXAMPLES))

CTAN_ZIP = $(PACKAGE).zip
CTAN_FILES = $(DTX) $(INS) $(DOC) $(EXAMPLE_TEX) $(EXAMPLE_PDF) README.md

.PHONY: all cls doc examples ctan clean distclean

all: cls doc examples

cls: $(CLS)

$(CLS): $(DTX) $(INS)
	$(LATEX) $(INS)

doc: $(DOC)

$(DOC): $(DTX) $(CLS)
	$(LATEX) $(DTX)
	$(MAKEINDEX) -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	$(LATEX) $(DTX)
	$(LATEX) $(DTX)

examples: $(EXAMPLE_PDF)

example-master.pdf: example-master.tex $(CLS)
	$(LATEX) example-master.tex
	$(LATEX) example-master.tex

example-phd.pdf: example-phd.tex $(CLS)
	$(LATEX) example-phd.tex
	$(LATEX) example-phd.tex

ctan: all
	mkdir -p $(PACKAGE)
	cp $(CTAN_FILES) $(PACKAGE)/
	zip -r $(CTAN_ZIP) $(PACKAGE)
	rm -rf $(PACKAGE)

clean:
	rm -f $(CLS)
	rm -f *.aux *.log *.out *.toc *.brf *.lof *.lot
	rm -f *.idx *.ind *.ilg *.glo *.gls
	rm -f *.pdf
	rm -f *.fls *.fdb_latexmk

distclean: clean
	rm -f $(CTAN_ZIP)
