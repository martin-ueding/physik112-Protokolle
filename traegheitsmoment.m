#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                  physik111 Versuch 108 „Trägheitsmoment“                    #
###############################################################################

# Lade Daten.
#
# Struktur der Spalten in ``data``:
#
# Masse Radius Fallhöhe Fallzeit Umläufe Umlaufszeit
load "data.dat"

# Zerlege die Datentabelle in einzelne Spaltenvektoren.
massen = data(:, 1)
radien = data(:, 2)
hoehen = data(:, 3)
fallzeiten = data(:, 4)
umlaeufe = data(:, 5)
umlaufzeit = data(:, 6)

perioden = umlaufzeit ./ umlaeufe

omega = 2 * pi ./ perioden

###############################################################################
#                             Energiesatz Methode                             #
###############################################################################

x_list_25 = []
y_list_25 = []

x_list_50 = []
y_list_50 = []

for n = 1:length(massen)
	x = hoehen(n)
	y = omega(n) ** 2
	
	if (massen(n) == 25)
		x_list_25 = [x_list_25 ; x]
		y_list_25 = [y_list_25 ; y]
	else
		x_list_50 = [x_list_50 ; x]
		y_list_50 = [y_list_50 ; y]
	endif
endfor

plot_data_25 = [x_list_25 y_list_25]
plot_data_50 = [x_list_50 y_list_50]

save "108b_25.dat" plot_data_25
save "108b_50.dat" plot_data_50
