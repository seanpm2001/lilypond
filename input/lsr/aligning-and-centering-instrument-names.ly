%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.52"

\header {
  lsrtags = "text, paper-and-layout, titles"

  texidoces = "
Los nombres de instrumento se imprimen generalmente a la izquierda de
los pentagramas.  Para alinear los nombres de varios instrumentos
distintos, sitúelos dentro de un bloque @code{\markup} y utilice una
de las siguientes posiblidades:

*
    Nombres de instrumento alineados por la derecha: es el
    comportamiento predeterminado
  
*
    Nombres de instrumento centrados: la utilización de la instrucción
    @code{\hcenter-in #n} sitúa los nombres de instrumento dentro de
    un rectángulo separado, donde @code{n} es la anchura del
    rectángulo
  
* 
    Nombres de instrumento alineados por la izquierda: los nombres se
    imprimen en la parte superior de un rectángulo vacío, utilizando
    la instrucción @code{\combine} con un objeto @code{\hspace #n}.

"
  doctitlees = "Alinear y centrar los nombres de instrumento"

  texidoc = "
Instrument names are generally printed to the left of the staves. To
align the names of several different intruments, put them in a
@code{\\markup} block and use one of the following possibilites:

* 
    Right-aligned instrument names: this is the default behavior
  
* 
    Center-aligned instrument names: using the @code{\\hcenter-in #n}
command
    places the instrument names inside a padded box, with @code{n} being
the width
    of the box
  
* 
    Left-aligned instrument names: the names are printed on top of an
    empty box, using the @code{\\combine} command
    with an @code{\\hspace #n} object.
  


"
  doctitle = "Aligning and centering instrument names"
} % begin verbatim
\paper {
  indent = #0
  left-margin = #30
  line-width = #160
}

\new StaffGroup \relative c' <<
  \new Staff {
    \set Staff.instrumentName = #"Piccolo"
    c1^"default" | c \break
    \set Staff.instrumentName = \markup { \hcenter-in #10 Piccolo }
    c1^"centered" | c \break
    \set Staff.instrumentName = \markup { \combine \hspace #8 Piccolo }
    c1^"left-aligned" | c
  } 
  \new Staff {
    \set Staff.instrumentName = #"Flute"
    c1 | c \break
    \set Staff.instrumentName = \markup { \hcenter-in #10 Flute }
    c1 | c \break
    \set Staff.instrumentName = \markup { \combine \hspace #8 Flute }
    c1 | c
  }
>>
