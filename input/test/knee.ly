\version "1.7.18"
% candidate for regression?  -gp
\header { texidoc = ""}
\score{
	\notes\relative c'{
	        \property Voice.Beam \override #'auto-knee-gap = ##f
		 c16-[ \stemDown c'' \stemBoth c,, d]
		\stemDown  d''-[ a \stemBoth c,, g,]
		\stemUp  g-[ c' \stemBoth a'' d']
	}
}
%% new-chords-done %%
