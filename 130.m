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

# Erster Versuchsteil. Die erste Spalte ist die Anzahl der Zerfälle, die
# zweite Spalte.
poisson.bins = [
	0	54
	1	95
	2	90
	3	39
	4	15
	5	8
	6	1
];

laplace.bins = [
	270	2
	280	6
	290	23
	300	49
	310	65
	320	70
	330	45
	340	23
	350	10
	360	5
	370	2
];

###############################################################################
#                                 Funktionen                                  #
###############################################################################

function p = P_poisson(k, mu)
	p = mu^k / factorial(k) * exp(-mu);
endfunction

function p = P_laplace(k, mu)
	p = 1/sqrt(2 * pi * mu) * exp(- (k - mu)^2 / (2 * mu));
endfunction

###############################################################################
#                                 Rechnungen                                  #
#                              Poissonverteilung                              #
###############################################################################

# Zähle die Messwerte.
poisson.N = sum(poisson.bins(:, 2));

# Rechne den Schätzer für den Mittelwert aus.
poisson.mu.val = sum(poisson.bins(:, 1) .* poisson.bins(:, 2)) / poisson.N;

# Den Fehler für den Mittelwert.
poisson.mu.err = sqrt(poisson.mu.val / poisson.N);

# Die erwarteten Zählergebnisse.
poisson.erwartet = [];
poisson.fehler = [];

for n = poisson.bins(:, 1)'
	erwartet = poisson.N * P_poisson(n, poisson.mu.val);
	fehler = sqrt(erwartet * (1 - erwartet/poisson.N));

	poisson.erwartet = [poisson.erwartet ; erwartet];
	poisson.fehler = [poisson.fehler ; fehler];
endfor

poisson_plot_data = [poisson.bins(:, 1)+0.5, poisson.bins(:, 2)];
save "poisson_data.dat" poisson_plot_data;

poisson_plot_fit = [poisson.bins(:, 1)+0.5, poisson.erwartet, poisson.fehler];
save "poisson_fit.dat" poisson_plot_fit;

###############################################################################
#                                 Rechnungen                                  #
#                              Laplaceverteilung                              #
###############################################################################

# Zähle die Messwerte.
laplace.N = sum(laplace.bins(:, 2));

# Berechne den Schätzer für den Mittelwert.
laplace.mu.val = sum((laplace.bins(:, 1)+5) .* laplace.bins(:, 2)) / laplace.N;

# Und den Fehler.
laplace.mu.err = sqrt(laplace.mu.val / laplace.N);

# Die erwarteten Zählergebnisse.
laplace.erwartet = [];
laplace.fehler = [];

for n = laplace.bins(:, 1)'
	erwartet = 10 * laplace.N * P_laplace(n+5, laplace.mu.val);
	fehler = sqrt(erwartet * (1 - erwartet/laplace.N));

	laplace.erwartet = [laplace.erwartet ; erwartet];
	laplace.fehler = [laplace.fehler ; fehler];
endfor

laplace_plot_data = [laplace.bins(:, 1)+5, laplace.bins(:, 2)];
save "laplace_data.dat" laplace_plot_data;

laplace_plot_fit = [laplace.bins(:, 1)+5, laplace.erwartet, laplace.fehler];
save "laplace_fit.dat" laplace_plot_fit;


###############################################################################
#                                 Ergebnisse                                  #
###############################################################################

printf("Poissonverteilung\n")
printf("\n");
printf("N = %d\n", poisson.N);
printf("μ = %.3e ± %.3e (%.2e)\n", poisson.mu.val, poisson.mu.err, poisson.mu.err/poisson.mu.val);
printf("\n");
printf("Laplaceverteilung\n")
printf("\n");
printf("N = %d\n", laplace.N);
printf("μ = %.3e ± %.3e (%.2e)\n", laplace.mu.val, laplace.mu.err, laplace.mu.err/laplace.mu.val);
