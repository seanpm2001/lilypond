%% DO NOT EDIT this file manually; it was automatically
%% generated from `Documentation/snippets/new/`.
%%
%% Make any changes in `Documentation/snippets/new/`,
%% then run `scripts/auxiliar/makelsr.pl --new`.
%%
%% This file is in the public domain.
%%
%% Note: this file works from version 2.25.6.

\version "2.25.13"

\header {
  lsrtags = "really-simple, vocal-music"

  texidoc = "
Fonts can be changed independently for each stanza, including the font
used for printing the stanza number.
"

  doctitle = "Changing stanza fonts"
} % begin verbatim


%{
You may have to install additional fonts.

Red Hat Fedora

  dejavu-fonts-all

Debian GNU/Linux, Ubuntu

  fonts-dejavu-core
  fonts-dejavu-extra
%}

\relative c'' {
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
  \override StanzaNumber.fonts.serif = "DejaVu Sans"
  \set stanza = #"2. "
  \override LyricText.font-family = #'typewriter
  Oh, ché -- ri, je t'aime
}
