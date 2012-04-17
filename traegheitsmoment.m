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

list_25_25 = []
list_25_100 = []
list_50_25 = []
list_50_100 = []

for n = 1:length(massen)
	x = hoehen(n)
	y = omega(n) ** 2

	p = [x, y]
	
	if (massen(n) == 25)
		if (radien(n) == 10)
			list_25_100 = [list_25_100 ; p]
		else
			list_25_25 = [list_25_25 ; p]
		endif
	else
		if (radien(n) == 10)
			list_50_100 = [list_50_100 ; p]
		else
			list_50_25 = [list_50_25 ; p]
		endif
	endif
endfor

save "108b_25_25.dat" list_25_25
save "108b_25_100.dat" list_25_100
save "108b_50_100.dat" list_50_100
save "108b_50_25.dat" list_50_25

###############################################################################
#                            Drehmomensatz Methode                            #
###############################################################################


