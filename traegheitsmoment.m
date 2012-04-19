#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                  physik111 Versuch 108 „Trägheitsmoment“                    #
###############################################################################

I_theo = 0.0084891;

###############################################################################
#                                 Daten laden                                 #
###############################################################################

# Struktur der Spalten in ``data``:
#
# Masse Radius Fallhöhe Fallzeit Umläufe Umlaufszeit
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

###############################################################################
#                             Energiesatz Methode                             #
###############################################################################

list_25_25 = [];
list_25_100 = [];
list_50_25 = [];
list_50_100 = [];

for n = 1:length(massen)
	x = omega(n) ** 2;
	y = hoehen(n);

	p = [x, y];
	
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

	I = m * (2 * 9.81 * mu - r^2);

	result = [I];
endfunction

I_list = [ handleB(list_25_100, .025, 1) handleB(list_25_25, .025, .25) handleB(list_50_100, .050, 1) handleB(list_50_25, .050, .25) ];

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

	p = [x, y];
	
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

	I = m * (9.81 * mu - r) * r;

	result = [I];
endfunction

I_drehmoment_list = [ handleC(list_25_100, .025, 1) handleC(list_25_25, .025, .25) handleC(list_50_100, .050, 1) handleC(list_50_25, .050, .25) ];

I_drehmoment = mean(I_drehmoment_list);
Delta_I_drehmoment = std(I_drehmoment_list) / sqrt(length(I_drehmoment_list));

epsilon_I_drehmoment = (I_drehmoment - I_theo) / I_theo;

###############################################################################
#                                  Aufgaben                                   #
###############################################################################

printf("\n");

printf("108.b: I = %f ± %f\n", I_energie, Delta_I_energie);

printf("\n");

printf("108.c: I = %f ± %f\n", I_drehmoment, Delta_I_drehmoment);

printf("\n");

printf("108.e: epsilon_I_energie = %f\n", epsilon_I_energie);
printf("108.e: epsilon_I_drehmoment = %f\n", epsilon_I_drehmoment);
