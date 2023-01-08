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
  lsrtags = "rhythms, workaround"

  texidoc = "
By default, appoggiaturas and grace notes that occur on the first beat
of a measure are printed after the bar line.  They can however be
printed before, simply by adding an invisible BarLine and then the
visible one, as demonstrated here.
"

  doctitle = "Appoggiatura or grace note before a bar line"
} % begin verbatim


{
  R1
  %% default
  \appoggiatura d''8 c''4 r2.
  %% cheated
  \appoggiatura { \bar "" d''8 \bar "|" } c''4 r2.
}
