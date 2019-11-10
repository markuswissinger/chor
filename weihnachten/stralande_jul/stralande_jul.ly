\version "2.18.2"



global = {
  \key f \major
  \time 6/8
}

#(set-global-staff-size 18)



soprano = \relative c'' {
  \global
  a4. g |   a8. bes16 c8 g4. |   a8 bes c c4 bes8 |   bes4. a | 
  d8.( d16) d8 c g c | d8.( e16) d8 c4. | bes8. bes16 bes8 a e a | bes8. c16 bes8 a4. | 
  f8. f16 f8 c'8. c16 c8 | a4 a8 f4. | g8. f16 g8 a8.( g16) f8 | g8.( f16) g8 a4. | 
  a4. g4. | a8. bes16 c8 g4. | a8 bes c c4 bes8 | g4. f4. 
}

alto = \relative c' {
  \global
  f4. f4. | f8. f16 f8 f4. | f8 f f f4 f8 | f4( g8) f4. |
  f8.( f16) bes8 g e g | bes8.( bes16) bes8 g4. | g8. g16 f8 e cis e | g8. g16 f8 e4. |
  f8. e16 d8 f8. e16 f8 | e 4 e8 d4. d8. d16 e8 f8.( e16) d8 | d8.( d16) e8 e4. |
  f4. f4. | f8. f16 f8 f4. | f8 f f f4 f8 | e4. c
  
  
}

tenor = \relative c' {
  \global
  c4. des4. | c8. c16 c8 des4. | c8 d e e4 d8 | d4( des8) c4. |
  bes8.( bes16) f'8 e c e | f8.( g16) f8 e4. | d8. e16 d8 cis a cis | d8. e16 d8 cis4. |
  d8. c16 bes8 c8. bes 16 c8 |c4 c8 bes4. | bes8. bes16 bes8 e8.( bes16) a8 | d8.( d16) d8 cis4. |
  c4. des4. | c8. c16 c8 des 4. | c8 d e e4 d8 | d( c bes) a4.
}

bass = \relative c {
  \global
  f4. bes4. | f8. g16 a8 bes4. | f8 f f f4 f8 | f4. f4. |
  bes8.( bes16) bes8 c c c | bes8.( bes16) bes8 c4. | g8. g16 g8 a a a | g8. g16 g8 a4. |
  d8. c16 bes8 a8. g16 a8 |c4 c8 bes4. | bes8. a16 g8 d8.( d16) d8 | bes'8. bes16 bes8 a4. |
  f4. bes4. | f8. g16 a8 bes4. | f8 f f a,4 bes8 | c4. <<c4. f,4.>>
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