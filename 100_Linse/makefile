all: Protokoll.pdf

Protokoll.pdf: bessel.m bessel.m.out

%.pdf: %.tex
	xelatex $^

%.m.out: %.m
	octave -fq $< > $@
