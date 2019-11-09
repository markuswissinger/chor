\version "2.18.2"



global = {
  \key f \major
  \time 6/8
}

#(set-global-staff-size 18)



soprano = \relative c'' {
  \global
  a4.
}

alto = \relative c' {
  \global
  f4.
  
  
}

tenor = \relative c' {
  \global
  c4.
}

bass = \relative c {
  \global
  f4.
}



choirPart = \new ChoirStaff <<
  \new Staff = "sa" \with {
    instrumentName = \markup \center-column { "Sopran" "Alt" }
  } <<
    \new Voice = "soprano" { \voiceOne \soprano }
    \new Voice = "alto" { \voiceTwo \alto }
  >>
  \new Staff = "tb" \with {
    instrumentName = \markup \center-column { "Tenor" "Bass" }
  } <<
    \clef bass
    \new Voice = "tenor" { \voiceOne \tenor }
    \new Voice = "bass" { \voiceTwo \bass }
  >>
>>

miditempo = 115

\score {
  <<
    \choirPart
  >>
  \layout { }
  \midi {
    \tempo 4=\miditempo
  }
}

\book {
  \bookOutputSuffix "Sopran"
  \score {
    <<
      \new Staff
      \new Voice {
        \soprano
      }
    >>
    \midi { \tempo 4 = \miditempo }
  }
}

\book {
  \bookOutputSuffix "Alt"
  \score {
    <<
      \new Staff
      \new Voice {
        \alto
      }
    >>
    \midi { \tempo 4 = \miditempo }
  }
}

\book {
  \bookOutputSuffix "Tenor"
  \score {
    <<
      \new Staff
      \new Voice {
        \tenor
      }
    >>
    \midi { \tempo 4 = \miditempo }
  }
}

\book {
  \bookOutputSuffix "Bass"
  \score {
    <<
      \new Staff
      \new Voice {
        \bass
      }
    >>
    \midi { \tempo 4 = \miditempo }
  }
}