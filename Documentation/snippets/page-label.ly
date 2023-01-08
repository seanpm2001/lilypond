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
  lsrtags = "spacing"

  texidoc = "
Page labels may be placed inside music or at top-level, and referred to
in markups.
"

  doctitle = "Page label"
} % begin verbatim


\label license
\markup "This snippet is available under the Creative Commons
Public Domain Dedication license."

{
  \repeat volta 2 {
    \label startRepeat
    \repeat unfold 20 { c'2 2 }
    \pageBreak
    2 2
  }
  \textEndMark \markup {
    \with-link #'startRepeat \line {
      To page \page-ref #'startRepeat "0" "?"
    }
  }
}

\markup {
  See page \page-ref #'license "0" "?" for
  licensing information.
}
