#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                  physik111 Versuch 108 „Trägheitsmoment“                    #
###############################################################################

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

I_theo = 0.0084891;

# Fehler in der Zeitbestimmung [s].
Delta_T = 0.2;

###############################################################################
#                                 Daten laden                                 #
###############################################################################

# Struktur der Spalten in ``data``:
#
# Masse [g], Radius [cm], Fallhöhe [cm], Fallzeit [s], Umläufe, Umlaufszeit [s]
load "data.dat"

# Zerlege die Datentabelle in einzelne Spaltenvektoren.
massen = data(:, 1);
radien = data(:, 2);
hoehen = data(:, 3);
fallzeiten = data(:, 4);
umlaeufe = data(:, 5);
umlaufzeit = data(:, 6);

###############################################################################
#                            allgemeine Rechnungen                            #
###############################################################################

perioden = umlaufzeit ./ umlaeufe;

omega = 2 * pi ./ perioden;

Delta_Omega = 2 * pi ./ (perioden.^2) * Delta_T;

###############################################################################
#                             Energiesatz Methode                             #
###############################################################################

# Definiere Listen, die gleich gefüllt werden.
list_25_25 = [];
list_25_100 = [];
list_50_25 = [];
list_50_100 = [];

# Gehe alle Daten durch, und fülle in die entsprechenden Listen ein, je nach
# Masse und Radius getrennt.
for n = 1:length(massen)
	x = omega(n)^2;
	y = hoehen(n) / 100;

	# Kombiniere zu einem Punkt.
	p = [x, y];
	
	# Sortiere den Punkt in die entsprechende Liste ein.
	if (massen(n) == 25)
		if (radien(n) == 10)
			list_25_100 = [list_25_100 ; p];
		else
			list_25_25 = [list_25_25 ; p];
		endif
	else
		if (radien(n) == 10)
			list_50_100 = [list_50_100 ; p];
		else
			list_50_25 = [list_50_25 ; p];
		endif
	endif
endfor

# Speichere Daten für Plot.
save "108b_25_100.dat" list_25_100
save "108b_25_25.dat" list_25_25
save "108b_50_100.dat" list_50_100
save "108b_50_25.dat" list_50_25

function result = handleB(list, m, r)
	x = list(:, 1);
	y = list(:, 2);

	# Geradenanpassung
	mu = cov(x, y) / var(x);
	printf("Energie: μ(m=%.2e, r=%.2e) = %.2e\n", m, r, mu);

	I = m * (2 * 9.81 * mu - r^2);
	printf("Energie: I(m=%.2e, r=%.2e) = %.2e\n", m, r, I);

	result = [I];
endfunction

I_list = [ handleB(list_25_100, .025, .1) handleB(list_25_25, .025, .025) handleB(list_50_100, .05, .1) handleB(list_50_25, .050, .025) ];

I_energie = mean(I_list);
Delta_I_energie = std(I_list) / sqrt(length(I_list));

epsilon_I_energie = (I_energie - I_theo) / I_theo;


###############################################################################
#                            Drehmomensatz Methode                            #
###############################################################################

list_25_25 = [];
list_25_100 = [];
list_50_25 = [];
list_50_100 = [];

for n = 1:length(massen)
	x = omega(n);
	y = fallzeiten(n);
	dy = Delta_T;

	p = [x, y, dy];
	
	if (massen(n) == 25)
		if (radien(n) == 10)
			list_25_100 = [list_25_100 ; p];
		else
			list_25_25 = [list_25_25 ; p];
		endif
	else
		if (radien(n) == 10)
			list_50_100 = [list_50_100 ; p];
		else
			list_50_25 = [list_50_25 ; p];
		endif
	endif
endfor

# Speichere Daten für Plot.
save "108c_25_100.dat" list_25_100
save "108c_25_25.dat" list_25_25
save "108c_50_100.dat" list_50_100
save "108c_50_25.dat" list_50_25

function result = handleC(list, m, r)
	x = list(:, 1);
	y = list(:, 2);

	# Geradenanpassung
	mu = cov(x, y) / var(x);
	printf("Drehmoment: μ(m=%.2e, r=%.2e) = %.2e\n", m, r, mu);

	I = m * (9.81 * mu - r) * r;
	printf("Drehmoment: I(m=%.2e, r=%.2e) = %.2e\n", m, r, I);

	result = [I];
endfunction

I_drehmoment_list = [ handleC(list_25_100, .025, .1) handleC(list_25_25, .025, .025) handleC(list_50_100, .050, .1) handleC(list_50_25, .050, .025) ];

I_drehmoment = mean(I_drehmoment_list);
Delta_I_drehmoment = std(I_drehmoment_list) / sqrt(length(I_drehmoment_list));

epsilon_I_drehmoment = (I_drehmoment - I_theo) / I_theo;

###############################################################################
#                                  Aufgaben                                   #
###############################################################################

printf("\n");

printf("108.b: I = %f ± %f kg m^2\n", I_energie, Delta_I_energie);

printf("\n");

printf("108.c: I = %f ± %f kg m^2\n", I_drehmoment, Delta_I_drehmoment);

printf("\n");

printf("108.e: epsilon_I_energie = %f\n", epsilon_I_energie);
printf("108.e: epsilon_I_drehmoment = %f\n", epsilon_I_drehmoment);
