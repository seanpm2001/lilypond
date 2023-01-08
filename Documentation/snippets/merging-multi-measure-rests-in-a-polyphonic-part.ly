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
  lsrtags = "really-simple, rhythms, version-specific"

  texidoc = "
When using multi-measure rests in a polyphonic staff, the rests will be
placed differently depending on the voice they belong to. However they
can be printed on the same staff line, using the following setting.
"

  doctitle = "Merging multi-measure rests in a polyphonic part"
} % begin verbatim


normalPos = \revert MultiMeasureRest.direction

{
  <<
    {
      c''1
      R1
      c''1
      \normalPos
      R1
    }
    \\
    {
      c'1
      R1
      c'1
      \normalPos
      R1
    }
  >>
}
