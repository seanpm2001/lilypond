%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "repeats"

%% Translation of GIT committish: 5a7301fc350ffc3ab5bd3a2084c91666c9e9a549
  texidoces = "
Las repeticiones de compases completos mayores de dos repeticiones
pueden llevar un contador si se activa la propiedad adecuada, como se
ve en este ejemplo:

"
  doctitlees = "Percent repeat counter"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Ganztaktwiederholungen mit mehr als zwei Wiederholungen erhalten einen
Zähler, wenn man die entsprechende Eigenschaft einsetzt:

"
  doctitlede = "Prozent-Wiederholungen zählen"
%% Translation of GIT committish: a5bde6d51a5c88e952d95ae36c61a5efc22ba441
  texidocfr = "
Les répétitions de plus de 2 mesures sont surmontées d'un compteur,
si l'on active la propriété @code{countPercentRepeats} comme le montre
l'exemple suivant :

"
  doctitlefr = "Compteur de répétition en pourcent"


  texidoc = "
Measure repeats of more than two repeats can get a counter when the
convenient property is switched, as shown in this example:

"
  doctitle = "Percent repeat counter"
} % begin verbatim

\relative c'' {
  \set countPercentRepeats = ##t
  \repeat percent 4 { c1 }
}

