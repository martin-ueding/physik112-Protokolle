#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# physik112 Experiment 117.

###############################################################################
#                                Measurements                                 #
###############################################################################

# Pressure in the lab with respect to zero height [Torr].
p_zero = 700;

# Height of the lab [m].
h = 65;

# Mass of the water [g].
m_water = 200;

# Mass of the cup [g].
m_cup = 300;

# Mass of the objects [g].
m_al = 100;
m_brass = 100;
m_cu = 100;

Delta_m = 1;

# Calorimeter temperature [°C].
T_cal_al = 20;
T_cal_brass = 20;
T_cal_cu = 20;

# Equilibrium temperature [°C].
T_eq_al = 50;
T_eq_brass = 50;
T_eq_cu = 50;

Delta_T = 1;

###############################################################################
#                                 Given Data                                  #
###############################################################################

# Specific heat of the water [J g / K].
c_water_lit = 4.1813;

# Specific heat of the materials [J g / K].
c_al_lit = 0.897;
c_cu_lit = 0.385;
c_zn_lit = 0.387;

u_al = 40;
u_cu = 40;
u_zn = 40;

# Source: https://en.wikipedia.org/wiki/Heat_capacity

# Height scale for barometric formula [m].
h_0 = 8400e3;

# Theoretical value of 3*R [J / mol K].
dulong_petit = 24.9;

# Conversion [Torr] -> [hPa].
torr_per_hPa = 0.75006375541921

###############################################################################
#                                  Functions                                  #
###############################################################################

# Boil temp of water [Torr] -> [°C].
function T = boil_temp(p)
	T = 100 + 0.03687 * (p - 760) - 0.000022 * (p - 760)**2;
endfunction

function Delta_C = delta_c(T_eq, T_cal, T_boil, Delta_T)
	# ΔT_eq
	part_T_eq = Delta_T * (1/(T_boil - T_eq) + (-T_cal + T_eq)/(T_boil - T_eq)^2)

	# ΔT_cal
	part_T_cal = Delta_T * (-(1/(T_boil - T_eq)))

	Delta_C = sqrt(sumsq([part_T_eq part_T_cal]))
endfunction

###############################################################################
#                                Calculations                                 #
###############################################################################

# Specific heat of the cup.
c_brass_lit = c_cu_lit * .63 + c_zn_lit * .37;
u_brass = u_cu * .63 + u_zn * .37

# Heat coefficient of the cup.
C_cup = c_brass_lit * m_cup

Delta_C_cup = Delta_m * c_brass_lit

# Heat coefficient of the total calorimeter
C_water = c_water_lit * m_water
C_cal = C_cup + C_water

Delta_C_water = Delta_m * c_water_lit
Delta_C_cal = sqrt(sumsq([Delta_C_cup Delta_C_water]))

# Calculate pressure to the given height.
p = p_zero * exp(-h / h_0)

# Calculate boiling temperature at given pressure.
T_boil = boil_temp(p)

C_al = (T_eq_al - T_cal_al) / (T_boil - T_eq_al)
c_al = C_al / m_al
n_al = m_al / u_al
cm_al = C_al / n_al

C_brass = (T_eq_brass - T_cal_brass) / (T_boil - T_eq_brass)
c_brass = C_brass / m_brass
n_brass = m_brass / u_brass
cm_brass = C_brass / n_brass

C_cu = (T_eq_cu - T_cal_cu) / (T_boil - T_eq_cu)
c_cu = C_cu / m_cu
n_cu = m_cu / u_cu
cm_cu = C_cu / n_cu

Delta_C_al = delta_c(T_eq_al, T_cal_al, T_boil, Delta_T)
Delta_C_brass = delta_c(T_eq_brass, T_cal_brass, T_boil, Delta_T)
Delta_C_cu = delta_c(T_eq_cu, T_cal_cu, T_boil, Delta_T)

# Deviations
dev_al = abs(c_al - c_al_lit) / c_al_lit
dev_brass = abs(c_brass - c_brass_lit) / c_brass_lit
dev_cu = abs(c_cu - c_cu_lit) / c_cu_lit

dev_cm_al = abs(cm_al - dulong_petit) / dulong_petit
dev_cm_brass = abs(cm_brass - dulong_petit) / dulong_petit
dev_cm_cu = abs(cm_cu - dulong_petit) / dulong_petit

###############################################################################
#                                   Output                                    #
###############################################################################

printf("\n");

printf("117.a: C_al:    %f ± %f J / K\n", C_al, Delta_C_al);
printf("117.a: C_brass: %f ± %f J / K\n", C_brass, Delta_C_brass);
printf("117.a: C_cu:    %f ± %f J / K\n", C_cu, Delta_C_cu);

printf("\n");

printf("117.b: m_al:    %f ± %f g\n", m_al, Delta_m);
printf("117.b: m_brass: %f ± %f g\n", m_brass, Delta_m);
printf("117.b: m_cu:    %f ± %f g\n", m_cu, Delta_m);

printf("\n");

printf("117.c: c_al:    %f J g / K\n", c_al);
printf("117.c: c_brass: %f J g / K\n", c_brass);
printf("117.c: c_cu:    %f J g / K\n", c_cu);
printf("117.c: Deviation for al:    %f\n", dev_al);
printf("117.c: Deviation for brass: %f\n", dev_brass);
printf("117.c: Deviation for cu:    %f\n", dev_cu);

printf("\n");

printf("117.d: cm_al:    %f J mol / K\n", cm_al);
printf("117.d: cm_brass: %f J mol / K\n", cm_brass);
printf("117.d: cm_cu:    %f J mol / K\n", cm_cu);
printf("117.d: Deviation for al:    %f\n", dev_cm_al);
printf("117.d: Deviation for brass: %f\n", dev_cm_brass);
printf("117.d: Deviation for cu:    %f\n", dev_cm_cu);
