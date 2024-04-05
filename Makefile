# See http://paulklemm.com/blog/2016-03-06-watch-latex-documents-using-latexmk/

all: handbook.pdf

handbook.pdf:	handbook.tex preamble.tex intro.tex history.tex back.tex
	latexmk -f -quiet -bibtex $(PREVIEW_CONTINUOUSLY) -auxdir=build -xelatex handbook

.PHONY: watch

watch: PREVIEW_CONTINUOUSLY=-pvc
watch: handbook.pdf

.PHONY: clean

clean:	
	latexmk -CA -bibtex -auxdir=build


