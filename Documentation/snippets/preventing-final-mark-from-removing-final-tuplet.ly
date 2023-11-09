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
The addition of a final @code{mark} can result in the loss of a final
tuplet marking.  This can be overcome by setting
@code{TupletBracket.full-length-to-extent} to @code{false}.
"

  doctitle = "Preventing final mark from removing final tuplet"
} % begin verbatim


% due to issue 2362 a long mark such as
%   \textEndMark "Composed Feb 2007 - Feb 2008"
% cannot be used here.

\paper { tagline = ##f }

\new Staff {
   \set tupletFullLength = ##t
   \time 1/8
   \tuplet 3/2 8 { c'16 c' c' c' c' c' c' c' c' }
   \tweak direction #DOWN \textEndMark "1234"
}

\new Staff {
  \set tupletFullLength = ##t
  \override TupletBracket.full-length-to-extent = ##f

  \time 1/8
   \tuplet 3/2 8 { c'16 c' c' c' c' c' c' c' c' }
   \tweak direction #DOWN \textEndMark "1234"
}
