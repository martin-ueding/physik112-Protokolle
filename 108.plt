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

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_108b.pdf"

# Label the axes.
set xlabel "Kreisfrequenz^2 [1/s^2]"
set ylabel "Fallhöhe [m]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 108: Aufgabe 108.b"

f25_25(x) = a * x + b;
f25_100(x) = c * x + d;
f50_25(x) = e * x + f;
f50_100(x) = g * x + h;

fit f25_25(x) "108b_25_25.dat" using 1:2 via a,b
fit f25_100(x) "108b_25_100.dat" using 1:2 via c,d
fit f50_25(x) "108b_50_25.dat" using 1:2 via e,f
fit f50_100(x) "108b_50_100.dat" using 1:2 via g,h

# Plot the data with the fit.
plot "108b_25_25.dat" title "25 g, 2.5 cm", \
	 "108b_25_100.dat" title "25 g, 10 cm", \
	 "108b_50_25.dat" title "50 g, 2.5 cm", \
	 "108b_50_100.dat" title "50 g, 10 cm", \
	 f25_25(x) title "Fit 25 g, 2.5 cm", \
	 f25_100(x) title "Fit 25 g, 10 cm", \
	 f50_25(x) title "Fit 50 g, 2.5 cm", \
	 f50_100(x) title "Fit 50 g, 10 cm"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                                    108.c                                    #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot_108c.pdf"

# Label the axes.
set xlabel "Kreisfrequenz [1/s]"
set ylabel "Fallzeit [s]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 108: Aufgabe 108.b"

g25_25(x) = a * x + b;
g25_100(x) = c * x + d;
g50_25(x) = e * x + f;
g50_100(x) = g * x + h;

fit g25_25(x) "108c_25_25.dat" using 1:2 via a,b
fit g25_100(x) "108c_25_100.dat" using 1:2 via c,d
fit g50_25(x) "108c_50_25.dat" using 1:2 via e,f
fit g50_100(x) "108c_50_100.dat" using 1:2 via g,h

# Plot the data with the fit.
plot "108c_25_25.dat" title "25 g, 2.5 cm", \
	 "108c_25_100.dat" title "25 g, 10 cm", \
	 "108c_50_25.dat" title "50 g, 2.5 cm", \
	 "108c_50_100.dat" title "50 g, 10 cm", \
	 g25_25(x) title "Fit 25 g, 2.5 cm", \
	 g25_100(x) title "Fit 25 g, 10 cm", \
	 g50_25(x) title "Fit 50 g, 2.5 cm", \
	 g50_100(x) title "Fit 50 g, 10 cm"

# Set the output again so that the PDF is really written to.
set output
