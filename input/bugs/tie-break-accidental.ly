
\header {
texidoc = "First and second bes (tied across line break)
should get an accidental, but others should not";
}

\score {
  \notes {
    bes1 ~ | \break
    bes2 ~ bes4 ~ bes4 ~ | bes1
    \key  f\major;
    bes1 ~|bes2 b ~|b ~ b ~|b1
  }
  \paper {
    linewidth = 40*\staffspace;
  }
}
