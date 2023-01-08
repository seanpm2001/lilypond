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
  lsrtags = "editorial-annotations, scheme-language, tweaks-and-overrides"

  texidoc = "
The @code{\\circle} markup command draws circles around various
objects, for example fingering indications.  For other objects,
specific tweaks may be required: this example demonstrates two
strategies for rehearsal marks and measure numbers.
"

  doctitle = "Drawing circles around various objects"
} % begin verbatim


\relative c' {
  c1
  \set Score.rehearsalMarkFormatter =
    #(lambda (mark context)
             (make-circle-markup (format-mark-numbers mark context)))
  \mark \default

  c2 d^\markup {
    \override #'(thickness . 3) {
      \circle \finger 2
    }
  }
  \override Score.BarNumber.break-visibility = #all-visible
  \override Score.BarNumber.stencil =
    #(make-stencil-circler 0.1 0.25 ly:text-interface::print)
}
