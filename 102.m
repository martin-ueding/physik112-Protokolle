#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# Versuch 102

###############################################################################
#                                  Messungen                                  #
#                                 Abmessungen                                 #
###############################################################################

# Abmessungen der Stäbe [m].

alu.breite.val = 1;
alu.dicke.val = 1;

kupfer.breite.val = 1;
kupfer.dicke.val = 1;

stahl1.breite.val = 1;
stahl1.dicke.val = 1;

pvc.breite.val = 1;
pvc.dicke.val = 1;

gfk.breite.val = 1;
gfk.dicke.val = 1;

# Fehler für Breite und Dickenmessung [m]. Dieser wird später auf alle diese
# Größen draufgerechnet.
breite.err = 0.001;

# Länge der Stäbe, wie in der Versuchsanleitung [m]
laenge.val = 400e-3;
laenge.err = 0.5e-3;

###############################################################################
#                                  Messungen                                  #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# Dies sind die Durchbiegungen. Dabei die Paare als Kraft [N] und Durchbiegung
# [m] angeben.

aluminium.durchbiegung.val = [
   0.391409   0.996575
   0.704232   0.191150
   0.027355   0.784342
   0.096624   0.650735
   0.882107   0.396150
   0.827381   0.124268
   0.362158   0.726542
];

kupfer.durchbiegung.val = [
   0.175852   0.745137
   0.946310   0.038911
   0.449856   0.773995
   0.854179   0.922200
   0.250783   0.819575
   0.546821   0.904476
   0.038243   0.530155
];

stahl1.durchbiegung.val = [
   0.48554   0.18709
   0.52237   0.66030
   0.21503   0.34866
   0.85535   0.69202
   0.99076   0.10359
   0.59792   0.36683
   0.74274   0.39041
];


# Fehler in den Durchbiegungen [m].
durchbiegung.err = 0.1;

###############################################################################
#                                  Messungen                                  #
#                          Aufgabe 1.b -- Knicklast                           #
###############################################################################

stahl2.knickung.val = [
   0.466742   0.053706
   0.282569   0.870156
   0.977930   0.297889
   0.446766   0.854111
   0.718474   0.967529
   0.145537   0.085825
   0.263556   0.280030
];

pvc.knickung.val = [
   0.642486   0.947998
   0.652441   0.730301
   0.590789   0.336981
   0.036135   0.301853
   0.961874   0.491673
   0.402403   0.552949
   0.764620   0.909589

];

gfk.knickung.val = [
   0.274635   0.534678
   0.215914   0.415906
   0.056233   0.970390
   0.723662   0.509737
   0.722620   0.717131
   0.515478   0.933349
   0.848369   0.065128
];

knickung.err = 0.1;

###############################################################################
#                                  Messungen                                  #
#                        Aufgabe 2.a -- Torsionspendel                        #
###############################################################################

# Die Messwerte vom Torsionspendel. Dabei den Abstand der Massen [m], die
# Anzahl der Perioden und die Dauer [s] angeben.

stahl3.schwingung = [
	25		3		1
	25		4		1
	25		6		1
	25		8		1
	25		10		1

	50		3		1
	50		4		1
	50		6		1
	50		8		1
	50		10		1

	75		3		1
	75		4		1
	75		6		1
	75		8		1
	75		10		1

	100		3		1
	100		4		1
	100		6		1
	100		8		1
	100		10		1

	0		5		1
	0		6		1
	0		7		1
	0		8		1
	0		9		1
	0		10		1
	0		11		1
	0		12		1
	0		13		1
	0		14		1
	0		15		1
];

# Der Durchmesser des Stahldrahtes [m].
stahl3.durchmesser.val = 1;

# Und der passende Fehler [m].
stahl3.durchmesser.err = 1;

###############################################################################
#                                 Rechnungen                                  #
#                           Flächenträgheitsmomente                           #
###############################################################################

# Die Fehler in der Breite und Dicke zuweisen.
alu.breite.err = breite.err;
alu.dicke.err = breite.err;

kupfer.breite.err = breite.err;
kupfer.dicke.err = breite.err;

stahl1.breite.err = breite.err;
stahl1.dicke.err = breite.err;

pvc.breite.err = breite.err;
pvc.dicke.err = breite.err;

gfk.breite.err = breite.err;
gfk.dicke.err = breite.err;

# Die Länge zuweisen.
alu.laenge = laenge;
kupfer.laenge = laenge;
stahl1.laenge = laenge;
pvc.laenge = laenge;
gfk.laenge = laenge;

function material = I_rechteck(material)
	material.I.val = material.breite.val * material.dicke.val^3 / 12;
	material.I.err = sqrt(
		(material.dicke.val^3 / 12 * material.breite.err)^2
		+ (material.dicke.val * material.dicke.val^2 / 4 * material.dicke.err)^2
	);
endfunction

function material = I_kreis(material)
	material.I.val = 1/4 * pi * material.radius.val^4;
	material.I.err = abs(pi * material.radius.val^3 * material.radius.err);
endfunction

alu = I_rechteck(alu);
kupfer = I_rechteck(kupfer);
stahl1 = I_rechteck(stahl1);
pvc = I_rechteck(pvc);
gfk = I_rechteck(gfk);

printf("Flächenträgheitsmomente\n");
printf("\n")
printf("Aluminium: I = %f ± %f m^4\n", alu.I.val, alu.I.err);
printf("Kupfer:    I = %f ± %f m^4\n", kupfer.I.val, kupfer.I.err);
printf("Stahl:     I = %f ± %f m^4\n", stahl1.I.val, stahl1.I.err);
printf("PVC:       I = %f ± %f m^4\n", pvc.I.val, pvc.I.err);
printf("GFK:       I = %f ± %f m^4\n", gfk.I.val, gfk.I.err);
printf("\n")

###############################################################################
#                                 Rechnungen                                  #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# Hier werden die Daten für gnuplot vorbereitet.
aluminium_plot = [aluminium.durchbiegung.val ones(length(aluminium.durchbiegung.val), 1) * durchbiegung.err];
kupfer_plot = [kupfer.durchbiegung.val ones(length(kupfer.durchbiegung.val), 1) * durchbiegung.err];
stahl1_plot = [stahl1.durchbiegung.val ones(length(stahl1.durchbiegung.val), 1) * durchbiegung.err];

# Daten speichern.
save("a_alu.dat", "aluminium_plot");
save("a_kupfer.dat", "kupfer_plot");
save("a_stahl1.dat", "stahl1_plot");

###############################################################################
#                          Fitparameter aus gnuplot                           #
#                        Aufgabe 1.a -- Durchbiegungen                        #
###############################################################################

# Hier müssen die Fitparameter aus gnuplot eingetragen werden. Diese sind in
# der ``fit.log`` Datei zu finden. Dort werden die Parameter inklusive Fehler
# angegeben. Die Bezeichnungen der Variablen ist hier und in gnuplot gleich.

alu.mu.val = 1;
alu.mu.err = 1;

kupfer.mu.val = 1;
kupfer.mu.err = 1;

stahl1.mu.val = 1;
stahl1.mu.err = 1;

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
stahl1 = elast(stahl1);

printf("Elastizitätsmodule\n");
printf("\n");
printf("Aluminium: E = %f ± %f\n", alu.E.val, alu.E.err);
printf("Kupfer:    E = %f ± %f\n", kupfer.E.val, kupfer.E.err);
printf("Stahl:     E = %f ± %f\n", stahl1.E.val, stahl1.E.err);
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
save("b_stahl2.dat", "stahl2_plot");
save("b_pvc.dat", "pvc_plot");
save("b_gfk.dat", "gfk_plot");

###############################################################################
#                          Fitparameter aus gnuplot                           #
#                          Aufgabe 1.b -- Knicklast                           #
###############################################################################

# Hier kommen die aus den Plots abgelesenen Werte für die Knicklast rein.
stahl2.F.val = 1;
stahl2.F.err = 1;

pvc.F.val = 1;
pvc.F.err = 1;

gfk.F.val = 1;
gfk.F.err = 1;

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
printf("Stahl: E = %f ± %f\n", stahl2.E.val, stahl2.E.err);
printf("PVC: E = %f ± %f\n", pvc.E.val, pvc.E.err);
printf("PVC: E = %f ± %f\n", gfk.E.val, gfk.E.err);
printf("\n")
