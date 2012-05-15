#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# Versuch 102

# In diesem Programm müssen zum einen die Messwerte selbst eingetragen werden.
# Zum anderen müssen die Fitparameter aus gnuplot hier übertragen werden. Diese
# Stellen habe ich mit ``TODO`` gekennzeichnet.

###############################################################################
#                                  Messungen                                  #
#                                 Abmessungen                                 #
###############################################################################

# TODO Messwerte hier hin.

# Abmessungen der Stäbe [m].
alu.breite.val = 10.1e-3;
alu.dicke.val = 2.0e-3;

kupfer.breite.val = 10.2e-3;
kupfer.dicke.val = 1.45e-3;

stahl.breite.val = 10.25e-3;
stahl.dicke.val = 1.48e-3;

pvc.breite.val = 20.1e-3;
pvc.dicke.val = 4.15e-3;

gfk.breite.val = 20.65e-3;
gfk.dicke.val = 3.2e-3;

# Fehler für Breite und Dickenmessung [m]. Dieser wird später auf alle diese
# Größen draufgerechnet.
breite.err = 0.05e-3;

# Länge der Stäbe, wie in der Versuchsanleitung [m]
laenge.val = 400e-3;
laenge.err = 0.5e-3;

###############################################################################
#                                  Messungen                                  #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# TODO Messwerte hier hin.

# Dies sind die Durchbiegungen. Dabei die Paare als Kraft [N] und Durchbiegung
# [m] angeben.

# Ortsfaktor [N/kg]
g = 9.81;

aluminium.durchbiegung.val = [
	0.050 * g	(12.7 - 11.25) / 10 * 10^-2
	0.100 * g	(12.7 - 9.7) / 10 * 10^-2
	0.150 * g	(12.7 - 8.2) / 10 * 10^-2
	0.200 * g	(12.7 - 6.7) / 10 * 10^-2
	0.250 * g	(12.7 - 5.2) / 10 * 10^-2
	0.300 * g	(12.7 - 3.8) / 10 * 10^-2
];

kupfer.durchbiegung.val = [
	0.050 * g	(16 - 15.75) / 10 * 10^-2
	0.100 * g	(16 - 14.4) / 10 * 10^-2
	0.150 * g	(16 - 13.6) / 10 * 10^-2
	0.200 * g	(16 - 12.49) / 10 * 10^-2
	0.250 * g	(16 - 12.0) / 10 * 10^-2
	0.300 * g	(16 - 11.25) / 10 * 10^-2
	0.350 * g	(16 - 10.37) / 10 * 10^-2
];

stahl.durchbiegung.val = [
	0.050 * g	(11.75 - 10.6) / 10 * 10^-2
	0.100 * g	(11.75 - 9.25) / 10 * 10^-2
	0.150 * g	(11.75 - 8.0) / 10 * 10^-2
	0.200 * g	(11.75 - 6.9) / 10 * 10^-2
	0.250 * g	(11.75 - 5.6) / 10 * 10^-2
	0.300 * g	(11.75 - 4.35) / 10 * 10^-2
	0.350 * g	(11.75 - 3.1) / 10 * 10^-2
];


# Fehler in den Durchbiegungen [m].
durchbiegung.err = 0.1e-3;

###############################################################################
#                                  Messungen                                  #
#                          Aufgabe 1.b -- Knicklast                           #
###############################################################################

# TODO Messwerte hier hin.

stahl2.knickung.val = [
	0 * g		0.99
	1 * g		1.04
	2 * g		1.13
	3 * g		1.67
	3.1 * g		1.92
	3.2 * g		2.34
	3.25 * g	2.69
];

pvc.knickung.val = [
	0 * g		0.75
	2 * g		0.86
	2.5 * g		1.27
	2.6 * g		3
];

gfk.knickung.val = [
	0 * g		0.83
	5 * g		0.89
	7 * g		1.08
	7.1 * g		1.17
	7.3 * g		1.26
	7.5 * g		1.50
	7.6 * g		1.86
];

knickung.err = 0.02;

###############################################################################
#                                  Messungen                                  #
#                        Aufgabe 2.a -- Torsionspendel                        #
###############################################################################

# TODO Messwerte hier hin.

# Die Messwerte vom Torsionspendel. Dabei den Abstand der Massen [m], die
# Anzahl der Perioden und die Dauer [s] angeben.

stahl3.schwingung.val = [
	25e-2		3		3.8
	25e-2		4		4.8
	25e-2		6		7.4
	25e-2		8		10.2
	25e-2		10		12.0

	50e-2		3		4.8
	50e-2		4		6.3
	50e-2		6		9.7
	50e-2		8		12.9
	50e-2		10		16.2

	75e-2		3		5.9
	75e-2		4		8.2
	75e-2		6		12.6
	75e-2		8		16.8
	75e-2		10		21.2

	100e-2		3		7.8
	100e-2		4		10.5
	100e-2		6		15.7
	100e-2		8		21.0
	100e-2		10		26.2

	0			5		5.5
	0			6		6.5
	0			7		7.6
	0			8		8.7
	0			9		9.8
	0			10		11.2
	0			11		12.0
	0			12		13.2
	0			13		14.2
	0			14		15.1
	0			15		16.4
];

# Der Durchmesser des Stahldrahtes [m]. Umgerechnet auf einen Radius.
stahl3.radius.val = 1.06e-3 / 2;

# Und der passende Fehler [m].
stahl3.radius.err = 0.01e-3 / 2;

# Messfehler in der Periode [s].
periode.err = 0.2;

# Masse der extra Scheiben für das Pendel [kg].
m.val = 0.1;
m.err = 0;

# Länge des Drahtes über und unter dem Pendel [m].
l.val = 15e-2;
l.err = 1e-2;

###############################################################################
#                                 Funktionen                                  #
###############################################################################

function dev = epsilon(obj)
	dev = (obj.val - obj.lit) / obj.lit;
endfunction

###############################################################################
#                               Literaturwerte                                #
#                    Quelle: Gerthsen Physik, 24. Auflage                     #
###############################################################################

alu.E.lit = 72e9;
kupfer.E.lit = 120e9;
stahl.E.lit = 195e9;
stahl2.E.lit = 195e9;

# https://de.wikipedia.org/wiki/Polyvinylchlorid
pvc.E.lit = 2000e6;

# http://www.tf.uni-kiel.de/matwis/amat/mw1_ge/kap_7/illustr/t7_1_2.html
gfk.E.lit = 30e9;

G.lit = 80e9;

###############################################################################
#                                 Rechnungen                                  #
#                           Flächenträgheitsmomente                           #
###############################################################################

# Die Fehler in der Breite und Dicke zuweisen.
alu.breite.err = breite.err;
alu.dicke.err = breite.err;

kupfer.breite.err = breite.err;
kupfer.dicke.err = breite.err;

stahl.breite.err = breite.err;
stahl.dicke.err = breite.err;

stahl2.breite.err = breite.err;
stahl2.dicke.err = breite.err;

pvc.breite.err = breite.err;
pvc.dicke.err = breite.err;

gfk.breite.err = breite.err;
gfk.dicke.err = breite.err;

# Die Länge zuweisen.
alu.laenge = laenge;
kupfer.laenge = laenge;
stahl.laenge = laenge;
stahl2.laenge = laenge;
pvc.laenge = laenge;
gfk.laenge = laenge;

function material = I_rechteck(material)
	material.I.val = material.breite.val * material.dicke.val^3 / 12;
	material.I.err = sqrt(
		(material.dicke.val^3 / 12 * material.breite.err)^2
		+ (material.dicke.val * material.dicke.val^2 / 4 * material.dicke.err)^2
	);
endfunction

alu = I_rechteck(alu);
kupfer = I_rechteck(kupfer);
stahl = I_rechteck(stahl);
stahl2.I = stahl.I;
pvc = I_rechteck(pvc);
gfk = I_rechteck(gfk);

printf("Flächenträgheitsmomente\n");
printf("\n")
printf("Aluminium: I = %.2e ± %.2e m^4 (%.1e)\n", alu.I.val, alu.I.err, alu.I.err/alu.I.val);
printf("Kupfer:    I = %.2e ± %.2e m^4 (%.1e)\n", kupfer.I.val, kupfer.I.err, kupfer.I.err/kupfer.I.val);
printf("Stahl:     I = %.2e ± %.2e m^4 (%.1e)\n", stahl.I.val, stahl.I.err, stahl.I.err/stahl.I.val);
printf("PVC:       I = %.2e ± %.2e m^4 (%.1e)\n", pvc.I.val, pvc.I.err, pvc.I.err/pvc.I.val);
printf("GFK:       I = %.2e ± %.2e m^4 (%.1e)\n", gfk.I.val, gfk.I.err, gfk.I.err/gfk.I.val);
printf("\n")

###############################################################################
#                                 Rechnungen                                  #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# Hier werden die Daten für gnuplot vorbereitet.
aluminium_plot = [aluminium.durchbiegung.val ones(length(aluminium.durchbiegung.val), 1) * durchbiegung.err];
kupfer_plot = [kupfer.durchbiegung.val ones(length(kupfer.durchbiegung.val), 1) * durchbiegung.err];
stahl_plot = [stahl.durchbiegung.val ones(length(stahl.durchbiegung.val), 1) * durchbiegung.err];

# Daten speichern.
save("1a_alu.dat", "aluminium_plot");
save("1a_kupfer.dat", "kupfer_plot");
save("1a_stahl.dat", "stahl_plot");

###############################################################################
#                          Fitparameter aus gnuplot                           #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# TODO Parameter hier eintragen.

# Hier müssen die Fitparameter aus gnuplot eingetragen werden. Diese sind in
# der ``fit.log`` Datei zu finden. Dort werden die Parameter inklusive Fehler
# angegeben. Die Bezeichnungen der Variablen ist hier und in gnuplot gleich.

alu.mu.val = 0.00304354;
alu.mu.err = 2.16e-05;

kupfer.mu.val = 0.0017504;
kupfer.mu.err = 9.379e-05;

stahl.mu.val = 0.00252658;
stahl.mu.err = 2.184e-05;

###############################################################################
#                        Rechnungen mit Fitparametern                         #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# Elastizitätsmodul ausrechnen.
function mat = elast(mat)
	mat.E.val = mat.laenge.val^3 / (mat.mu.val * mat.I.val);
	mat.E.err = sqrt(
		(3 * mat.laenge.val^2 / (mat.mu.val * mat.I.val) * mat.laenge.err)^2
		+ (mat.laenge.val^3 / (mat.mu.val^2 * mat.I.val) * mat.mu.err)^2
		+ (mat.laenge.val^3 / (mat.mu.val * mat.I.val^2) * mat.I.err)^2
	);
endfunction

alu = elast(alu);
kupfer = elast(kupfer);
stahl = elast(stahl);

printf("Elastizitätsmodule\n");
printf("\n");
printf("Aluminium: E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", alu.E.val, alu.E.err, alu.E.err/alu.E.val, epsilon(alu.E));
printf("Kupfer:    E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", kupfer.E.val, kupfer.E.err, kupfer.E.err/kupfer.E.val, epsilon(kupfer.E));
printf("Stahl:     E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", stahl.E.val, stahl.E.err, stahl.E.err/stahl.E.val, epsilon(stahl.E));
printf("\n");

###############################################################################
#                                 Rechnungen                                  #
#                          Aufgabe 1.b -- Knicklast                           #
###############################################################################

# Daten zum Plotten speichern.
stahl2_plot = [stahl2.knickung.val ones(length(stahl2.knickung.val), 1) * knickung.err];
pvc_plot = [pvc.knickung.val ones(length(pvc.knickung.val), 1) * knickung.err];
gfk_plot = [gfk.knickung.val ones(length(gfk.knickung.val), 1) * knickung.err];

# Daten speichern.
save("1b_stahl2.dat", "stahl2_plot");
save("1b_pvc.dat", "pvc_plot");
save("1b_gfk.dat", "gfk_plot");

###############################################################################
#                          Fitparameter aus gnuplot                           #
#                          Aufgabe 1.b -- Knicklast                           #
###############################################################################

# TODO Parameter hier eintragen.

# Hier kommen die aus den Plots abgelesenen Werte für die Knicklast rein.
stahl2.F.val = 33;
stahl2.F.err = 5;

pvc.F.val = 25;
pvc.F.err = 5;

gfk.F.val = 75;
gfk.F.err = 5;

###############################################################################
#                                 Rechnungen                                  #
#                          Aufgabe 1.c -- Knicklast                           #
###############################################################################

function mat = elast2(mat)
	mat.E.val = mat.laenge.val^2 / (mat.I.val * pi^2) * mat.F.val;
	mat.E.err = sqrt(
		(2 * mat.laenge.val / (mat.I.val * pi^2) * mat.F.val * mat.laenge.err)^2
		+ (mat.laenge.val^2 / (mat.I.val^2 * pi^2) * mat.F.val * mat.I.err)^2
		+ (mat.laenge.val^2 / (mat.I.val * pi^2) * mat.F.err)^2
	);
endfunction

stahl2 = elast2(stahl2);
pvc = elast2(pvc);
gfk = elast2(gfk);

printf("Elastizitätsmodule\n")
printf("\n")
printf("Stahl: E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", stahl2.E.val, stahl2.E.err, stahl2.E.err/stahl2.E.val, epsilon(stahl2.E));
printf("PVC:   E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", pvc.E.val, pvc.E.err, pvc.E.err/pvc.E.val, epsilon(pvc.E));
printf("GFK:   E = %.2e ± %.2e N/m² (%.1e) [%.1e]\n", gfk.E.val, gfk.E.err, gfk.E.err/gfk.E.val, epsilon(gfk.E));
printf("\n")

stahl.E.val = mean([stahl.E.val stahl2.E.val]);
stahl.E.err = sqrt(sumsq([stahl.E.err stahl2.E.err])) / 2;

###############################################################################
#                                 Rechnungen                                  #
#                        Aufgabe 2.a -- Torsionspendel                        #
###############################################################################

x = stahl3.schwingung.val(:, 1).^2;
y = (stahl3.schwingung.val(:, 3) ./ stahl3.schwingung.val(:, 2)) .^2;
dy = y ./ stahl3.schwingung.val(:, 2) * periode.err;

stahl3_plot = [x y dy];

save("2a.dat", "stahl3_plot");

###############################################################################
#                          Fitparameter aus gnuplot                           #
#                        Aufgabe 2.a -- Torsionspendel                        #
###############################################################################

# TODO Parameter hier eintragen.

alpha.val = 1.18864;
alpha.err = 0.007501;

beta.val = 5.6621;
beta.err = 0.07179;

###############################################################################
#                                 Rechnungen                                  #
#                        Aufgabe 2.a -- Torsionspendel                        #
###############################################################################

D.val = 8 * pi^2 * m.val / beta.val;
D.err = sqrt(
	(8 * pi^2 / beta.val * m.err)^2
	+ (8 * pi^2 * m.val / beta.val^2 * beta.err)
);

# Radius der Zusatzmassen [m], aus der Aufgabenstellung.
massen.r.val = 15e-3;
massen.r.err = 0;
massen.d.val = 16e-3;
massen.d.err = 0;

Theta_Scheibe.val = m.val * massen.r.val^2 / 4 + m.val * massen.d.val^2 / 12;
Theta_Scheibe.err = 0;

Theta_Stange.val = alpha.val * D.val / (4 * pi^2) - 2 * Theta_Scheibe.val;
Theta_Stange.err = sqrt(
	(D.val / (4 * pi^2) * alpha.err)^2
	+ (alpha.val / (4 * pi^2) * D.err)^2
	+ (2 * Theta_Scheibe.err)^2
);

G.val = l.val / (pi * stahl3.radius.val^4) * D.val;
part1 = l.val / (pi * stahl3.radius.val^4) * D.err;
part2 = 1 / (pi * stahl3.radius.val^4) * D.val * l.err;
part3 = 4 * l.val / (pi * stahl3.radius.val^5) * D.val * stahl3.radius.err;
G.err = sqrt(part1^2 + part2^2 + part3^2);

printf("Schubmodul\n");
printf("\n");
printf("r        = %.2e ± %.2e m      (%.1e)\n", stahl3.radius.val, stahl3.radius.err, stahl3.radius.err/stahl3.radius.val);
printf("D        = %.2e ± %.2e Nm/rad (%.1e)\n", D.val, D.err, D.err/D.val);
printf("Θ_Stange = %.2e ± %.2e kg m²  (%.1e)\n", Theta_Stange.val, Theta_Stange.err, Theta_Stange.err/Theta_Stange.val);
printf("G        = %.2e ± %.2e N/m²   (%.1e) [%.1e]\n", G.val, G.err, G.err/G.val, epsilon(G));
printf("\n");
