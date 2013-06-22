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

###############################################################################
#                                  Messwerte                                  #
###############################################################################

# Masse der Scheibe [kg].
m = 1.112;
Delta_m = 0;

# Radius der Scheibe [m].
r = .15;
Delta_r = 0.0005;

# Radius der Löcher [m].
r_L = 0.005;
Delta_r_L = 0.0005;

# Perioden für das i. Loch von innen [s]. Der Schwerpunkt zählt als i=0, die
# erste Messung ist i=1, da Octave die Indizes bei 1 starten lässt.
T_list = [1.213 1 .963 .937 .925 .835 .935 .950];
Delta_T = 0.05;

a_list = [3.3 6.1 7.5 9.0 10.05 11.55 13.35 14.55] * 1e-2;
Delta_a = .5e-3;

###############################################################################
#                               gegebene Daten                                #
###############################################################################

# Ortsfaktor [N / kg].
g_lit = 9.81;

# Anzahl der Löcher.
loch_zahl = 8;

###############################################################################
#                                  Rechnung                                   #
###############################################################################

d_list = [];

for n = 1:(length(a_list)-1)
	d_list = [d_list ; abs(a_list(n) - a_list(n+1))];
endfor

d = mean(d_list);
Delta_d = std(d_list) / sqrt(length(d_list));

x_list = [];
y_list = [];
Delta_y_list = [];

for n = 1:length(T_list)
	T = T_list(n);
	a = a_list(n);

	# y = m*x + b
	y = a * T^2;
	Delta_y = sqrt(sumsq([
				Delta_a * T^2
				Delta_T * 2 * a * T
				]));
	x = a^2;

	x_list = [x_list ; x];
	y_list = [y_list ; y];
	Delta_y_list = [Delta_y_list ; Delta_y];

	printf("n = %2d, a = %5.3f m, T = %5.2f s\n", n, a, T)
endfor

plot_data = [x_list y_list Delta_y_list];
save plot_data.dat plot_data

printf("\n");

###############################################################################
#                          Fitparameter aus gnuplot                           #
###############################################################################

# TODO Hier müssen die Fitparameter aus gnuplot eingetragen werden.

# Geradensteigung.
mu = 1;
Delta_mu = 1;

# y-Achsen-Abschnitt
nu = 1;
Delta_nu = 1;

###############################################################################
#                             weitere Rechnungen                              #
###############################################################################

g = 4 * pi^2 / mu;
Delta_g = Delta_mu * abs(4 * pi^2 / mu^2);
epsilon_g = (g - g_lit) / g_lit;

I = nu / (4 * pi^2) * m * g;
Delta_I = sqrt(sumsq([
			Delta_g * (m * nu)/(4 * pi^2)
			Delta_m * (g * nu)/(4 * pi^2)
			Delta_nu * g * m / (4 * pi^2)
]));

I_scheibe = m * r^2 / 2;
epsilon_I_scheibe = (I - I_scheibe) / I_scheibe;

I_theo = 0.5 * m * (r^2 
		- (pi * r_L^2)/(pi * r^2 - loch_zahl * pi * r_L^2) * loch_zahl * (r_L^2
			+ d^2 * (n+1) * (2*n +1) / 3
			)
		);
epsilon_I_theo = (I_scheibe - I_theo) / I_scheibe;

###############################################################################
#                                  Ergebnis                                   #
###############################################################################

printf("\n");

printf("109.f: I = %f ± %f kg m²\n", I, Delta_I);
printf("109.f: g = %f ± %f (ε = %f) N / kg\n", g, Delta_g, epsilon_g);
printf("109.f: μ = %f ± %f\n", mu, Delta_mu);
printf("109.f: ν = %f ± %f\n", nu, Delta_nu);

printf("\n");

printf("109.g: ε_g = %f\n", epsilon_g);
printf("109.g: ε_I_scheibe = %f\n", epsilon_I_scheibe);

printf("\n");

printf("109.i: I_theo = %f kg m²\n", I_theo);
printf("109.i: ε_I_theo = %f \n", epsilon_I_theo);
