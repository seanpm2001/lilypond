%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.38"

\header {
  lsrtags = "vocal-music, piano-music, template"

  texidoc = "
This template adds an automatic piano reduction to the standard SATB
vocal score demonstrated in \"Vocal ensemble template\". This
demonstrates one of the strengths of LilyPond – you can use a music
definition more than once. If you make any changes to the vocal notes
(say, tenorMusic), then the changes will also apply to the piano
reduction.

"
  doctitle = "Vocal ensemble template with automatic piano reduction"
} % begin verbatim
global = {
            \key c \major
            \time 4/4
         }
         
         sopMusic = \relative c'' {
            c4 c c8[( b)] c4
         }
         sopWords = \lyricmode {
            hi hi hi hi
         }
         
         altoMusic = \relative c' {
            e4 f d e
         }
         altoWords =\lyricmode {
            ha ha ha ha
         }
         
         tenorMusic = \relative c' {
            g4 a f g
         }
         tenorWords = \lyricmode {
            hu hu hu hu
         }
         
         bassMusic = \relative c {
            c4 c g c
         }
         bassWords = \lyricmode {
            ho ho ho ho
         }
         
         \score {
           <<
             \new ChoirStaff <<
               \new Lyrics = sopranos { s1 }
               \new Staff = women <<
                 \new Voice =
                   "sopranos" { \voiceOne << \global \sopMusic >> }
                 \new Voice =
                   "altos" { \voiceTwo << \global \altoMusic >> }
               >>
               \new Lyrics = "altos" { s1 }
               \new Lyrics = "tenors" { s1 }
               \new Staff = men <<
                 \clef bass
                 \new Voice =
                   "tenors" { \voiceOne <<\global \tenorMusic >> }
                 \new Voice =
                   "basses" { \voiceTwo <<\global \bassMusic >> }
               >>
               \new Lyrics = basses { s1 }
         
               \context Lyrics = sopranos \lyricsto sopranos \sopWords
               \context Lyrics = altos \lyricsto altos \altoWords
               \context Lyrics = tenors \lyricsto tenors \tenorWords
               \context Lyrics = basses \lyricsto basses \bassWords
             >>
           \new PianoStaff <<
             \new Staff <<
               \set Staff.printPartCombineTexts = ##f
               \partcombine
               << \global \sopMusic >>
               << \global \altoMusic >>
             >>
             \new Staff <<
               \clef bass
               \set Staff.printPartCombineTexts = ##f
               \partcombine
               << \global \tenorMusic >>
               << \global \bassMusic >>
             >>
            >>
           >>
           \layout {
             \context {
               % a little smaller so lyrics
               % can be closer to the staff
               \Staff
                 \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)
             }
           }
         }

