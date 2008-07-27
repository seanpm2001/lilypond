%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.53"

\header {
  lsrtags = "rhythms"

  texidoc = "
When using multi-measure rests in a polyphonic staff, the rests will be
placed differently depending on the voice they belong to. However they
can be printed on the same staff line, using the following setting.

"
  doctitle = "Merging multi-measure rests in a polyphonic part"
} % begin verbatim
normalPos= \revert MultiMeasureRest #'staff-position

{
  <<
    {
       c''1
       R1
       c''1
       \normalPos
       R1
     }
     \\
     {
       c'1
       R1
       c'1
       \normalPos
       R1
     }
  >>
}
