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

# Set output to a nice PDF.
set terminal postscript eps enhanced color solid defaultplex "Helvetica" 12
set output "|epstopdf --filter > plot.pdf"

# Label the axes.
set xlabel "a^2 [m^2]"
set ylabel "a T^2 [m s^2]"

# Enable the grid.
set grid

# Set the title of the whole graph.
set title "physik111 Versuch 109: physikalisches Pendel"

# Define the fit line.
f(x) = mu * x + nu

fit f(x) "plot_data.dat" using 1:2:3 via mu,nu

# Plot the data with the fit.
plot "plot_data.dat" with yerrorbars title "Messungen", \
		 f(x) with lines title "Fit"

# Set the output again so that the PDF is really written to.
set output
