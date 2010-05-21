%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks"

%% Translation of GIT committish: d2119a9e5e951c6ae850322f41444ac98d1ed492
  texidoces = "
Se pueden crear arpegios que se cruzan entre pentagramas dentro de
contextos distintos a @code{GrandStaff}, @code{PianoStaff} y
@code{StaffGroup} si se incluye el grabador
@code{Span_arpeggio_engraver} en el contexto de @code{Score}.

"
  doctitlees = "Creación de arpegios que se cruzan entre pentagramas dentro de otros contextos"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
 texidocde = "
In einem Klaviersystem (@code{PianoStaff}) ist es möglich, ein Arpeggio
zwischen beiden Systemen zu verbinden, indem die
@code{PianoStaff.connectArpeggios}-Eigenschaft gesetzt wird.


"
  doctitlede = "Arpeggio zwischen Systemen in einem Klaviersystem erstellen"
%% Translation of GIT committish: 217cd2b9de6e783f2a5c8a42be9c70a82195ad20
  texidocfr = "
Il est possible de distribuer un arpège sur plusieurs portées d'un
système autre que le @code{PianoStaff} dès lors que vous incluez le
@code{Span_arpeggio_engraver} au contexte @code{Score}.

"
  doctitlefr = "Arpège distribué pour un autre contexte que le piano"


  texidoc = "
Cross-staff arpeggios can be created in contexts other than
@code{GrandStaff}, @code{PianoStaff} and @code{StaffGroup} if the
@code{Span_arpeggio_engraver} is included in the @code{Score} context.

"
  doctitle = "Creating cross-staff arpeggios in other contexts"
} % begin verbatim

\score {
  \new ChoirStaff {
    \set Score.connectArpeggios = ##t
    <<
      \new Voice \relative c' {
        <c e>2\arpeggio
        <d f>2\arpeggio
        <c e>1\arpeggio
      }
      \new Voice \relative c {
        \clef bass
        <c g'>2\arpeggio
        <b g'>2\arpeggio
        <c g'>1\arpeggio
      }
    >>
  }
  \layout {
    \context {
      \Score
      \consists "Span_arpeggio_engraver"
    }
  }
}

