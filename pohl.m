#!/usr/bin/octave -fq
# Copyright © 2012 Martin Ueding <dev@martin-ueding.de>

# physik111 Versuch 106

###############################################################################
#                           Messwerte Aufgabe 106.a                           #
###############################################################################

# Liste der Eigenfrequenzen. Als Paare von `Dauer / Anzahl` eingeben. [s]
nu_0.list = [36.00 35.97 36.53 36.63] / 20;

###############################################################################
#                           Messwerte Aufgabe 106.b                           #
###############################################################################

# Amplituden für die verschiedenen Ströme. Dabei pro Zeile eine Messung
# eingeben mit Schwindungsanzahl und Amplitude.

# Strom I = 0.1 A.
I1.phi = [
	0	15.0
	1	14.4
	2	14.0
	3	13.5
	4	13.2
	5	12.8
	6	12.6
	7	12.2
	8	11.6
	9	11.4
	10	11.0
	11	10.8
	12	10.4
	13	10.0
	14	9.8
	15	9.4
];

# Strom I = 0.3 A.
I3.phi = [
	0	15.0
	1	12.8
	2	10.4
	3	8.8
	4	7.4
	5	6.0
	6	5.2
	7	4.2
	8	3.4
	9	3.0
	10	2.4
	11	2.0
	12	1.6
	13	1.4
	14	1.0
	15	0.8
];

# Strom I = 0.5 A.
I5.phi = [
	0	15.0
	1	9.4
	2	6.0
	3	3.8
	4	2.4
	5	1.2
	6	0.8
	7	0.6
	8	0.2
	9	0.2
	10	0.1
	11	0
	12	0
	13	0
	14	0
	15	0
];

# Fehler in der Amplitude.
Delta_phi = 0.1;

###############################################################################
#                           Messwerte Aufgabe 106.d                           #
###############################################################################

# Messpaare aus Spannung, Umdrehungsanzahl und Zeit.
aufgabe_d = [
	2.6		2	17.78
	8.6		10	18.16
	11.7	16	20.25
	15.2	30	28.63
];

Delta_T = 0.1;

###############################################################################
#                           Messwerte Aufgabe 106.e                           #
###############################################################################

# Messtupel aus Motorspannung, Pendelamplitude.
stark.daten = [
	2.8		0.5
	5.0		0.6
	6.2		0.8
	7.15	1.3
	8.3		2.8
	8.8		2.1
	9.35	1.3
	11.5	0.4
	15.1	0.1
	7.85	1.9
	6.7		0.9
	8.0		2.5
	8.2		2.5
	8.3		2.7
	8.7		2.6
	8.6		2.6
];

# Messtupel aus Motorspannung, Pendelamplitude.
schwach.daten = [
	8.6		4.2
	8.4		6.2
	8.2		7.6
	8.0		4.6
	7.6		2.3
	6.7		1.2
	6.0		0.8
	3.6		0.5
	1.5		0.4
	8.3		7.2
	8.7		3.5
	8.9		2.4
	9.4		1.2
	10.0	0.75
	11.0	0.5
	13.0	0.2
];

###############################################################################
#                              Rechnungen 106.a                               #
###############################################################################

nu_0.val = mean(nu_0.list);
nu_0.err = std(nu_0.list) / sqrt(length(nu_0.list));

printf("106.a: ν_0 = %f ± %f s\n", nu_0.val, nu_0.err);

printf("\n");

###############################################################################
#                              Rechnungen 106.c                               #
###############################################################################

I1.filename = "c_1.dat";
I3.filename = "c_3.dat";
I5.filename = "c_5.dat";

c_Q.val = 0;
c_Q.err = 0;

for comp = [I1 I3 I5]
	in = comp.phi;
	n = in(:, 1);
	phi = in(:, 2);
	fehler = Delta_phi * ones(length(in(:, 1)), 1);

	list = [n phi fehler];
	save(comp.filename, "list");

	comp.steigung.val = cov(n, phi) / var(n);
	comp.steigung.err = sqrt(var(phi)) / length(phi);
	comp.K.val = exp(-comp.steigung.val);
	comp.K.err = abs(comp.K.val * (-comp.steigung.val) * comp.steigung.err);
	comp.Q.val = - pi / comp.steigung.val;
	comp.Q.err = abs(pi / comp.steigung.val**2 * comp.steigung.err);

	c_Q.val += comp.Q.val;
	c_Q.err += comp.Q.err**2;

	printf("106.c: Steigung = %f ± %f\n", comp.steigung.val, comp.steigung.err);
	printf("106.c: K = %f ± %f\n", comp.K.val, comp.K.err);
	printf("106.c: Q = %f ± %f\n", comp.Q.val, comp.Q.err);
	printf("\n");
endfor

c_Q.val /= 3;
c_Q.err /= 9;

printf("106.c: Q = %f ± %f\n", c_Q.val, c_Q.err);

printf("\n");

###############################################################################
#                              Rechnungen 106.d                               #
###############################################################################

spannungen = aufgabe_d(:, 1);
anzahlen = aufgabe_d(:, 2);
perioden = aufgabe_d(:, 3);
x.val = spannungen;
y.val = anzahlen ./ perioden;
y.err = anzahlen ./ perioden.^2 * Delta_T;
d_data = [x.val y.val y.err];
save "d.dat" d_data;

eta.val = cov(x.val, y.val) / var(x.val);
eta.err = sqrt(var(y.val)) / length(y.val);

zeta.val = mean(y.val) - eta.val * mean(x.val);
zeta.err = sqrt(meansq(x.val)) * eta.err;

printf("106.d: eta = %f ± %f\n", eta.val, eta.err);
printf("106.d: zeta = %f ± %f\n", zeta.val, zeta.err);

###############################################################################
#                              Rechnungen 106.e                               #
###############################################################################

stark.filename = "e_stark.dat";
schwach.filename = "e_schwach.dat";

for satz = [stark schwach]
	# Rechne die Motorspannung in eine Frequenz mit dem Fit aus der Aufgabe d
	# aus.
	x.val = satz.daten(:, 1) * eta.val .+ zeta.val;
	y.val = satz.daten(:, 2);
	y.err = Delta_phi * ones(length(satz.daten(:, 1)), 1);
	list = [x.val y.val y.err];
	save(satz.filename, "list");
endfor
