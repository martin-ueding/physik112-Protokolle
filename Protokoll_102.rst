####################################
Versuch 102 – Elastizitätskonstanten
####################################

.. contents::
    :local:

Einleitung
==========

In diesem Versuch wollen wir das Elastizitätsmodul verschiedener Materialien
bestimmen. Dabei benutzen wir einmal die Balkenbiegung, einmal die Knickung und
einmal Torsion.

Theorie
=======

Balkenbiegung
-------------

.. note::

    Bild vom Balken einfügen

Die Krümmung eines Balkens lässt sich durch den Kreisradius :math:`\rho`
annähern. Die Dehnung können wir mit der dimensionslosen Konstante beschreiben:

.. math:: \epsilon := \frac{\Delta l}{l_0}

Bei einem Balken, der im Ursprung eingespannt ist, muss für die Kurve der
neutrale Faser gelten:

.. math::

    \omega(0) = 0

    \frac{\mathrm d}{\mathrm dz} \omega(0) = 0

Außerdem muss gelten:

.. math:: \epsilon = \frac y \rho

Eine Zug- oder Druckspannung pro Fläche ist definiert als:

.. math:: \sigma = E \epsilon = E \frac y \rho

Das Drehmoment im Querschnitt ist gegeben durch:

.. math:: M = \iint \sigma y \, \mathrm dy \, \mathrm dx = \frac E \rho \iint y^2 \, \mathrm dy \, \mathrm dx = \frac{EI}\rho

Dabei ist das Flächenträgheitsmoment:

.. math:: I = \iint y^2 \, \mathrm dy \, \mathrm dx

Die Differentialgleichung der elastischen Linie ist gegeben durch:

.. math:: \frac 1{\rho(z)} = \frac{\omega''(z)}{\left(1 + \omega'^2(z) \right)^{\frac 32}}

Für kleine Biegungen gilt :math:`\omega'^2(z) \ll 1`. Das Drehmoment ist gegeben
durch:

.. math:: M(z) = \frac{EI}{\rho(z)}

Somit ergibt sich für die Differentialgleichung:

.. math:: \omega''(z) = \frac{M(z)}{EI}

Für einseitig eingespannte und am Ende durch eine Kraft :math:`F` belasteten
Balken der Länge :math:`L` gilt:

.. math::

    M(z) = F(l-z)

    \frac{\mathrm d^2 \omega}{\mathrm dz^2} = \frac{F(l-z)}{EI}

    \omega(z) = \frac F{EI} \left( \frac{lz^2}2 - \frac{lz^3}6 \right)

Dabei ist die maximale Auslenkung: :math:`c = \omega(l) = \frac F{EI} \frac{l^3}3`

Für einen beidseitig aufgelegten, in der Mitte belasteten Balken gilt, wenn man
:math:`\frac F2` und :math:`\frac l2` einsetzt:

.. math:: C = \frac F{EI} \frac{l^3}{48}

Torsionspendel
--------------

.. note::

    Zeichnung vom Drahtquerschnitt einfügen

Aus der Drehmomentgleichung :math:`\Theta \ddot \phi + D \phi = 0` ergibt sich:

.. math:: T^2 = 4 \pi^2 \frac \Theta D

Wobei :math:`\Theta = \Theta_\mathrm{Stange} + 2 \left( \Theta_\mathrm{Scheibe} + m a^2 \right)`.

Somit ergibt sich:

.. math::

    T^2 = \frac{4 \pi^2 ( \Theta_\mathrm{Stange} + 2 \Theta_\mathrm{Scheibe} )}{D}
    + \frac{8 \pi^2 m}{D} a^2

Der Zusammengang zwischen Richtkonstante und Schubmodul ist:

.. math:: D = G \frac{\pi r^4}{2l}

Da oberhalb und unterhalb gleich viel Draht ist, addieren sich die beiden
Richtmomente einfach auf:

.. math:: D = G \frac{\pi r^4}{l}

Aufgaben
========

Aufgabe 1.A
-----------

    Welches Flächenträgheitsmoment hat ein rechteckiger Balken der Breite
    :math:`b` und der Höhe :math:`h`?

Über das Rechteck integriere ich:

.. math::

    I = \int_{-\frac b2}^{\frac b2} \int_{-\frac h2}^{\frac h2} y^2 \, \mathrm
    dy \, \mathrm dx

    I = \frac{b h^3}{12}

Aufgabe 1.B
-----------

Für einen runden Stab funktioniert es ähnlich. Hier sind allerdings die Grenzen
für das Integral anders.

.. math::

    I = \int_{r}^{r} \int_{-\sqrt{r^2 - x^2}}^{\sqrt{r^2 - x^2}} y^2 \, \mathrm
    dy \, \mathrm dx

    I = \frac 14 \pi r^4

Aufbau
======

Im ersten Versuchsteil legen wir drei verschiedene Stäbe auf zwei Haltepunkte,
die die Stäbe an ihren Enden halten. In der Mitte belasten wir diese mit einer
Kraft.

.. note:: Zeichung einfügen

Im zweiten Teil spannen wir verschiedene Stäbe nacheinander in eine Bank ein
und belasten sie axial mit einer Kraft. Die seitliche Auslenkung messen wir mit
einer Messschraube.

.. note:: Zeichung einfügen

Im dritten Teil benutzen wir ein Torsionspendel.

.. note:: Zeichung einfügen

Durchführung
============

Abmessungen
-----------

Im ersten Versuchsteil messen wir die Breite und Dicke der Stäbe.

=========   ==========  =========   =======
Metall      Breite [m]  Dicke [m]   Stabtyp
=========   ==========  =========   =======
Aluminium   –           –           –
Kupfer      –           –           –
Stahl       –           –           –
PVC         –           –           –
GFK         –           –           –
=========   ==========  =========   =======

Dabei ist der Fehler für Breite und Dicke jeweils:

Diese Messungen werte ich in im Abschnitt Flächenträgheitsmomente_ aus.

Aufgabe 1.a (Durchführung)
--------------------------

Wir legen nacheinander den Aluminum-, Kupfer- und Stahlstab auf die Haltepunkte
und belasten ihn der Mitte. Für jeden Stab messen wir für mindestens 7 Lasten
die Durchbiegung :math:`c` mit Hilfe eines Messkeils.

Dabei ist der Fehler in der Last:

Und der Fehler in der Durchbiegung:

Aluminium
~~~~~~~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

Kupfer
~~~~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

Stahl
~~~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

Aufgabe 1.b (Durchführung)
--------------------------

Die Stäbe aus Stahl, PVC und GFK spannen wir längs ein und messen die seitliche
Auslenkung der Mitte mit einer Messschraube.

Stahl
~~~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

PVC
~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

GFK
~~~

========    ================
Last [N]    Durchbiegung [m]
========    ================
–           –
–           –
–           –
–           –
–           –
–           –
–           –
========    ================

Aufgabe 2.a (Durchführung)
--------------------------

Wir stellen das Torsionspendel so ein, dass der Draht ober- und unterhalb
gleich lang ist. Außerdem richtigen wir den Schwingkörper horizontal aus.

Dann lenken wir das Pendel eine Viertelumdrehung aus und lassen es schwingen.
Dabei messen wir für jede der vier Gewichtskonfigurationen die Dauer für eine
unterschiedliche Anzahl Perioden.

=======     ========    =====
Abstand     Perioden    Dauer
=======     ========    =====
25 mm       3           –
25 mm       4           –
25 mm       6           –
25 mm       8           –
25 mm       10          –
50 mm       3           –
50 mm       4           –
50 mm       6           –
50 mm       8           –
50 mm       10          –
75 mm       3           –
75 mm       4           –
75 mm       6           –
75 mm       8           –
75 mm       10          –
100 mm      3           –
100 mm      4           –
100 mm      6           –
100 mm      8           –
100 mm      10          –
=======     ========    =====

Nun entfernen wir die Zusatzgewichte und messen erneut die Periodendauern.

========    =====
Perioden    Dauer
========    =====
5           –
6           –
7           –
8           –
9           –
10          –
11          –
12          –
13          –
14          –
15          –
========    =====

Bei all diesen Messungen können wir die Zeit auf zwei Zehntelsekunden genau
messen.

Außerdem bestimmen wir den Durchmesser des Stahldrahtes mit einer
Bügelmessschraube auf:

.. math:: d = (\checkmark \pm \checkmark) \, \mathrm{m}

Auswertung
==========

Flächenträgheitsmomente
-----------------------

Zuerst rechne ich die bestimmten Abmessungen für die Stäbe aus dem Abschnitt
Abmessungen_ in Flächenträgheitsmomente um. Dabei benutze ich die in `Aufgabe
1.B`_ hergeleiteten Formeln für runde und rechteckige Querschnitte.

=========   ===========================  ==================================
Metall      :math:`I \, \mathrm{[m^4]}`  :math:`\Delta I \, \mathrm{[m^4]}`
=========   ===========================  ==================================
Aluminium   –                            –
Kupfer      –                            –
Stahl       –                            –
PVC         –                            –
GFK         –                            –
=========   ===========================  ==================================

Aufgabe 1.a (Auswertung)
------------------------

Hier werte ich die in `Aufgabe 1.a (Durchführung)`_ gemessenen Daten aus.

Dazu plotte ich :math:`c` gegen :math:`F`. An diese Messdaten fitte ich eine
Gerade, deren Steigung ich bestimme.

.. note::

    Plot einfügen

Dabei gilt folgende Beziehung für :math:`F` und :math:`c`:

.. math:: c = \frac{1}{EI} \frac{l^3}{48} \cdot F

Dabei ist :math:`l` bekannt. Aus der Form der Stäbe ergibt sich auch :math:`I`.
Aus der Steigung kann ich dann :math:`\mu := \frac{l^3}{EI}` sowie dessen
Fehler bestimmen.

=========   ===========   ==================
Stab        :math:`\mu`   :math:`\Delta \mu`
=========   ===========   ==================
Aluminium   –             –
Kupfer      –             –
Stahl       –             –
=========   ===========   ==================

Daraus kann ich :math:`E` bestimmen:

.. math:: E = \frac{l^3}{\mu I}

Der Fehler für :math:`E` ist aus dem Fehler von :math:`\mu`, :math:`I` und
:math:`l` zu bestimmen:

.. math::

    \Delta E = \sqrt{
    \left( \frac{3l^2}{\mu I} \Delta l \right)^2
    + \left( -\frac{l^3}{\mu^2 I} \Delta \mu \right)^2
      + \left( - \frac{l^3}{\mu I^2} \Delta I \right)^2
    }

=========   =========   ================
Stab        :math:`E`   :math:`\Delta E`
=========   =========   ================
Aluminium   –           –
Kupfer      –           –
Stahl       –           –
=========   =========   ================

Aufgabe 1.b (Auswertung)
------------------------

Hier werte ich die Daten, die wir in `Aufgabe 1.b (Durchführung)`_ gemessen
haben, aus. Dabei plotte ich die Auslenkung gegen die Kraft. Um die
Belastungsgrenze wird die Auslenkung stark ansteigen. Aus dem Plots kann ich
diese Knicklast einfach als senkrechte Asymptote ablesen. Den Fehler schätze
ich.

.. note::

    Plot einfügen

=====   =========   ================
Stab    :math:`F`   :math:`\Delta F`
=====   =========   ================
Stahl   –           –
PVC     –           –
GFK     –           –
=====   =========   ================

Aufgabe 1.c (Auswertung)
------------------------

Die in `Aufgabe 1.b (Auswertung)`_ bestimmten Knicklasten :math:`F` rechne ich
hier mit folgender Formel in Flächenträgheitsmomente um. Dabei benutze ich
folgende Formel:

.. math:: E = \frac{l^2}{I \pi^2} F

Dabei ist der Fehler gegeben durch die Ableitungen der obrigen Funktion nach
den einzelnen Variablen:

.. math::

    \Delta E = \sqrt{
    \left( \frac{2l}{I \pi^2} F \Delta l \right)^2
    + \left( \frac{-l^2}{I^2 \pi^2} \Delta I \right)^2
    + \left( \frac{l^2}{I \pi^2} \Delta F \right)^2
    }

Für die verschiedenen Stäbe erhalte ich als Elastizitätsmodul:

=====   =========   ================
Stab    :math:`E`   :math:`\Delta E`
=====   =========   ================
Stahl   –           –
PVC     –           –
GFK     –           –
=====   =========   ================

Aufgabe 2.a (Auswertung)
------------------------

Hier werte ich die Daten, die wir in `Aufgabe 2.a (Durchführung)`_ gemessen
haben, aus.

Dabei sollen wir :math:`T^2` gegen :math:`a^2` plotten und mit einem linearen
Modell fitten:

.. math:: T^2 = \frac{4 \pi^2 ( \Theta_\mathrm{Stange} + 2 \Theta_\mathrm{Scheibe} )}{D} + \frac{8 \pi^2 m}{D} a^2

Beim Fitten würden allerdings die Abstände nicht richtig minimiert, da diese
durch das linearisieren falsch gewichtet würden. Daher fitte ich die Messdaten
direkt mit der Funktion:

.. math::

    T = \sqrt{
    \underbrace{\frac{4 \pi^2 ( \Theta_\mathrm{Stange} + 2 \Theta_\mathrm{Scheibe} )}{D}}_\alpha
    + \underbrace{\frac{8 \pi^2 m}{D}}_\beta a^2
    }

.. note::

    Plot einfügen

Als Ergebnis erhalte ich:

=====================   =
:math:`\alpha`          –
:math:`\Delta \alpha`   –
:math:`\beta`           –
:math:`\Delta \beta`    –
=====================   =

Aus den Koeffizienten kann ich dann die Richtkonstante :math:`D` bestimmen,
indem ich umstelle.

.. math:: D = \frac{8 \pi^2 m}{\beta} = \checkmark

Mit dem :math:`D` kann ich nun das Trägheitsmoment der Stangenanordnung
errechnen:

.. math:: \Theta_\mathrm{Stange} = \frac{\alpha D}{4 \pi^2} - 2 \Theta_\mathrm{Scheibe} = \checkmark


Die Fehler bestimme ich wieder durch Fehlerfortpflanzung aus den einzelnen
Fehlern.

.. math::

    \Delta D = \sqrt{
    \left( \frac{8 \pi^2}{\beta} \Delta m \right)^2
    + \left( -\frac{8 \pi^2 m}{\beta^2} \Delta \beta \right)^2
    } = \checkmark

Aufgabe 2.a (Auswertung)
------------------------

Aus dem gemessenen Durchmesser des Drahtes bestimmen wir den Radius:

.. math::

    r = \frac 12 d = \checkmark

    \Delta r = \frac 12 \Delta r = \checkmark

Aus der Richtkonstante :math:`D` bestimme ich das Schubmodul :math:`G` mit
folgender Formel:

.. math::

    G = \frac{l}{\pi r^4} D = \checkmark

Den Fehler bestimme ich mit:

.. math::

    \Delta G = \sqrt{
    \left( \frac{l}{\pi r^4} \Delta D \right)^2
    + \left( \frac{1}{\pi r^4} D \Delta l \right)^2
    + \left( - \frac{4 l}{\pi r^5} D \Delta r \right)^2
    } = \checkmark

Resultat
========

Diskussion
==========
