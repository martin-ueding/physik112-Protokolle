#!/usr/bin/gnuplot -p
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

set encoding utf8

###############################################################################
#                                    106.c                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_c.pdf"

# Label the axes.
set xlabel "Periodennummer"
set ylabel "phi"

set logscale y

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.c"

c = 1
d = 1

f1(x) = a * exp(x*g);
f3(x) = c * exp(x*d);
f5(x) = e * exp(x*f);

fit f1(x) "c_1.dat" using 1:2 via a,g
fit f3(x) "c_3.dat" using 1:2 via c,d
fit f5(x) "c_5.dat" using 1:2 via e,f

# Plot the data with the fit.
plot "c_1.dat" with yerrorbars title "I = 0.1 A", \
	 "c_3.dat" with yerrorbars title "I = 0.3 A", \
	 "c_5.dat" with yerrorbars title "I = 0.5 A", \
	 f1(x) title "Fit für I = 0.1 A", \
	 f3(x) title "Fit für I = 0.3 A", \
	 f5(x) title "Fit für I = 0.5 A"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                                    106.d                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_d.pdf"

# Label the axes.
set xlabel "Spannung"
set ylabel "Frequenz"

unset logscale y

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.d"

d(x) = g * x + h;

fit d(x) "d.dat" using 1:2 via g,h

plot "d.dat" with yerrorbars title "Frequenzen", d(x) title "Fit für Frequenzen";

###############################################################################
#                                    106.e                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_e.pdf"

# Label the axes.
set xlabel "Anregungsfrequenz [1/Hz]"
set ylabel "Pendelamplitude"

unset logscale y

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.e"

stark(x) = mu / sqrt((x - omega)**2 + x**2 * omega**2 / Q**2);
schwach(x) = mu2 / sqrt((x - omega2)**2 + x**2 * omega2**2 / Q2**2);

fit stark(x) "e_stark.dat" using 1:2 via mu,omega,Q;
fit schwach(x) "e_schwach.dat" using 1:2 via mu2,omega2,Q2;

plot "e_schwach.dat" with yerrorbars title "schwache Dämpfung", \
		 "e_stark.dat" with yerrorbars title "starke Dämpfung", \
		 stark(x) title "Fit für starke Dämpfung", \
		 schwach(x) title "Fit für schwache Dämpfung"
