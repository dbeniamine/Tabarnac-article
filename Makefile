# Makefile

#Commands
TEX = pdflatex -interaction=nonstopmode
BIB = bibtex

#Files
TEXSRC = $(wildcard *.tex)
BIBSRC = $(wildcard *.bib)
PDF = $(TEXSRC:.tex=.pdf)
AUX = $(TEXSRC:.tex=.aux)
BBL = $(TEXSRC:.tex=.bbl)
NLO = $(TEXSRC:.tex=.nlo)
NLS = $(TEXSRC:.tex=.nls)

#Commands + arguments
TEXCOMPILE = $(TEX) $(TEXSRC)
BIBCOMPILE = $(BIB) $(AUX)

#Windows
ifeq ($(OS),Windows_NT)
	SHELL = C:/Windows/System32/cmd.exe
endif

all : all-bib-default


all-bib-default : clean bib-default finalize

all-noclean : bib-default finalize

$(PDF) : $(TEXSRC) $(TEXSUBSRC) $(BIBSRC) $(PDF)
	$(TEXCOMPILE)
	$(TEXCOMPILE)

bib-default : $(PDF) $(BIBSRC)
	$(BIBCOMPILE)

finalize : $(AUX) $(BBL)
	$(TEXCOMPILE)
	$(TEXCOMPILE)

run :
	xdg-open $(PDF)

clean :
	rm -rf *.tdo *.idx *.nlo *.log *.lof *.lot *.bbl *.blg *.thm *.pdf *.aux *.backup *.bak *.toc *.out *.ilg *.nls *~ .*~ img/*eps-converted-to.pdf
