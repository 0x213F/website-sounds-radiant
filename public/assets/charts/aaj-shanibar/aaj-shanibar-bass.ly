\version "2.24.0"

%% "Aaj Shanibar" - BASS
%%
%% Rebuilt 2026-10-09 to line up with the lead sheet (aaj-shanibar.ly):
%% same sections, bar numbers, repeats, endings, chords and form line.
%% The old 4-bar loop chart is in aaj-shanibar-bass.ly.bak1.
%%
%% FORM (page order matches the lead sheet):
%%   A   bars 1-8     the riff twice, in repeats
%%   B   bars 9-16    the riff twice; rhythm line shows the band hits
%%   C   bars 17-25   its own changes and line (C7 Bm7 Fmaj7 Em7, root -
%%                    5th - low root), 7 bars + 1st/2nd endings; rhythm line
%%   D   bars 26-37   the riff through bar 34, then out for the horns'
%%                    closing run, back in with the riff's tail in 37
%% Played order is the form line under the title.
%%
%% THE LINE is the Logic export's ("Aaj Shanibar.mid", 2026-10-08,
%% the "Vintage Soul" regions): one four-bar riff, looped unchanged
%% under every section. Nothing here is invented.
%%
%%   R1  C G C / D Eb G C        root, 5th, octave, down through the b3
%%   R2  F Eb D C B              the 11 on 2, landing on B, held over
%%   R3  D G / F# G A D          D major outlined, D held over
%%   R4  C B C D C               sits on the b7 and root of D7
%%
%% It was written for the old two-chord cycle (Cm / D7), so it fits
%% bars 1-6 of each eight but NOT the new back half: the riff's R3/R4
%% fall under Em7 and Gmaj7 (bars 7-8 of each cycle), where R4's C
%% is a 4th against Gmaj7. In D, bar 33 puts R4 under Em7 and bar 34
%% puts R1 (C and Eb) under Gmaj7, against the horns' F# and C#.
%% Transcribed as played; flagged, not fixed.
%%
%% REGISTER: written as played in the export, C3 up to F4 - the top
%% sits close to the horns. Play it an octave down if it is meant to be
%% the floor of the arrangement.

\header {
  title = "Aaj Shanibar"
  subtitle = "Bass"
  composer = "Rupa"
  tagline = ##f
}

#(set-global-staff-size 18)
\paper {
  ragged-last-bottom = ##t
  top-margin = 0.4\in
}

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 127
}

%% ---- chords: identical to the lead sheet, repeats mirrored ----
cycle = \chordmode {
  c1:m7  c:m7  d:7  d:7
  c1:m7  c:m7  e:m7  g:maj7
}

%% C (the vamp): C - B - F - E, two bars each - the bass line from the
%% 2026-10-09 export, qualities per the Moises chart of the live "Ibiza"
%% (m. 91 on). Bar 23's Em7 carries through both endings.
cChords = \chordmode {
  \repeat volta 2 {
    c1:7  c:7  b:m7  b:m7  f:maj7  f:maj7  e:m7
  }
  \alternative { { e1:m7 } { e1:m7 } }
}

chordPart = \chordmode {
  \repeat volta 2 { \cycle }           %% A   1-8
  \cycle                               %% B   9-16
  \cChords                             %% C   17-25 - its own changes
  c1:m7  c:m7  d:7  d:7                %% D   26-29
  c1:m7  c:m7  e:m7  e:m7              %% D   30-33
  g1:maj7  g2:maj7 r2  r1  r1          %% D   34-37 - N.C. under the run
}

%% ---- the riff ----
rOne   = { c8   g8   c'8  r8    d'8  ees'8 g8   c8   }
rTwo   = { r4        f'4         ees'8 d'8   c'8  b8~ }
rThree = { b8   d'8  g8   r8    fis8 g8    a8   d8~  }
rFour  = { d8   r8   c8   b,8   c8   d8    c4        }
riff   = { \rOne | \rTwo | \rThree | \rFour | }

%% C: root - 5th - low root, two bars per chord. Bars 21-23 (F, E) are
%% the 2026-10-09 export; 17-20 (C, B) are the same shape, written to
%% match. The 5th lands on the "and" of 2 with the band hit.
cLine = {
  c'4. g4.   c4~   | c1   |       %% 17-18 C7
  b4.  fis4. b,4~  | b,1  |       %% 19-20 Bm7
  f'4. c'4.  f4~   | f1   |       %% 21-22 Fmaj7
  e'4. b4.   e4~   |              %% 23    Em7 - held into the ending
}

%% ---- rhythm line: same as the lead sheet's ----
hit = { r4 r8 c8 r2 }

rhythmLine = {
  \global
  \repeat volta 2 { R1*8 | }      %% A
  \hit | \hit | \hit | R1 |       %% B 9-12
  \hit | \hit | \hit | R1 |       %% B 13-16
  \repeat volta 2 {               %% C
    \repeat unfold 6 { \hit | }   %% 17-22
    c1~ |                         %% 23
  }
  \alternative { { c1 } { c1\repeatTie } }   %% 24, 25
  R1*12 |                         %% D
}

bass = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "A" }
  \bar ".|:"                      %% a start repeat at bar 1 is hidden
  \repeat volta 2 {               %%   by default
    \riff
    \break
    \riff
  }
  \break

  \mark \markup { \bold \box "B" }
  \riff
  \break
  \riff
  \break

  \mark \markup { \bold \box "C" }
  \textMark \markup { \italic "Vamp" }
  \repeat volta 2 {
    \cLine                        %% 17-23 - E ties into the ending
  }
  \alternative {
    { e1 }                        %% 24
    { e1\repeatTie }              %% 25 - the tie arrives over the
  }                               %%   1st ending
  \break

  \mark \markup { \bold \box "D" }
  \riff                           %% 26-29
  \break
  \riff                           %% 30-33
  \break
  \rOne |                         %% 34
  r4 c'8 r8 r2 |                  %% 35 - one C, then out (N.C.)
  R1 |                            %% 36 - the horns' run
  r4 c8 b,8 c8 d8 c4 |            %% 37 - the riff's tail, untied in
  \bar "|."
}

#(define-markup-command (sec layout props s) (markup?)
  (interpret-markup layout props (markup #:box (#:bold s))))
\markup { \fill-line { \column {
  \line { \bold "Form:" }
  \line { \sec A \sec B \sec A \sec A "Head 1" }
  \line { \sec C "Breakdown" }
  \line { \sec D "Head 2" }
  \line { \sec C "Solos" }
  \line { \sec A \sec A "Between solos" }
  \line { \sec D "Out" }
} } }

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordPart
    }
    \new RhythmicStaff \with {
      instrumentName = "Rhythm"
      shortInstrumentName = "Rhy."
      \RemoveAllEmptyStaves
      \override NoteHead.style = #'cross
      fontSize = #-2
      \override StaffSymbol.staff-space = #(magstep -2)
    } { \rhythmLine }
    \new Staff \with { instrumentName = "Bass" } { \bass }
  >>
  \layout {
    indent = 14\mm
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  <<
    \new ChordNames { \chordPart }
    \new Staff \with { midiInstrument = "electric bass (finger)" } { \bass }
  >>
  \midi { }
}
