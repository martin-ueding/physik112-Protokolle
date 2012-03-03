#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>
# vim: ft=octave

# Measurement program for the ``physik111`` experiment ``100``.
#
# The focal length of a thin lens is measured using the Bessel method.

# Load data.
load "measurement.dat"
measurement

# Count the number of measurements.
N = length(measurement)

# Length of the optical bank and its error.
a = 10
Da = 0.1

# Extract the two data sets from the input.
x1 = measurement(:, 1)
x2 = measurement(:, 2)
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
	Df = -e / (2*a)
endfunction

function Df = focalLengthPartialA(a, e)
	Df = 1/4*(1+e**2/a**2)
endfunction

DmeanF = sqrt((focalLengthPartialA(a, meanE) * De)**2 + (focalLengthPartialE(a, meanE) * Da)**2)

printf("\n")
printf("Final results:\n")
printf("a: %10f ± %10f\n", a, Da)
printf("e: %10f ± %10f\n", meanE, De)
printf("f: %10f ± %10f\n", meanF, DmeanF)
