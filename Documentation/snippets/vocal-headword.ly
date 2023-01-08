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
  lsrtags = "headword"

  texidoc = "
Vocal headword
"

  doctitle = "Vocal headword"
} % begin verbatim


%% http://lsr.di.unimi.it/LSR/Item?id=832
%% see also http://lilypond.org/doc/v2.18/Documentation/notation/vocal-music

% L. van Beethoven. Symphony No. 9 in D minor, op.125; Finale
% mm. 216 -- 236
% Text: F. von Schiller

\score {
  \new Staff \relative c' {
    \override Score.BarNumber.self-alignment-X = #LEFT
    \set Score.currentBarNumber = 216
    \bar ""  % make first bar number be shown
    \clef bass \key d \minor \time 3/4
    \tempo "Recitativo"
    \autoBeamOff
    r4^\markup { \small Baritono } r a
    \appoggiatura a8 e'2. ~
    e4 d8[ cis d e]
    e4 g, r8 g
    bes2 a8 e
    g4 f r
    R2.*2
    gis2 gis4
    r4 d'4. b8
    b4 gis8([ a b cis]
    e8[ d cis d)] b([ gis)]
    e8 d d4 fis8([ e)]
    d4 cis r
    \key d \major
    r4 r a'
    d4.( e8[ fis e)]
    e([ d)] d([ cis d a)]
    g8([ fis)] fis([ e d c)]
    c8([ b)] g'2~
    \once \override Script.outside-staff-priority = #1 % put fermata closer to staff
    g4.\fermata ^\markup { \small \italic "ad libitum" } e8[ cis!] d
    d8 a a4 r \bar "||"

    % \time 4/4 \tempo "Allegro assai"
    % R1
    % e''4^\f d r2
    % R1
    % e4( ^\f d2) a8([ g)]
  }
  \addlyrics {
    O Freun -- _ _ de, nicht die -- _ se Tö -- ne!
    Son -- dern laßt uns an -- _ ge -- neh -- me -- re an -- stim -- men,
    und freu -- _ _ _ _ _ _ _ den -- vol -- le -- re!
    % Freu -- de, Freu -- de,__
  }
}
