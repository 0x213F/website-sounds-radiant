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
%%   C   bars 17-25   Vamp, 8 bars - chord symbols over rests, no
%%                    slashes. Bar 17 has a parenthesised held D in
%%                    BOTH horns, "When applicable".
%%                    Played twice: 7 bars + 1st ending (24)
%%                    and 2nd ending (25), which carries the sax's
%%                    lead-in into D on beats 3-4.
%%   D   bars 26-37   The head, traded: sax 26-29, trumpet 29-33, then
%%                    both in harmony (33-34) and in unison (35-37).
%%
%% PLAYED ORDER is not page order:
%%   A B A A C B D D, solos over C, D out.
%% The form line under the title spells it out in boxed letters. Bar 37 ends on the Bb and the
%% TRUMPET's lead-in (D C D C D) with a hanging tie - it carries into
%% the parenthesised held D at the top of C (both horns have it there,
%% "When applicable") when the form goes back to C for solos.
%%
%% PITCH: written at concert pitch, at the export's octave - no
%% \transpose in the \score block (the old chart had one; this does not).
%%
%% CHORDS - one eight-bar cycle carries A, B and C:
%%   Cm7  Cm7  D7  D7  |  Cm7  Cm7  Em7  Gmaj7
%% D stretches the back half: Em7 for two bars, Gmaj7 for a bar and a
%% half, then N.C. for the unison line and the Bb.
%%
%% D - WHO PLAYS WHAT. The export has both horn lines on the same patch
%% ("Deluxe Classic"), in two regions. The region that opens D and takes
%% the LOWER line in the harmony bars is read as the sax; the one that
%% answers at bar 29 and takes the top line is read as the trumpet.
%%
%% D's harmony bars: the sax plays the trumpet's F#/F figure a 4th down
%% (C#/C), and in bar 34 lands on D under the trumpet's F#. C# is the 13
%% of Em7 and the #11 of Gmaj7 - a Lydian colour, deliberate in the
%% export.
%%
%% NEW RHYTHMS IN D vs the old head:
%%   - the G on beat 2 of bars 28 and 32 is a staccato quarter (the
%%     export plays it as a 16th; written as the user specified)
%%   - figBsh: the D on the "a" of 3 is cut to a 16th + 16th rest
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

#(set-global-staff-size 16)
\paper {
  ragged-last-bottom = ##t
  paper-height = 9.4\in
  top-margin = 0.4\in
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

chordPart = \chordmode {
  \repeat volta 2 { \cycle }           %% A   1-8 - mirrors the staff repeat
  \cycle                               %% B   9-16
  \repeat volta 2 {                    %% C   17-23 - mirrors the staff
    c1:m7  c:m7  d:7  d:7  c:m7  c:m7  e:m7
  }
  \alternative { { g1:maj7 } { g1:maj7 } }  %% C   24, 25 - the endings
  c1:m7  c:m7  d:7  d:7                %% D   26-29
  c1:m7  c:m7  e:m7  e:m7              %% D   30-33
  g1:maj7  g2:maj7 r2  r1  r1          %% D   34-37 - N.C. from the
                                       %%     unison line to the end
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

%% tied-in D, staccato B, quarter rest - the B is a light release off
%% the held D. Every use: A's bars 3, 4, 7, 8 and D's 27 and 31.
answer   = { d''8 b'8-. r4 }

%% D section figures
figBeb   = { d''8 ees''16 d''8 c''16 b'8~ }        %% bars 27 (sax) and
                                                   %%   31 (tpt) - lands B
figBsh   = { d''8 e''16 d''16 r16 c''16 b'8~ }     %% bars 28, 32 - short D
figFs    = { fis''8 f''16 fis''8 f''16 fis''8~ }   %% bar 33, trumpet
figCs    = { cis''8 c''16 cis''8 c''16 cis''8~ }   %% bar 33, sax - figFs
                                                   %%   a 4th down
lift     = { b'4 g''4-. }              %% bars 28, 32: tied-in B, then
                                       %%   the high G on 2, staccato

%% Bars 35-36, the unison line - both horns, same octave.
unisonA  = { g'16 g' g' d'' d'' d'' g'' g'' }       %% beats 3-4 of bar 35
unisonB  = { g''16 d'' d'' d'' a' a' a' g' g'8. d'8. b8 }   %% bar 36

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
  R1*6 |                          %% 11-16
  \break

  \mark \markup { \bold \box "C" }
  \textMark \markup { \italic "Vamp" }
  \repeat volta 2 {
    %% 17 - the same optional held D as A's bar 1
    \parenthesize d''1^\markup { \italic "When applicable" } |
    R1*6 |                        %% 18-23 - rests, no slashes
  }
  \alternative {
    { R1 }                        %% 24 - 1st ending, back to 17
    { r2 \figDC }                 %% 25 - 2nd ending, lead-in to D
  }
  \break

  \mark \markup { \bold \box "D" }
  d''4. r8 \figDC |               %% 26
  \answer \figBeb |               %% 27
  \lift \figBsh |                 %% 28
  b'4 r4 r2 |                     %% 29 - hands off to the trumpet
  R1*3 |                          %% 30-32
  r2 \figCs |                     %% 33 - harmony, under the trumpet
  cis''8 a'8 r8 cis''16 cis''16
    cis''8 cis''8 cis''8 c''16 d''16~ |   %% 34
  d''4 r4 \unisonA |              %% 35 - unison from beat 3
  \unisonB |                      %% 36
  bes8-. r8 r2. |                 %% 37 - Bb (the lead-in is the trumpet's)
  \bar "|."
}

%% ---- Rhythm line (B only) ----
%% Band hits for B: a hit on the "and" of 2 in the first three bars of
%% each four-bar half, nothing in the fourth (bars 12 and 16) -
%% the same spot the trumpet moves from A to G. The staff is removed
%% from every system where it is empty, so it only prints in B.
hit = { r4 r8 c8 r2 }

rhythmLine = {
  \global
  \repeat volta 2 { R1*8 | }      %% A - mirrors the repeat
  \hit | \hit | \hit | R1 |       %% B 9-12 - nothing in the 4th bar
  \hit | \hit | \hit | R1 |       %% B 13-16 - same
  \repeat volta 2 { R1*7 | }      %% C - mirrors the repeat
  \alternative { { R1 } { R1 } }
  R1*12 |                         %% D
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
    %% 17 - same optional held D as the sax: it catches the trumpet's
    %%   lead-in from bar 37 when the form goes D -> C for solos
    \parenthesize d''1^\markup { \italic "When applicable" } |
    R1*6 |                        %% C 18-23
  }
  \alternative { { R1 } { R1 } }  %% 24, 25

  R1*3 |                          %% D 26-28
  r2 \figDC |                     %% 29 - takes over from the sax
  d''4. r8 \figDC |               %% 30
  \answer \figBeb |               %% 31 - same as the sax's bar 27
  \lift \figBsh |                 %% 32
  b'4 r4 \figFs |                 %% 33 - harmony, on top
  fis''8 d''8 r8 fis''16 fis''16
    fis''8 fis''8 fis''8 f''16 fis''16~ |  %% 34
  fis''4 r4 \unisonA |            %% 35
  \unisonB |                      %% 36
  bes8-. r8 r4 \figDClv |         %% 37 - Bb, then the lead-in out to C
  \bar "|."
}

%% Form line: boxed letters to match the rehearsal marks.
#(define-markup-command (sec layout props s) (markup?)
  (interpret-markup layout props (markup #:box (#:bold s))))
\markup { \fill-line { \line {
  \bold "Form:"
  \sec A \sec B \sec A \sec A \sec C \sec B \sec D \sec D
  "– solos over" \sec C "–" \sec D "out"
} } }

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordPart
    }
    \new StaffGroup <<
      \new Staff \with { instrumentName = "Sax" } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \sax }
      }
      \new RhythmicStaff \with {
        instrumentName = "Rhythm"
        shortInstrumentName = "Rhy."
        \RemoveAllEmptyStaves
        \override NoteHead.style = #'cross
      } { \rhythmLine }
      \new Staff \with { instrumentName = "Trumpet" } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \trumpet }
      }
    >>
  >>
  \layout {
    indent = 16\mm
  }
}

\score {
  <<
    \new ChordNames { \chordPart }
    \new Staff \with { midiInstrument = "alto sax" } { \sax }
    \new Staff \with { midiInstrument = "trumpet" } { \trumpet }
  >>
  \midi { }
}
