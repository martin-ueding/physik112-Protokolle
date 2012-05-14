#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>
# Änderungen © 2012 Simon Schlepphorst

# physik112 Experiment 117.

###############################################################################
#                                Measurements                                 #
###############################################################################

# Pressure in the lab with respect to zero height [hPa].
p_zero = 995;
Delta_p_zero = 0;

# Height of the lab [m].
h = 65;
Delta_h = 0;

# Mass of the cup [g].
m_cup = 90;

# Mass of the water [g].
m_water = 200 - m_cup

# Mass of the objects [g].
m_al = 155;
m_brass = 478;
m_cu = 505;

Delta_m = 1;

# Calorimeter temperature [°C].
T_cal_al = 20.2;
T_cal_brass = 22.0;
T_cal_cu = 20.5;

# Equilibrium temperature [°C].
T_eq_al = 34.5;
T_eq_brass = 39.3;
T_eq_cu = 39.2;

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

# Source: https://en.wikipedia.org/wiki/Heat_capacity

u_al = 26.9815386;
u_cu = 63.546;
u_zn = 118.710;

# Source: Wolfram|Alpha

# Height scale for barometric formula [m].
h_0 = 7800;

# Source: Gerthsen Physik 24

# Theoretical value of 3*R [J / mol K].
dulong_petit = 24.9;

# Source: Wikipedia

# Conversion [Torr] -> [hPa].
torr_per_hPa = 0.75006375541921

# Source: http://www.unitjuggler.com/pressure-umwandeln-von-hPa-nach-Torr.html

###############################################################################
#                                  Functions                                  #
###############################################################################

p_zero = p_zero * torr_per_hPa

# Boil temp of water [Torr] -> [°C].
function T = boil_temp(p)
	T = 100 + 0.03687 * (p - 760) - 0.000022 * (p - 760)^2;
endfunction

function Delta_T = error_boil_temp(p, Delta_p)
	Delta_T = Delta_p * (0.03687 - 0.000044 * (-760 + p));
endfunction

function Delta_C = delta_c(C_cal, Delta_C_cal, T_eq, T_cal, T_boil, Delta_T, Delta_T_boil)
	# ΔC_cal
	part_C_cal = Delta_C_cal*((T_eq - T_cal)/(T_boil - T_eq))

	# ΔT_eq
	part_T_eq = Delta_T * C_cal*(1/(T_boil - T_eq) + (-T_cal + T_eq)/(T_boil - T_eq)^2)

	# ΔT_cal
	part_T_cal = Delta_T * C_cal*(-(1/(T_boil - T_eq)))

	# ΔT_boil
	part_T_boil = Delta_T_boil * (-((C_cal*(T_eq - T_cal))/(T_boil - T_eq)^2))

	Delta_C = sqrt(sumsq([part_C_cal part_T_eq part_T_cal part_T_boil]))
endfunction

###############################################################################
#                                Calculations                                 #
###############################################################################

# Specific heat of the cup.
c_brass_lit = c_cu_lit * .63 + c_zn_lit * .37
u_brass = u_cu * .63 + u_zn * .37

# Heat coefficient of the cup.
C_cup = c_brass_lit * m_cup
Delta_C_cup = Delta_m * c_brass_lit

# Heat coefficient of the total calorimeter
C_water = c_water_lit * m_water
Delta_C_water = Delta_m * c_water_lit

C_cal = C_cup + C_water
Delta_C_cal = sqrt(sumsq([Delta_C_cup Delta_C_water]))

# Calculate pressure to the given height.
p = p_zero * exp(-h / h_0)
Delta_p = Delta_p_zero * torr_per_hPa * exp(-h / h_0)

# Calculate boiling temperature at given pressure.
T_boil = boil_temp(p)
Delta_T_boil = error_boil_temp(p, Delta_p)

# Total heat capacity.
C_al = C_cal * (T_eq_al - T_cal_al) / (T_boil - T_eq_al)
Delta_C_al = delta_c(C_cal, Delta_C_cal, T_eq_al, T_cal_al, T_boil, Delta_T, Delta_T_boil)

C_brass = C_cal * (T_eq_brass - T_cal_brass) / (T_boil - T_eq_brass)
Delta_C_brass = delta_c(C_cal, Delta_C_cal, T_eq_brass, T_cal_brass, T_boil, Delta_T, Delta_T_boil)

C_cu = C_cal * (T_eq_cu - T_cal_cu) / (T_boil - T_eq_cu)
Delta_C_cu = delta_c(C_cal, Delta_C_cal, T_eq_cu, T_cal_cu, T_boil, Delta_T, Delta_T_boil)

# Specific heat capacity.
c_al = C_al / m_al
Delta_c_al = sqrt(sumsq([
	# ΔC_al
	Delta_C_al / m_al
	# Δm
	Delta_m * (- C_al/m_al^2)
]))

c_brass = C_brass / m_brass
Delta_c_brass = sqrt(sumsq([
	# ΔC_al
	Delta_C_brass / m_brass
	# Δm
	Delta_m * (- C_al/m_brass^2)
]))

c_cu = C_cu / m_cu
Delta_c_cu = sqrt(sumsq([
	# ΔC_al
	Delta_C_cu / m_cu
	# Δm
	Delta_m * (- C_al/m_cu^2)
]))

# Molar heat capacity.
cm_al = c_al * u_al
Delta_cm_al = Delta_c_al * u_al

cm_brass = c_brass * u_brass
Delta_cm_brass = Delta_c_brass * u_brass

cm_cu = c_cu * u_cu
Delta_cm_cu = Delta_c_cu * u_cu

# Deviations
dev_al = (c_al - c_al_lit) / c_al_lit
dev_brass = (c_brass - c_brass_lit) / c_brass_lit
dev_cu = (c_cu - c_cu_lit) / c_cu_lit

dev_cm_al = (cm_al - dulong_petit) / dulong_petit
dev_cm_brass = (cm_brass - dulong_petit) / dulong_petit
dev_cm_cu = (cm_cu - dulong_petit) / dulong_petit

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

printf("117.c: c_al:    %f ± %f J g / K\n", c_al, Delta_c_al);
printf("117.c: c_brass: %f ± %f J g / K\n", c_brass, Delta_c_brass);
printf("117.c: c_cu:    %f ± %f J g / K\n", c_cu, Delta_c_cu);
printf("117.c: Deviation for al:    %f\n", dev_al);
printf("117.c: Deviation for brass: %f\n", dev_brass);
printf("117.c: Deviation for cu:    %f\n", dev_cu);

printf("\n");

printf("117.d: cm_al:    %f ± %f J mol / K\n", cm_al, Delta_cm_al);
printf("117.d: cm_brass: %f ± %f J mol / K\n", cm_brass, Delta_cm_brass);
printf("117.d: cm_cu:    %f ± %f J mol / K\n", cm_cu, Delta_cm_cu);
printf("117.d: Deviation for al:    %f\n", dev_cm_al);
printf("117.d: Deviation for brass: %f\n", dev_cm_brass);
printf("117.d: Deviation for cu:    %f\n", dev_cm_cu);
