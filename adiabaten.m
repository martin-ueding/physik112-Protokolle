#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# physik111 Experiment 117.

###############################################################################
#                                  Messwerte                                  #
###############################################################################

# Dauer von n Perioden mit Schwingern 1 und 2 [s].
T1_list = [60];
T1_list = [60];

# Anzahl der Perioden
n = 50;

###############################################################################
#                               gegebene Daten                                #
###############################################################################

# Masse der Schwinger [kg].
m1 = 4.5e-3;
m2 = 7.1e-3;

# Radien der Schwinger [m].
r = 5.95e-4;

function k = exponent(m, V, T, r)
	p = innendruck(m, r);
	k = 4.0 * m * V / T**2 / r**4 / p;
endfunction

# Volumen des Glaskolbens [m**3].
V = 1.14e-3;

# Luftdruck [Pa].
global p_L = 1000e2;

# Ortsfaktor [N / kg].
global g = 9.81;

function p = innendruck(m, r)
	global p_L;
	global g;
	p = p_L + m * g / pi / r**2;
endfunction

###############################################################################
#                                 Rechnungen                                  #
###############################################################################

# Gemittelte Periode einer einzelnen Schwingung [s].
T1 = mean(T1_list) / n
T2 = mean(T2_list) / n

k1 = exponent(m1, V, T1, r)
k2 = exponent(m2, V, T2, r)
k = mean([k1 k2])

###############################################################################
#                                 Ergebnisse                                  #
###############################################################################

printf("\n");

printf("117.e: T1: %f s\n", T1);
printf("117.e: T2: %f s\n", T2);

printf("\n");

printf("117.f: k: %f\n", k);
