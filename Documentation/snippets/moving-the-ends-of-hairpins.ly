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
The ends of hairpins may be offset by setting the @code{shorten-pair}
property of the @code{Hairpin} object.  Positive values move endpoints
to the right, negative to the left.  Unlike the @code{minimum-length}
property, this property only affects the appearance of the hairpin; it
does not adjust horizontal spacing (including the position of bounding
dynamics).  This method is thus suitable for fine-tuning a hairpin
within its allotted space.
"

  doctitle = "Moving the ends of hairpins"
} % begin verbatim


{
  c'1~\<
  c'2~ c'\!
  \once \override Hairpin.shorten-pair = #'(2 . 2)
  c'1~\<
  c'2~ c'\!
  \once \override Hairpin.shorten-pair = #'(-2 . -2)
  c'1~\<
  c'2~ c'\!
  c'1~\p-\tweak shorten-pair #'(2 . 0)\<
  c'2~ c'\ffff
}
