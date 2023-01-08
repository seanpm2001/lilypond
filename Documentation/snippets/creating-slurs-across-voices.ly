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
  lsrtags = "connecting-notes, expressive-marks, keyboards, real-music, unfretted-strings"

  texidoc = "
In some situations, it may be necessary to create slurs between notes
from different voices. The solution is to add invisible notes to one of
the voices, using @code{\\hideNotes}.

This example is measure 235 of the Ciaconna from Bach's 2nd Partita for
solo violin, BWV 1004.
"

  doctitle = "Creating slurs across voices"
} % begin verbatim


\relative c' {
  <<
    {
      d16( a') s a s a[ s a] s a[ s a]
    }
    \\
    {
      \slurUp
      bes,16[ s e](
      \hideNotes a)
      \unHideNotes f[(
      \hideNotes a)
      \unHideNotes fis](
      \hideNotes a)
      \unHideNotes g[(
      \hideNotes a)
      \unHideNotes gis](
      \hideNotes a)
    }
  >>
}
