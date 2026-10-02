\version "2.24.0"

%% "Compared to What" - tenor sax in Bb.
%%
%% Notes are written in TENOR (written) pitch directly - there is no
%% \transpose on the staff. The chord symbols come from the shared
%% concert-pitch compared-to-what-changes.ily and are transposed
%% up a whole step in \score (\transpose bes c). For alto, swap that to
%% \transpose ees c and rewrite the lick a 5th higher.
%%
%% Only the Intro is written out: the lick in unison with the bass, at
%% the export's pitch (concert Eb4 = written F5). Everything after it is
%% slashes - solo over the changes - except the Head (65-80): the
%% vocal carries the tune there, so the sax rests, and plays only the
%% ensemble hits (75, 77, 79) as rhythm slashes. Bar layout mirrors the bass part
%% exactly so rehearsal marks and bar numbers agree.

\header {
  title = "Compared to What"
  subtitle = "Tenor Sax in B♭"
  composer = "Gene McDaniels"
  tagline = ##f
}

#(set-global-staff-size 20)
\paper {
  ragged-last-bottom = ##t
  ragged-right = ##f
}

\include "compared-to-what-changes.ily"

global = {
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 144
}

%% concert Eb Eb Db Eb Bb Db, written a major 9th up
lick = { f''8 f''8 ees''8 f''8~ f''8 c''4 ees''8 }   %% tie shows beat 3

%% time slashes - stemless, so they read as "play time", not rhythm.
%% The hits keep their stems: those ARE rhythms.
sb = {
  \improvisationOn \omit Stem
  b'4 b'4 b'4 b'4
  \undo \omit Stem \improvisationOff
}
hits = { \improvisationOn b'4. b'8~ b'4 b'4 \improvisationOff }
hitsEnd = { \improvisationOn b'4. b'8~ b'4 b'4\fermata \improvisationOff }

sax = {
  \global
  \clef treble
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "Intro" }
  \textMark \markup { \italic "With bass" }
  \repeat volta 2 { \lick \lick \lick \lick }
  \break

  \mark \markup { \bold \box "Solo" }
  \textMark \markup { \italic "Solo over the changes" }
  \repeat volta 2 {
    \sb \sb \sb \sb \break
    \sb \sb \sb \sb
  }
  \break
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \bar "||" \break

  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \bar "||" \break

  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \bar "||" \break

  \segnoMark \default
  \mark \markup { \bold \box "Build" }
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \bar "||" \break

  \mark \markup { \bold \box "Release" }
  \sb \sb \sb \sb \break    %% 61-64
  %% no \bar "||" here - it would eat the Head's repeat-start

  \repeat volta 2 {
    \mark \markup { \bold \box "Head" }
    \textMark \markup { \italic "Vocal - tacet, hits only" }
    r1 r1 r1 r1 \break                         %% 65-68
    r1 r1 r1 r1 \break                         %% 69-72
    r1 r1 \hits r1 \break                      %% 73-76
    \improvisationOn b'4 \improvisationOff r2. | r1 | \hits |   %% 77-79
    \textMark \markup { \italic "Solo break" }
    r1                                          %% 80
    %% To Coda sits on the barline after 80 (marks attach to the
    %% following bar, and at the \break it draws on this system).
    \codaMark 1
    \textEndMark \markup { \italic "To Coda" }
    \bar "||" \break

    \mark \markup { \bold \box "Solo 2" }
    \sb \sb \sb \sb \break                   %% 81-84
    \sb \sb \sb \sb \break
    \sb \sb \sb \sb \break
    \sb \sb \sb \sb                           %% 93-96
  }
  \textEndMark \markup { \italic "Last time D.S. al Coda" }
  \break

  %% ---- Coda: 2-bar vamp + 1st ending; 2nd ending = bars 75-79 ----
  %% begin-of-line-visible puts the coda sign at the START of this
  %% system rather than the end of the previous one.
  \once \override Score.CodaMark.break-visibility = #begin-of-line-visible
  \codaMark 1
  \mark \markup { \bold \box "Coda" }
  \textMark \markup { \italic "Vamp - repeat as desired" }
  \repeat volta 2 { \sb \sb }                          %% 97-98
  \alternative {
    { \sb \sb }                                        %% 99-100
    {
      \break   %% the 2nd ending gets its own system
      \textMark \markup { \italic "Last time" }
      \hits r1                                          %% 101-102
      \improvisationOn b'4 \improvisationOff r2. | r1 | \hitsEnd   %% 103-105
    }
  }
  \bar "|."
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \transpose bes c \changes }
    \new Staff { \sax }
  >>
  \layout {
    indent = 0
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  \unfoldRepeats <<
    \new ChordNames \transpose bes c \changes
    \new Staff \transpose c bes, \sax
  >>
  \midi { }
}
