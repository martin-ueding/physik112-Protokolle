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
#                              Daten aus Octave                               #
###############################################################################

# Mittelwert der Poissonverteilung.
mup = 1.649e+00

# Anzahl der Messungen für die Poissonverteilung.
Np = 302

# Mittelwert für die Laplaceverteilung.
mul = 3.212e+02

# Anzahl der Messungen für die Laplaceverteilung.
Nl = 300

###############################################################################
#                              Poissonverteilung                              #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > poisson.pdf"

# Label the axes.
set xlabel "Anzahl Zerfälle"
set ylabel "Anzahl solcher Messungen"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik112 Versuch 130: Poissonverteilung"

p(x) = Np * mup**(x-0.5)/gamma(x+1-0.5) * exp(-mup)

# Plot the data with the fit.
plot "poisson_data.dat" with boxes lc rgb "#000000" title "Messwerte", \
		 "poisson_fit.dat" with yerrorbars lc rgb "#000000" title "Erwartungswerte", \
		 p(x) with lines lc rgb "#555555" title "Poissonverteilung"

# Set the output again so that the PDF is really written to.
set output

###############################################################################
#                              Laplaceverteilung                              #
###############################################################################

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > laplace.pdf"

# Label the axes.
set xlabel "Anzahl Zerfälle (in Zehnergruppen)"
set ylabel "Anzahl solcher Messungen"

set xrange [270:380]
set yrange [0:75]

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik112 Versuch 130: Laplaceverteilung"

l(x) = 10 * Nl * 1/sqrt(2 * pi * mul) * exp(- (x-mul)**2/(2*mul))

# Plot the data with the fit.
plot "laplace_data.dat" with boxes lc rgb "#000000" title "Messwerte", \
		 "laplace_fit.dat" with yerrorbars lc rgb "#000000" title "Erwartungswerte", \
		 l(x) with lines lc rgb "#555555" title "Laplaceverteilung"

# Set the output again so that the PDF is really written to.
set output
