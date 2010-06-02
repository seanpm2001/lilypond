%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "editorial-annotations, chords, keyboards, fretted-strings"

%% Translation of GIT committish: 5a7301fc350ffc3ab5bd3a2084c91666c9e9a549
  texidoces = "
Se puede controlar con precisión la colocación de los números de
digitación.  Para que se tenga en cuenta la orientación de las
digitaciones, se debe utilizar una construcción de acorde <> aunque
sea una sola nota.


"
  doctitlees = "Controlar la colocación de las digitaciones de acordes"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Die Position von Fingersatzzahlen kann exakt kontrolliert werden.

"
  doctitlede = "Position von Fingersatz in Akkorden kontrollieren"
%% Translation of GIT committish: ac6297e4fa174ac5759cc450ad085c2fac9ba00b

  texidocfr = "
Le positionnement des doigtés peut être contrôlé de manière très précise.

"
  doctitlefr = "Conrôle du positionnement des doigtés"


  texidoc = "
The placement of fingering numbers can be controlled precisely. For
fingering orientation to apply, you must use a chord construct <> even
if it is a single note.

"
  doctitle = "Controlling the placement of chord fingerings"
} % begin verbatim

\relative c' {
  \set fingeringOrientations = #'(left)
  <c-1 e-3 a-5>4
  \set fingeringOrientations = #'(down)
  <c-1 e-3 a-5>4
  \set fingeringOrientations = #'(down right up)
  <c-1 e-3 a-5>4
  \set fingeringOrientations = #'(up)
  <c-1 e-3 a-5>4
  \set fingeringOrientations = #'(left)
  <c-1>2
  \set fingeringOrientations = #'(down)
  <e-3>2
}


