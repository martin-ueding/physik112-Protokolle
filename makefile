all: Protokoll.pdf

%.pdf: %.tex
	xelatex $^
