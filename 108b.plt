#!/usr/bin/gnuplot -p
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

set encoding utf8

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot.pdf"

# Label the axes.
set xlabel "Fallhöhe [m]"
set ylabel "omega^2 [1/s^2]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 108: Aufgabe 108.b"

# Plot the data with the fit.
plot "108b_25.dat" title "25 g", "108b_50.dat" title "50 g"

# Set the output again so that the PDF is really written to.
set output
