#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                                   License                                   #
###############################################################################
#
# This GNU Octave script is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or (at your
# option) any later version.
#
# This is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this. If not, see <http://www.gnu.org/licenses/>.

# Measurement program for the ``physik112`` experiment ``100``.
#
# The focal length of a thin lens is measured using the Bessel method.

# Load data.
load "measurement.dat"

# Count the number of measurements.
N = length(measurement)

# Length of the optical bank and its error.
a = 59.74
Da = 0.07

# Extract the two data sets from the input.
x1 = measurement(:, 1);
x2 = measurement(:, 2);
meanX1 = mean(x1)
meanX2 = mean(x2)

# Calculate each distance of the lenses.
meanE = abs(mean(x1) - mean(x2))

# Calculating the best guess for focal length.
function f = focalLengh(a, e)
	f = (a - e**2 / a) / 4
endfunction

meanF = focalLengh(a, meanE)

# Calculating the accumulated error of the measurements.
Dx1 = sqrt(1/(N*(N-1)) * sum(center(x1).**2))
Dx2 = sqrt(1/(N*(N-1)) * sum(center(x2).**2))

# Calculating the error for meanE.
De = Dx1**2 + Dx2**2

# Calculating the error for meanF.
function Df = focalLengthPartialE(a, e)
	Df = -e / (2*a);
endfunction

function Df = focalLengthPartialA(a, e)
	Df = 1/4*(1+e**2/a**2);
endfunction

DmeanF = sqrt((focalLengthPartialA(a, meanE) * De)**2 + (focalLengthPartialE(a, meanE) * Da)**2)

printf("\nFinal results:\n")
printf("a: %10f ± %10f\n", a, Da)
printf("e: %10f ± %10f\n", meanE, De)
printf("f: %10f ± %10f\n", meanF, DmeanF)
