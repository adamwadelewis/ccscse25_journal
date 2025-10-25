#
# File:   Makefile
# Author: Adam Lewis
# Purpose:
# Build submission for CCSC:SE
#
# Tools for building latex
LATEXMK = latexmk -f
RM = rm -f
.PHONY: all mostlyclean clean release

# Rules
%.pdf: %.tex
	$(LATEXMK) -pdf -bibtex $*
#	$(LATEXMK) -pdf -bibtex -M -MP -MF $*.d $*

release: all mostlyclean

all: welcome.pdf keynote1.pdf keynote2.pdf

welcome.pdf: welcome.tex 
	$(LATEXMK) -pdf -bibtex $^

keynote1.pdf: keynote1.tex 
	$(LATEXMK) -pdf -bibtex $^

keynote2.pdf: keynote2.tex 
	$(LATEXMK) -pdf -bibtex $^

# Clean targets
mostlyclean:
	$(LATEXMK) -silent -c
	$(RM) *.bbl *.aux *.fls *.fdb_latexmk *.out *.log *.toc
	$(RM) *.run.xml *.synctex.gz *.nav *.snm
	$(RM) *.vrb
	$(RM) *.d 

clean: mostlyclean
	$(LATEXMK) -silent -C
	$(RM) *.pdf
# Include auto-genrated dependenies
-include *.d
