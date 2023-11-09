%% DO NOT EDIT this file manually; it was automatically
%% generated from the LilyPond Snippet Repository
%% (http://lsr.di.unimi.it).
%%
%% Make any changes in the LSR itself, or in
%% `Documentation/snippets/new/`, then run
%% `scripts/auxiliar/makelsr.pl`.
%%
%% This file is in the public domain.

\version "2.24.0"

\header {
  lsrtags = "rhythms"

  texidoc = "
Multi-measure rests have length according to their total duration which
is under the control of @code{MultiMeasureRest.space-increment}.  Note
that the default value is @code{2.0}.
"

  doctitle = "Multi-measure rest length control"
} % begin verbatim


\relative c' {
  \compressEmptyMeasures
  R1*2 R1*4 R1*64 R1*16
  \override Staff.MultiMeasureRest.space-increment = 2.5
  R1*2 R1*4 R1*64 R1*16
}

\paper { tagline = ##f }
