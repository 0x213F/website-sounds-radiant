\version "2.24.0"

%% "Aaj Shanibar" - built on the vamp from "Ibiza"
%% (Butcher Brown, Select Cuts live performance)
%%
%% Rebuilt 2026-10-07 from the Logic export "Aaj Shanibar.mid". The old
%% Intro / Vamp / A / B / Solos / Coda chart is in aaj-shanibar.ly.bak59.
%%
%% FORM - four eight-bar-ish sections, all over one cycle:
%%
%%   A   bars 1-8     Sax states the head. Trumpet tacet. Repeated;
%%                    bar 1 has the sax's held D, parenthesised and
%%                    marked "Only on repeat" - it carries over bar 8's
%%                    D landing on the way round.
%%   B   bars 9-16    Trumpet lick (A - G - F#), twice. The sax's last D
%%                    from A rings under the first two bars ("Only on
%%                    entering", with a swell). A rhythm
%%                    line between the horns marks the "and" of 2.
%%                    C has one too: the "and" of 2 for six bars, then
%%                    a whole note tied over two.
%%   C   bars 17-25   Vamp, 8 bars - chord symbols over rests, no
%%                    slashes. Bars 17-18 have a parenthesised held D
%%                    in BOTH horns, "When applicable" - two tied
%%                    whole notes with a swell, same as B's 9-10.
%%                    Played twice: 7 bars + 1st ending (24)
%%                    and 2nd ending (25), which carries the sax's
%%                    lead-in into D on beats 3-4.
%%   D   bars 26-37   The head, traded: sax 26-29, trumpet 29-33, then
%%                    both in harmony (33-34) and a run in 5ths (35-37).
%%
%% PLAYED ORDER is not page order:
%%   A B A A - breakdown over C - D - solos over C.
%% The form line under the title spells it out in boxed letters. Bar 37 ends on the B and the
%% TRUMPET's lead-in (D C D C D) with a hanging tie - it carries into
%% the parenthesised held D at the top of C (both horns have it there,
%% "When applicable") when the form goes back to C for solos.
%%
%% PITCH: written at concert pitch, at the export's octave - no
%% \transpose in the \score block (the old chart had one; this does not).
%%
%% CHORDS - one eight-bar cycle carries A and B:
%%   Cm7  Cm7  D7  D7  |  Cm7  Cm7  Em7  Gmaj7
%% C (the vamp) has its own (2026-10-09), two bars each, from the bass
%% line and the Moises chart of the live "Ibiza" (m. 91 on):
%%   C7  C7  Bm7  Bm7  |  Fmaj7  Fmaj7  Em7  (Em7 in both endings)
%% The horns' held D in 17-18 is the 9 of C7; the sax's lead-in in the
%% 2nd ending (D C D C D) sits over Em7.
%%
%% BASS STAFF (added 2026-10-09) under the trumpet: the riff in A, B
%% and D, C's own root-5th line. Full part: aaj-shanibar-bass.ly.
%% C: the groove line is written, marked "or roots, or
%% tacet, to taste" - the three options were stacked staves in .bak92.
%% D stretches the back half: Em7 for two bars, Gmaj7 for a bar and a
%% half, then N.C. for the closing run and the B.
%%
%% D - WHO PLAYS WHAT. The export has both horn lines on the same patch
%% ("Deluxe Classic"), in two regions. The region that opens D and takes
%% the LOWER line in the harmony bars is read as the sax; the one that
%% answers at bar 29 and takes the top line is read as the trumpet.
%%
%% D's harmony bars: the sax plays the trumpet's F#/F figure a 4th down
%% (C#/C) in bar 33; from beat 2 of bar 34 it doubles the trumpet's
%% F# figure an octave down (2026-10-08 export). C# is the 13
%% of Em7 and the #11 of Gmaj7 - a Lydian colour, deliberate in the
%% export.
%%
%% NEW RHYTHMS IN D vs the old head:
%%   - the G on beat 2 of bars 28 and 32 is a staccato quarter (the
%%     export plays it as a 16th; written as the user specified)
%%   - figBsh: D D B on 3, the "a" of 3 and the "and" of 4 (3+3+2, as in
%%     bar 36), grace E into the 2nd D, passing C. Note lengths written
%%     legato - the export's gaps are performance, not rests.
%%   - bars 26-27 and 30-31: D on 1, staccato C on the "and" (2026-10-11)
%%   - bar 34: the F# figure becomes three straight eighths on 2-3-and
%%
%% Transcription calls (the MIDI is played in, not quantised):
%%   - The answer bars (A 3, 4, 7, 8; D 27, 31) are all written d8 b8-. r4
%%     - a staccato B. The export's B runs from a 16th to an eighth.
%%   - In D, landing notes released around beat 1.25 are written as a
%%     quarter + quarter rest.
%%   - Bar 27's D Eb D C B is read as figBeb (the long-D form); its D
%%     falls between the "a" of 3 and beat 4 in the export.
%%
%% No key signature on purpose: the chords move between C minor and
%% G major, so either signature would fill the page with naturals.

\header {
  title = "Aaj Shanibar"
  composer = "Rupa"
  tagline = ##f
}

#(set-global-staff-size 15)
\paper {
  ragged-last-bottom = ##t
  paper-height = 9.4\in
  top-margin = 0.25\in
  bottom-margin = 0.3\in
}

global = {
  \key c \major
  \numericTimeSignature   %% print 4/4, not the C symbol
  \time 4/4
  \tempo 4 = 127
}

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
  \repeat volta 2 { \cycle }           %% A   1-8 - mirrors the staff repeat
  \cycle                               %% B   9-16
  \cChords                             %% C   17-25 - its own changes
  c1:m7  c:m7  d:7  d:7                %% D   26-29
  c1:m7  c:m7  e:m7  e:m7              %% D   30-33
  g1:maj7  g2:maj7 r2  r1  r1          %% D   34-37 - N.C. from the
                                       %%     closing run to the end
}

%% ---- one pair of parentheses across two tied notes ----
%% \parenthesize always brackets a single note. These draw only the
%% opening bracket on one note-head and only the closing one on another,
%% so a held note tied across a barline reads as one parenthesised event.
#(define (paren-side side glyph)
   (lambda (grob)
     (let ((head (ly:note-head::print grob))
           (paren (ly:font-get-glyph (ly:grob-default-font grob) glyph)))
       (ly:stencil-combine-at-edge head X side paren 0.25))))
openParen  = \once \override NoteHead.stencil =
  #(paren-side LEFT "accidentals.leftparen")
closeParen = \once \override NoteHead.stencil =
  #(paren-side RIGHT "accidentals.rightparen")

%% ---- figures ----
%% The figure: D on 3, C on the "and", D on the "a", C on the "e" of 4,
%% then the landing on the "and" of 4, tied over the bar.
figDC    = { d''8 c''16 d''8 c''16 d''8~ }
%% Bar 37 only: the lead-in out of D, whose destination is not written
%% yet - \laissezVibrer draws the hanging tie without a target note.
figDClv  = { d''8 c''16 d''8 c''16 d''8\laissezVibrer }
%% Bar 37, sax: harmony under the trumpet's figDClv, same rhythm - G F G F G,
%% a 5th below D C D C D (concert, as played on piano by the user).
figHarmLv = { g'8 f'16 g'8 f'16 g'8\laissezVibrer }  %% lands G - the lower
                                                      %%   note held at C's top

%% tied-in D, staccato B, quarter rest - the B is a light release off
%% the held D. Every use: A's bars 3, 4, 7, 8 and D's 27 and 31.
answer   = { d''8 b'8-. r4 }
answerD  = { d''8 c''8-. r4 }   %% D's answer: C, not B, on the "and" of 1
                                %%   (2026-10-11 export) - bars 26-27, 30-31

%% D section figures
figBeb   = { d''8 ees''16 d''8 c''16 b'8~ }        %% bars 27 (sax) and
                                                   %%   31 (tpt) - lands B
figBsh   = { d''8. \acciaccatura e''16 d''8 c''16 b'8~ }  %% bars 28, 32 - 3+3+2
                                %%   like bar 36's ending (D, D, B), with a
                                %%   grace E into the 2nd D and C as a passing
                                %%   16th. Rests from the export dropped.
figFs    = { fis''8 f''16 fis''8 f''16 fis''8~ }   %% bar 33, trumpet
figCs    = { cis''8 c''16 cis''8 c''16 cis''8~ }   %% bar 33, sax - figFs
                                                   %%   a 4th down
lift     = { b'4 g''4-. }              %% bars 28, 32: tied-in B, then
                                       %%   the high G on 2, staccato

%% Bars 35-36, the closing run. Was in unison; from the 2026-10-08
%% export the sax plays it a 5th below the trumpet, converging on the
%% last three notes (trumpet G D C, sax C D C), into the B in bar 37.
tptRunA  = { g'16 g' g' d'' d'' d'' g'' g'' }       %% beats 3-4 of bar 35
tptRunB  = { g''16 d'' d'' d'' a' a' a' g' g'8. d'8. c'8 }  %% bar 36
saxRunA  = { c'16 c' c' g' g' g' c'' c'' }          %% a 5th below
saxRunB  = { c''16 g' g' g' d' d' d' c' c'8. d'8. c'8 }

%% B: the trumpet lick, A - G - F#, entering on the "and" of 4
lick     = { r2. r8 a'8~ | a'4. g'2 fis'8~ }
%% ...and its held F#, with the swell: crescendo to beat 3 of the first
%% bar, decrescendo to the release. Both halves of B use it - bars 11-12
%% are the model; 15-16 used to cut the F# short (as in the export).
lickHold = { \after 2 \> fis'1~\< | fis'4. r8\! r2 }

%% ---- Sax ----
sax = {
  \global
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "A" }
  \bar ".|:"                      %% a repeat at the very start of a
                                  %%   piece is hidden by default
  \repeat volta 2 {
    %% 1 - optional held D, "Only on repeat": the sax holds bar 8's D
    %%   landing through it on the way round; the first time in it is
    %%   band alone. No \repeatTie - its arc collided
    %%   with the opening parenthesis. MIDI always plays it.
    %%   Bars 1-2 mirror bars 5-6: the held D, decrescendo to beat 3
    %%   then crescendo, tied to a quarter in bar 2. One set of
    %%   parentheses spans the whole held note, bar 1 to bar 2's quarter.
    \openParen \after 2 \< d''1~\>^\markup { \italic "Only on repeat" } |
    \closeParen d''4\! r4 \figDC |   %% 2
    \answer \figDC |              %% 3
    \answer \figDC |              %% 4
    \break                        %% A in two lines of four
    \after 2 \< d''1~\> |         %% 5 - held D: decrescendo to beat 3,
                                  %%   then crescendo
    d''4\! r4 \figDC |              %% 6 - quarter, quarter rest
    \answer \figDC |              %% 7
    \answer \figDC |              %% 8 - lands D. The tie is drawn
  }                               %%   into B's held D; on the repeat it
                                  %%   carries into bar 1's held D
  \break

  \mark \markup { \bold \box "B" }
  %% held D, marked Only on entering: crescendo through bar 9,
  %% decrescendo through bar 10
  %% one set of parentheses around both bars - optional, like A's bar 1
  \openParen d''1~\<^\markup { \italic "Only on entering" } |
  \closeParen \after 1 \! d''1\> |                  %% 9-10 - A's D rings under the lick
  R1*2 |                          %% 11-12
  \break                          %% B in two lines of four bars
  R1*4 |                          %% 13-16
  \pageBreak                      %% C starts page 2 - the stacked form
                                  %%   list left no room for it on page 1

  \mark \markup { \bold \box "C" }
  \textMark \markup { \italic "Vamp" }
  \repeat volta 2 {
    %% 17-18 - optional held note, the same shape as B's bars 9-10: two
    %%   tied whole notes in one set of parentheses, crescendo through
    %%   17, decrescendo through 18. BOTH landings are shown, stacked:
    %%   D (coming from A's figDC) and G (coming from D's bar 37,
    %%   figHarmLv - a 5th under the trumpet's held D).
    \openParen <g' d''>1~\<^\markup { \italic "When applicable" } |
    \closeParen \after 1 \! <g' d''>1\> |
    R1*5 |                        %% 19-23 - rests, no slashes
  }
  \alternative {
    { \once \override Score.VoltaBracket.stencil = ##f   %% no "1." bracket
      R1 }                        %% 24 - 1st ending, back to 17
    { \once \override Score.VoltaBracket.text =   %% 25 - 2nd ending, lead-in
        \markup { \normal-text \bold { "Pickups into" \box "D" } }        %%   to D, labelled as such
      r2 \figDC }
  }
  \break

  \mark \markup { \bold \box "D" }
  \answerD \figDC |              %% 26 - same as 27
  \answerD \figBeb |              %% 27
  \lift \figBsh |                 %% 28
  b'4 r4 r2 |                     %% 29 - hands off to the trumpet
  \break                          %% D in three lines of four bars
  R1*3 |                          %% 30-32
  r2 \figCs |                     %% 33 - harmony, under the trumpet
  \break
  cis''8 a'8 r8 fis'16 fis'16
    fis'8 fis'8 fis'8 f'16 fis'16~ |      %% 34 - from beat 2 the sax
                                          %%   doubles the trumpet's F#
                                          %%   figure an octave down
  fis'4 r4 \saxRunA |             %% 35 - the run, a 5th below
  \saxRunB |                      %% 36
  b4-. r4 \figHarmLv |            %% 37 - B, then the harmony lead-in
  \bar "|."
}

%% ---- Rhythm line (B and C) ----
%% Band hits for B: a hit on the "and" of 2 in the first three bars of
%% each four-bar half, nothing in the fourth (bars 12 and 16) -
%% the same spot the trumpet moves from A to G.
%% C: the same hit in its first six bars (17-22), then a whole note on
%% bar 23 tied through the ending bar (24 or 25).
%% The staff is removed from every system where it is empty, so it only
%% prints in B and C.
hit = { r4 r8 c8 r2 }

rhythmLine = {
  \global
  \repeat volta 2 { R1*8 | }      %% A - mirrors the repeat
  \hit | \hit | \hit | R1 |       %% B 9-12 - nothing in the 4th bar
  \hit | \hit | \hit | R1 |       %% B 13-16 - same
  \repeat volta 2 {               %% C - mirrors the repeat
    \repeat unfold 6 { \hit | }    %% 17-22
    c1~ |                         %% 23 - held into the ending
  }
  \alternative {
    { c1 }                        %% 24
    { c1\repeatTie }              %% 25 - the tie arrives over the
  }                               %%   1st ending, so it's a repeat tie
  R1*12 |                         %% D
}

%% ---- Bass ----
%% A, B, D: the 4-bar riff from the export, looped. It was written for
%% the Cm7 / D7 half of the cycle; under Em7 and Gmaj7 it clashes (see
%% aaj-shanibar-bass.ly).
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

bassPart = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible
  \repeat volta 2 { \riff \riff }      %% A 1-8
  \riff \riff                          %% B 9-16
  \repeat volta 2 { <>^\markup { \italic "Groove – or roots, or tacet, to taste" } \cLine }  %% C 17-23
  \alternative { { e1 } { e1\repeatTie } }   %% 24, 25
  \riff \riff                          %% D 26-33
  \rOne |                              %% 34
  r4 c'8 r8 r2 |                       %% 35 - one C, then out (N.C.)
  R1 |                                 %% 36 - the horns' run
  r4 c8 b,8 c8 d8 c4 |                 %% 37 - the riff's tail
  \bar "|."
}

%% What the score shows: the riff once (bars 1-4), unmarked - it loops
%% through A and B, then C and D. Bars 5-16 are skips, so the bass staff
%% drops out of those systems. The MIDI still plays bassPart in full.
bassShow = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible
  \repeat volta 2 {                    %% A
    \riff
    s1*4                               %% 5-8
  }
  s1*8                                 %% B
  \repeat volta 2 { <>^\markup { \italic "Groove – or roots, or tacet, to taste" } \cLine }
  \alternative { { e1 } { e1\repeatTie } }   %% 24, 25
  \riff \riff                          %% D 26-33
  \rOne |                              %% 34
  r4 c'8 r8 r2 |                       %% 35
  R1 |                                 %% 36
  r4 c8 b,8 c8 d8 c4 |                 %% 37
  \bar "|."
}

%% ---- Trumpet ----
trumpet = {
  \global
  \override Staff.Clef.break-visibility = #all-invisible

  \repeat volta 2 { R1*8 | }      %% A 1-8

  \lick |                         %% B 9-10
  \lickHold |                     %% 11-12
  \lick |                         %% 13-14
  \lickHold |                     %% 15-16 - same as 11-12

  \repeat volta 2 {
    %% 17-18 - same optional held D as the sax (B's bar 9-10 shape): it
    %%   catches the trumpet's lead-in from bar 37 when the form goes
    %%   D -> C for solos
    \openParen d''1~\<^\markup { \italic "When applicable" } |
    \closeParen \after 1 \! d''1\> |
    R1*5 |                        %% C 19-23
  }
  \alternative { { R1 } { R1 } }  %% 24, 25

  R1*3 |                          %% D 26-28
  r2 \figDC |                     %% 29 - takes over from the sax
  \answerD \figDC |              %% 30 - same as the sax's bar 26
  \answerD \figBeb |              %% 31 - same as the sax's bar 27
  \lift \figBsh |                 %% 32
  b'4 r4 \figFs |                 %% 33 - harmony, on top
  fis''8 d''8 r8 fis''16 fis''16
    fis''8 fis''8 fis''8 f''16 fis''16~ |  %% 34
  fis''4 r4 \tptRunA |            %% 35
  \tptRunB |                      %% 36 - ends on C now (was B)
  b4-. r4 \figDClv |         %% 37 - B, then the lead-in out to C
  \bar "|."
}

%% Form line: boxed letters to match the rehearsal marks.
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
    \new StaffGroup <<
      \new Staff \with { instrumentName = "Sax" shortInstrumentName = "Sax" } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \sax }
      }
      \new RhythmicStaff \with {
        instrumentName = "Rhythm"
        shortInstrumentName = "Rhy."
        \RemoveAllEmptyStaves
        \override NoteHead.style = #'cross
      } { \rhythmLine }
      \new Staff \with { instrumentName = "Tmpt" shortInstrumentName = "Tmpt" } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \trumpet }
      }
      \new Staff \with {
        instrumentName = "Bass" shortInstrumentName = "Bass"
        \RemoveAllEmptyStaves
      } { \bassShow }
    >>
  >>
  \layout {
    indent = 0\mm   %% first line lines up with the rest
  }
}

\score {
  <<
    \new ChordNames { \chordPart }
    \new Staff \with { midiInstrument = "alto sax" } { \sax }
    \new Staff \with { midiInstrument = "trumpet" } { \trumpet }
    \new Staff \with { midiInstrument = "electric bass (finger)" } { \bassPart }
  >>
  \midi { }
}
