\version "2.18.0"

\header {
  lsrtags = "really-simple, vocal-music"

  texidoc = "
Fonts can be changed independently for each stanza, including the font
used for printing the stanza number.

"
  doctitle = "Changing stanza fonts"
}

\new Voice {
  \time 3/4
  g2 e4
  a2 f4
  g2.
}
\addlyrics {
  \set stanza = #"1. "
  Hi, my name is Bert.
}
\addlyrics {
  \override StanzaNumber.font-name = #"DejaVu Sans"
  \set stanza = #"2. "
  \override LyricText.font-family = #'typewriter
  Oh, ché -- ri, je t'aime
}
