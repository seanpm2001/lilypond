%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks"

%% Translation of GIT committish: 5a7301fc350ffc3ab5bd3a2084c91666c9e9a549
  texidoces = "
Algunos compositores escriben dos ligaduras cuando quieren acordes
legato.  Esto se puede conseguir estableciendo @code{doubleSlurs}.

"
  doctitlees = "Utilizar ligaduras dobles para acordes legato"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
texidocde = "
Einige Komponisten schreiben doppelte Bögen, wenn Legato-Akkorde notiert
werden.  Das kann mit der Eigenschaft @code{doubleSlurs} erreicht werden.

"
  doctitlede = "Doppelte Bögen für Legato-Akkorde benutzen"
%% Translation of GIT committish: 217cd2b9de6e783f2a5c8a42be9c70a82195ad20
  texidocfr = "
Certains auteurs utilisent deux liaisons lorsqu'ils veulent
lier des accords. Dans LilyPond, il faut pour cela activer
la propriété @code{doubleSlurs} :

"
  doctitlefr = "Accords et double liaison d'articulation"


  texidoc = "
Some composers write two slurs when they want legato chords.  This can
be achieved by setting @code{doubleSlurs}.

"
  doctitle = "Using double slurs for legato chords"
} % begin verbatim

\relative c' {
  \set doubleSlurs = ##t
  <c e>4( <d f> <c e> <d f>)
}

