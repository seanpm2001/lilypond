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
  lsrtags = "editorial-annotations, really-cool, staff-notation, workaround"

  texidoc = "
For educational purposes, a staff line can be thickened (e.g., the
middle line, or to emphasize the line of the G clef).  This can be
achieved by adding extra lines very close to the line that should be
emphasized, using the @code{line-positions} property of the
@code{StaffSymbol} object.
"

  doctitle = "Making some staff lines thicker than the others"
} % begin verbatim


{
  \override Staff.StaffSymbol.line-positions =
    #'(-4 -2 -0.2 0 0.2 2 4)
  d'4 e' f' g'
}
