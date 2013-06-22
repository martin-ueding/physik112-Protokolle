#!/usr/bin/gnuplot -p
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                                   License                                   #
###############################################################################
#
# This gnuplot script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 2 of the License, or (at your option) any
# later version.
#
# This is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this. If not, see <http://www.gnu.org/licenses/>.

set encoding utf8

###############################################################################
#                                    106.c                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_c.pdf"

# Label the axes.
set xlabel "Periodennummer"
set ylabel "Maximalamplitude"


# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.c"

f1(x) = a * exp(-x*g);
f3(x) = c * exp(-x*d);
f5(x) = e * exp(-x*f);

fit f1(x) "c_1.dat" using 1:2:3 via a,g
fit f3(x) "c_3.dat" using 1:2:3 via c,d
fit f5(x) "c_5.dat" using 1:2:3 via e,f

set logscale y

# Plot the data with the fit.
plot "c_1.dat" with yerrorbars lc rgb "#000000" title "I = 0.1 A", \
	 "c_3.dat" with yerrorbars lc rgb "#000000" title "I = 0.3 A", \
	 "c_5.dat" with yerrorbars lc rgb "#000000" title "I = 0.5 A", \
	 f1(x) lc rgb "#000000" title "Fit für I = 0.1 A", \
	 f3(x) lc rgb "#000000" title "Fit für I = 0.3 A", \
	 f5(x) lc rgb "#000000" title "Fit für I = 0.5 A"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                                    106.d                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_d.pdf"

# Label the axes.
set xlabel "Spannung [V]"
set ylabel "Frequenz [Hz]"

unset logscale y

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.d"

d(x) = g * x + h;

fit d(x) "d.dat" using 1:2:3 via g,h

plot "d.dat" with yerrorbars lc rgb "#000000" title "Frequenzen", d(x) lc rgb "#000000" title "Fit für Frequenzen";

###############################################################################
#                                    106.e                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_e.pdf"

# Label the axes.
set xlabel "Anregungsfrequenz [Hz]"
set ylabel "Pendelamplitude"

unset logscale y

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 106: Aufgabe 106.e"

stark(x) = mu / sqrt((x - omega)**2 + x**2 * omega**2 / Q**2);
schwach(x) = mu2 / sqrt((x - omega2)**2 + x**2 * omega2**2 / Q2**2);

fit stark(x) "e_stark.dat" using 1:2:3 via mu,omega,Q;
fit schwach(x) "e_schwach.dat" using 1:2:3 via mu2,omega2,Q2;

plot "e_schwach.dat" with yerrorbars lc rgb "#000000" title "schwache Dämpfung", \
		 "e_stark.dat" with yerrorbars lc rgb "#000000" title "starke Dämpfung", \
		 stark(x) lc rgb "#000000" title "Fit für starke Dämpfung", \
		 schwach(x) lc rgb "#000000" title "Fit für schwache Dämpfung"
