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
  lsrtags = "fretted-strings, specific-notation, tweaks-and-overrides"

  texidoc = "
If you want to move the position of a fret diagram, for example, to
avoid collision, or to place it between two notes, you have various
possibilities:

1) modify #'padding or #'extra-offset values (as shown in the first
snippet)

2) you can add an invisible voice and attach the fret diagrams to the
invisible notes in that voice (as shown in the second example).

If you need to move the fret according with a rythmic position inside
the bar (in the example, the third beat of the measure) the second
example is better, because the fret is aligned with the third beat
itself.
"

  doctitle = "How to change fret diagram position"
} % begin verbatim


harmonies = \chordmode
{
  a8:13
% THE FOLLOWING IS THE COMMAND TO MOVE THE CHORD NAME
  \once \override ChordNames.ChordName.extra-offset = #'(10 . 0)
  b8:13 s2.
% THIS LINE IS THE SECOND METHOD
    s4 s4  b4:13
}

\score
{
  <<
    \new ChordNames \harmonies
    \new Staff
    {a8^\markup { \fret-diagram  "6-x;5-0;4-2;3-0;2-0;1-2;"  }
% THE FOLLOWING IS THE COMMAND TO MOVE THE FRET DIAGRAM
     \once \override TextScript.extra-offset = #'(10 . 0)
     b4.~^\markup { \fret-diagram  "6-x;5-2;4-4;3-2;2-2;1-4;"  } b4. a8\break
% HERE IS THE SECOND METHOD
     <<
       { a8 b4.~ b4. a8}
       { s4 s4 s4^\markup { \fret-diagram  "6-x;5-2;4-4;3-2;2-2;1-4;"  }
       }
     >>
   }
  >>
}
