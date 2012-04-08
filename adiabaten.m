#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# physik111 Experiment 117.

###############################################################################
#                                  Messwerte                                  #
###############################################################################

# Dauer von n Perioden mit Schwingern 1 und 2 [s].
T1_list = [60 59];
T2_list = [60 59];

# Fehler bei der Zeitmessung [s].
Delta_T = 0.1;

# Anzahl der Perioden
n = 50;

###############################################################################
#                               gegebene Daten                                #
###############################################################################

# Masse der Schwinger [kg].
m1 = 4.5e-3;
m2 = 7.1e-3;

# Fehler der Massen [kg].
Delta_m = 0.1e-3;

# Radien der Schwinger [m].
r = 5.95e-4;

# Fehler der Radien [m].
Delta_r = 0.05e-4;

function k = exponent(m, V, T, r, p)
	k = 4.0 * m * V / T**2 / r**4 / p;
endfunction

# Volumen des Glaskolbens [m**3].
V = 1.14e-3;

# Luftdruck [Pa].
global p_L = 1000e2;

# Fehler des Luftdrucks [Pa].
Delta_p_L = 0;

# Ortsfaktor [N / kg].
global g = 9.81;

function p = innendruck(m, r)
	global p_L;
	global g;
	p = p_L + m * g / pi / r**2;
endfunction

function s = qsum(in)
	s = sqrt(sumsq(in))
endfunction

###############################################################################
#                                 Rechnungen                                  #
###############################################################################

T1_list = T1_list / n
T2_list = T2_list / n

# Gemittelte Periode einer einzelnen Schwingung [s].
T1 = mean(T1_list)
T2 = mean(T2_list)

# Fehler der Perioden.
Delta_T1 = std(T1_list)
Delta_T2 = std(T2_list)

k1 = exponent(m1, V, T1, r, innendruck(m1, r))
k2 = exponent(m2, V, T2, r, innendruck(m2, r))

function Delta_kn = error_kn(m, V, T, r, p_L, Delta_m, Delta_T, Delta_r, Delta_p_L)
	global g;
	# Δm * dk/dm
	part_m = Delta_m * ((4*V)/(r**4*T**2*((g*m)/(pi*r**2) + p_L)) - (4*g*m*V)/(pi*r**6*T**2*((g*m)/(pi*r**2) + p_L)^2))

	# ΔT * dk/dm
	part_T = Delta_T * (-((8*m*V)/((p_L + (g*m)/(pi*r**2))*r**4*T**3)))

	# Δr * dk/dm
	part_r = Delta_r * ((8*g*m**2*V)/(pi*(p_L + (g*m)/(pi*r**2))**2*r**7*T**2) - (16*m*V)/((p_L + (g*m)/(pi*r**2))*r**5*T**2))

	# Δp_L * dk/dm
	part_p_L = Delta_p_L * (-((4*m*V)/((p_L + (g*m)/(pi*r**2))**2*r**4*T**2)))

	Delta_kn = qsum([part_m part_T part_r part_p_L])
endfunction

Delta_k1 = error_kn(m1, V, T1, r, p_L, Delta_m, Delta_T1, Delta_r, Delta_p_L)
Delta_k2 = error_kn(m1, V, T2, r, p_L, Delta_m, Delta_T2, Delta_r, Delta_p_L)

k = mean([k1 k2])
Delta_k = qsum([Delta_k1 Delta_k2])

###############################################################################
#                                 Ergebnisse                                  #
###############################################################################

printf("\n");

printf("117.e: T1: %f ± %f s\n", T1, Delta_T1);
printf("117.e: T2: %f ± %f s\n", T2, Delta_T2);

printf("\n");

printf("117.f: k: %f ± %f \n", k, Delta_k);
