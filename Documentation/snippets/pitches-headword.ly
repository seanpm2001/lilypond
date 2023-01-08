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
Piches headword
"

  doctitle = "Pitches headword"
} % begin verbatim


% L. v. Beethoven
% Piano sonata 21 - Dem Grafen von Waldstein Gewidmet
% chorale at measures 34 - 40+

\include "english.ly"

\new PianoStaff <<

  % RH Staff
  \new Staff <<

    % RH Voice 1
    \new Voice {
      \set Score.currentBarNumber = #34
      \voiceOne
      gs''2 ( ^ \markup \italic { dolce e molto ligato }
      fs''4
      e''4
      |
      ds''2
      cs''2 )
      |
      ds''2 (
      e''4
      fs''4
      |
      <gs'' e''>2
      <fs'' ds''>2 )
      |
      \oneVoice
      \clef bass
      <gs' e' b>2 (
      <fs' ds' a>4
      <e' cs' gs>4
      |
      <ds' bs fs>2
      <cs' a e>2 )
      |
      \voiceOne
      b2 %(
      cs'4
      ds'4
      |
      \clef treble
      <e' gs>4 %)
      r4 r2
    }

    % RH Voice 2
    \new Voice {
      \voiceTwo
      \override Staff.DynamicLineSpanner.staff-padding = #3
      <e'' b'>2 \p
      <ds'' a'>4
      <cs'' gs'>4
      |
      <bs' fs'>2
      e'2
      |
      <b'! a'>2 -\tweak style #'none \cresc
      b'4
      <e'' cs''>4
      |
      b'2. ( \sf \>
      a'4 )
      \clef bass
      | \break
      s1 \p
      |
      s1
      |
      <gs e>4 (
      <a fs>2. )
      |
      s4
      r4 r2
    }

  >>

  % LH Staff
  \new Staff {
    \override Staff.SustainPedalLineSpanner.staff-padding = #6
    <gs' e'>2 ( \sustainOn
    <fs' ds' b>4 \sustainOff
    <e' cs'>4
    |
    <ds' bs gs>2
    <cs' a>2 ) \sustainOn
    |
    \clef bass
    \slurDown
    <ds' b! a fs>2 ( \sustainOff
    <e' b gs>4
    <fs' cs' a>4 \sustainOn
    |
    \clef treble
    \voiceOne
    <<
      {
        <gs' e'>2
        <fs' ds'>2 )
      }
      \new Voice {
        \voiceTwo
        b1 \sustainOff
      }
    >>
    \oneVoice
    |
    %\break
    \clef bass
    <gs e>2 (
    <fs ds b,>4
    <e cs>4
    |
    <ds bs, gs,>2
    <cs a,>2 ) \sustainOn
    |
    <b,! b,,!>1 ( \sustainOff
    |
    <e e,>4 )
    r4 r2
  }
>>
