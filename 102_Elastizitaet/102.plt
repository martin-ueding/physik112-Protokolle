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
#                                 Aufgabe 1.a                                 #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_1a.pdf"

# Label the axes.
set xlabel "Kraft [N]"
set ylabel "Auslenkung [m]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 102: Aufgabe 1.a"

f1(x) = a + x*g;
f3(x) = c + x*d;
f5(x) = e + x*f;

fit f1(x) "1a_alu.dat" using 1:2:3 via a,g
fit f3(x) "1a_kupfer.dat" using 1:2:3 via c,d
fit f5(x) "1a_stahl.dat" using 1:2:3 via e,f

# Plot the data with the fit.
plot "1a_alu.dat" with yerrorbars lc rgb "#000000" title "Aluminium", \
		 "1a_kupfer.dat" with yerrorbars lc rgb "#000000" title "Kupfer", \
		 "1a_stahl.dat" with yerrorbars lc rgb "#000000" title "Stahl", \
		 f1(x) lc rgb "#000000" title "Fit für Aluminium", \
		 f3(x) lc rgb "#000000" title "Fit für Kupfer", \
		 f5(x) lc rgb "#000000" title "Fit für Stahl"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                                 Aufgabe 1.b                                 #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_1b.pdf"

# Label the axes.
set xlabel "Kraft [N]"
set ylabel "Auslenkung"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 102: Aufgabe 1.b"

# Plot the data with the fit.
plot "1b_stahl2.dat" with yerrorbars lc rgb "#000000" title "Stahl", \
		 "" with lines lc rgb "#000000", \
		 "1b_pvc.dat" with yerrorbars lc rgb "#000000" title "PVC", \
		 "" with lines lc rgb "#000000", \
		 "1b_gfk.dat" with yerrorbars lc rgb "#000000" title "GFK", \
		 "" with lines lc rgb "#000000"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                                 Aufgabe 2.a                                 #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_2a.pdf"

# Label the axes.
set xlabel "Abstand² [m²]"
set ylabel "Periode² [s²]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 102: Aufgabe 2.a"

T(x) = alpha + beta * x

fit T(x) "2a.dat" using 1:2:3 via alpha,beta

# Plot the data with the fit.
plot "2a.dat" with yerrorbars lc rgb "#000000" title "Torsionspendel", \
		 T(x) lc rgb "#000000" title "Fit"

# Set the output again so that the PDF is really written to.
set output
