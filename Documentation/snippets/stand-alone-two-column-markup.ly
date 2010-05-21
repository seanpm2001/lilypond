%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "text"

%% Translation of GIT committish: d2119a9e5e951c6ae850322f41444ac98d1ed492
  texidoces = "
Los textos independientes se pueden disponer en varias columnas
utilizando instrucciones @code{\\markup}:

"
  doctitlees = "Elemento de marcado de texto independiente en dos columnas"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Isolierter Text kann in mehreren Spalten mit @code{\\markup}-Befehlen
angeordnet werden:

"
  doctitlede = "Isolierter Text in zwei Spalten"
%% Translation of GIT committish: 548ef200973bd3d46ea75c5498461d9e5f168334
  texidocfr = "
L'utilisation de la commande @code{\\markup} permet de distribuer un bloc
de texte indépendant sur plusieurs colonnes.

"
  doctitlefr = "Bloc de texte indépendant sur deux colonnes"


  texidoc = "
Stand-alone text may be arranged in several columns using
@code{\\markup} commands:

"
  doctitle = "Stand-alone two-column markup"
} % begin verbatim

\markup {
  \fill-line {
    \hspace #1
    \column {
      \line { O sacrum convivium }
      \line { in quo Christus sumitur, }
      \line { recolitur memoria passionis ejus, }
      \line { mens impletur gratia, }
      \line { futurae gloriae nobis pignus datur. }
      \line { Amen. }
    }
    \hspace #2
    \column {
      \line { \italic { O sacred feast } }
      \line { \italic { in which Christ is received, } }
      \line { \italic { the memory of His Passion is renewed, } }
      \line { \italic { the mind is filled with grace, } }
      \line { \italic { and a pledge of future glory is given to us. } }
      \line { \italic { Amen. } }
    }
    \hspace #1
  }
}
