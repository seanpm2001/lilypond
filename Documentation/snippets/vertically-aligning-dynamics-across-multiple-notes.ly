%% DO NOT EDIT this file manually; it was automatically
%% generated from the LilyPond Snippet Repository
%% (http://lsr.di.unimi.it).
%%
%% Make any changes in the LSR itself, or in
%% `Documentation/snippets/new/`, then run
%% `scripts/auxiliar/makelsr.pl`.
%%
%% This file is in the public domain.

\version "2.25.1"

\header {
  lsrtags = "expressive-marks"

  texidoc = "
Dynamics that occur at, begin on, or end on the same note will be
vertically aligned.  To ensure that dynamics are aligned when they do
not occur on the same note, increase the @code{staff-padding} property
of the @code{DynamicLineSpanner} object.
"

  doctitle = "Vertically aligning dynamics across multiple notes"
} % begin verbatim


\relative c' {
  \override DynamicLineSpanner.staff-padding = #4
  c2\p f\mf
  g2\< b4\> c\!
}
