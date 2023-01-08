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
  lsrtags = "rhythms, tweaks-and-overrides"

  texidoc = "
Whichever option you choose for controlling the tuplet bracket
visibility, it will show or hide the tuplet bracket irrespectively
of tuplet bracket placement (stem side or note head side).
However, when placing the tuplet bracket on the note head side some
authors recommend always printing the tuplet bracket.  The option
@code{visible-over-note-heads} can be used to achieve this.
"

  doctitle = "Printing tuplet brackets on the note head side"
} % begin verbatim


music = \relative c'' {
  \tupletNeutral \tuplet 3/2 { c16[ d e } f8]
  \tupletUp \tuplet 3/2 { c8 d e }
}

\new Voice {
  \relative c' {
    \time 2/4
    \override TupletBracket.visible-over-note-heads = ##t
    \override Score.TextMark.non-musical = ##f
    { \textMark \markup "default" \music }
    \override TupletBracket.bracket-visibility = #'if-no-beam
    { \textMark \markup \typewriter "'if-no-beam" \music }
  }
}
