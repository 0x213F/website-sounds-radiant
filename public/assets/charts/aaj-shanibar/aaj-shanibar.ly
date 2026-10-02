\version "2.24.0"

%% "Aaj Shanibar" - built on the vamp from "Ibiza"
%% (Butcher Brown, Select Cuts live performance)
%%
%% FORM:  Intro - Vamp - A (1st/2nd endings) - B - Solos,
%%        D.S. al Coda back to A, then out to the Coda.
%%
%% The segno sits on A, the To Coda sign on A's SECOND ending, and the
%% D.S. at the end of the Solos. So: play through to the Solos, vamp
%% as long as you like, take the D.S. back to A, and on reaching the
%% second ending jump to the Coda and fade.
%%
%% OCTAVE: the whole melody is engraved an octave ABOVE what the
%% definitions below say, via \transpose c c' in the \score block.
%% So d' in the source prints as D5. That matches the octave of the
%% Logic export ("Aaj SHanibar.mid"). Change it in one place - do not
%% rewrite the figures.
%%
%% Sections are labelled Intro / Vamp / A / B / Solos / Coda:
%%
%%   Intro   4 bars      Cm(maj7)/B x2  D7/A x2   repeat as desired
%%   Vamp    4 bars      Cm(maj7)/B x2  D7/A x2   melody first time only,
%%                                                2nd ending on cue
%%   A      11 bars      two rounds of the       played twice, with
%%           + endings    cycle, then G(maj7)/F#   1st/2nd endings
%%                        for bars 18-22
%%   B       8 bars      the same cycle           bars 1-4 restated,
%%                                                then D held 27-30
%%   Solos   4 bars      the same cycle           open, then D.S.
%%   Coda    3 bars      G(maj7)/F# throughout    out on the Bb
%%
%% The Melody is eight bars - two four-bar halves that mirror each
%% other until the end, where bar 17 rests out instead of landing.
%% Its bars are written out rather than reused from the Intro: the
%% two sections differ in both the figure and the landings.
%%
%% Every bar of the Melody carries the same shape: the previous bar's
%% landing note held across beats 1-2, then the figure, then a landing
%% eighth tied over the barline. Only the landing pitch changes, so the
%% line is continuous from the first bar to the last. Landings run
%% D B B D / D B B, and bar 17 rests out rather than landing at all.
%% Because each bar OPENS on the previous bar's
%% landing, changing any landing forces the next bar's opening note -
%% bars 12, 14, 16 and 17 open on the note handed to them. Bars 11 and 15
%% borrows the Intro's answer figure, so the Melody opens with a held bar and
%% then that shape, echoing how the Intro begins.
%%
%% CHORDS: a two-bar-each cycle carries nearly everything -
%%   Cm(maj7)/B  Cm(maj7)/B  D7/A  D7/A  |  round again
%% It runs the Intro, the vamp, B and the solos unbroken. The ONE
%% departure is the last four bars of A - 18, 19, 20 and the ending
%% (21 or 22) - which sit on G(maj7)/F#, and the Coda, which is all
%% G(maj7)/F# because it quotes bars 19 and 20. Every section is still
%% a whole number of four-bar units, so the cycle is back in phase at
%% bar 10 on the repeat and at bar 23 going into B.
%%
%% WHY G THERE. From bar 18 the melody stops using the tune's material
%% and spells a G chord outright: bars 18-20 contain G, A, B, D and F#
%% and nothing else, with F natural only ever a 16th-note neighbour to
%% F#. Bar 18 is F# almost wall to wall and opens on F# on the downbeat,
%% so putting F# in the bass locks the outer voices onto one pitch class
%% right where the melody has thinned to almost nothing else. The
%% major 7th in the bass is the same device as Cm(maj7)/B - not a
%% borrowed colour, the tune's own voicing habit moved onto a new root.
%%
%% The Bb that opens bars 21, 22 and 47 is a b3 against the chord's B
%% natural. That rub is deliberate and it is the mirror of the E natural
%% the melody plays over Cm(maj7) - the tune leans on the third in both
%% directions.
%%
%% THE CYCLE USED TO START ON D7/A. It was rotated two bars on 2026-09-22
%% after a Logic bass export settled it: over the first bar the bass
%% plays C G C / D Eb G C - no A, no F# anywhere, and the chord's own
%% slash note never sounds - while over the THIRD bar it spells
%% D G F# G A D, a D major triad outright. The giveaway is the F: bar 2
%% has F natural on beat 2 and bar 3 has F# on beat 3, so under the old
%% alignment the F natural ground against D7's F# on a strong beat.
%% Rotated, every note of that bass line is a chord tone.
%%
%% The C minor chord keeps its natural 7 and its /B. That is not
%% leftover - the bass confirms it. Its second bar descends F Eb D C B
%% and LANDS on the B natural, the major 7th, and the phrase contains no
%% Bb at all. Written c:m7+/b, which LilyPond sets as Cm(triangle)/B.
%% Both symbols are inversions: A is the 5th of D7, B the major 7th of
%% Cm(maj7). (The bass plays C and D on those downbeats, not B and A,
%% so root position would arguably be truer - left as slashes for now.)
%%
%% An older Moises chord-chart export once put Em Em Cm Cm / Bm through
%% the back half. That is gone - the cycle plus the G stretch is the
%% whole harmony. The export is not worth revisiting - its barlines slip
%% by a bar around 4:30-5:10, and the Gmaj7/D7 it reports early on are
%% soloist pitches, not changes.
%%
%% Melody from "aaj shanshibar.mid" (Logic). An earlier pass changed
%% the MIDI's D-C to D-E throughout, "corrected by ear". That holds
%% for the Melody but not the Intro, which goes back to the MIDI's D-C.
%% D is the common tone across both chords - the 9th of Cm(maj7) and the
%% root of D7 - which is why the tune can sit on it for whole bars at a
%% time. C is the other: the root of Cm(maj7) and the b7 of D7.
%%
%% The old 3-bar B (bars 9-11) is cut: bar 8 runs straight into the
%% vamp. Bar 8's last D ties over the barline and rings as a whole
%% note through the vamp's first bar - first time only. On the
%% recording it sustains roughly three bars.
%%
%% The Intro is phrased as lead-in + held note: a two-beat pickup before
%% bar 1, then bar 1 holds the D it ties into for the full bar. The
%% four bars read - held whole note; a bar resting through beats 1-2
%% before the figure; then two answer bars (tied-in eighth, B eighth,
%% quarter rest), the last of which leads back round or out.
%%
%% Bar 4's figure is the lead-in out of the head, straight into the
%% vamp on the last pass.
%%
%% The Intro is FOUR bars with an open repeat, not eight written out.
%% The two halves had become identical, so nothing is lost by folding
%% them - and an open repeat is truer to the tune, which goes round as
%% many times as the player wants rather than exactly twice. The tie
%% works either way out of bar 4: its figure lands on D, and both the
%% top of the repeat and the vamp's first bar open on a D.
%%
%% The Melody gets a two-beat lead-in in the vamp's SECOND ending, so it
%% only sounds on the way out, not on each pass round the vamp. It is
%% the D C D C D form - the lead-in belongs to the vamp it comes out
%% of, not to the head it feeds. Its last D ties into the Melody's first
%% bar, which therefore opens on that held D rather than a half rest.
%%
%% The vamp is split 3 bars + 1st/2nd endings. The chord part is split
%% the same way on purpose: \repeat volta is notational, not unfolded,
%% so if ChordNames kept a 4-bar repeat while the staff had 3 + endings
%% the two contexts would sit a bar apart on the page.
%%
%% The Melody puts a G natural on beat 2 of bars 12 and 16, an octave up
%% (G4, above the D). Both bars are now D7/A, so that G is the 11 in
%% each - a suspension on a weak beat that moves straight off.
%% Both bars split the held half note into two quarters, the tied-in
%% landing then the G. Bars 11 and 15 take the Intro's answer shape, which
%% leaves no beat 2 free; bar 17 rests out instead.
%%
%% No key signature on purpose: the vamp is chromatic and the melody
%% leans on C natural, so 2 sharps would put a natural sign on every
%% other note. The chord symbols carry the harmony.

\header {
  title = "Aaj Shanibar"
  composer = "Rupa"
  tagline = ##f
}

#(set-global-staff-size 18)
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

chordPart = \chordmode {
  %% \partial is score-wide, so ChordNames needs the pickup's two beats
  %% too - without them every chord sits two beats early on the page.
  s2                           %% pickup - spacer, so the first chord
                               %% symbol prints on beat 1 of bar 1 rather
                               %% than over the pickup. The two beats still
                               %% have to be here: \partial is score-wide,
                               %% and without them every chord sits early.
  %%
  %% ONE two-bar cycle runs the whole tune: Cm(maj7)/B x2, D7/A x2.
  %% Every loop below is a multiple of four bars and both halves of every
  %% \alternative carry the same chord, so the cycle stays in phase
  %% around every repeat, the D.S. and the jump to the Coda.
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b          %% Intro bars 1-2
    d1:7/a    d:7/a            %% Intro bars 3-4
  }
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b  d1:7/a  %% Vamp 5-7; 3 bars + endings
  }
  \alternative { { d1:7/a } { d1:7/a } }     %% bars 8, 9
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b  d1:7/a  d:7/a   %% A 10-13
    c1:m7+/b  c:m7+/b  d1:7/a  d:7/a   %% A 14-17
    %% A's last four bars leave the cycle for G. See the header.
    g1:maj7/fis  g:maj7/fis  g:maj7/fis   %% A 18-20
  }
  \alternative { { g1:maj7/fis } { g1:maj7/fis } }   %% bars 21, 22
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b  d1:7/a  d:7/a   %% B 23-26 - bars 1-4 restated
    c1:m7+/b  c:m7+/b  d1:7/a          %% B 27-29 - the held D
  }
  \alternative { { d1:7/a } { d1:7/a } }     %% bars 30, 31
  %% these mirror the staff's repeats - \repeat volta is notational, so
  %% an unrepeated chord part here would drift out of alignment.
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b  d1:7/a          %% Solos 32-34, then endings
  }
  \alternative { { d1:7/a } { d1:7/a } }     %% bars 35, 36
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b  d1:7/a  d:7/a   %% Solos 37-40 - bars 23-26 again
  }
  c1:m7+/b  c:m7+/b  d1:7/a  d:7/a     %% Solos 41-44 - the D held
  %% Coda. The jump leaves from the top of bar 19, which is inside the
  %% G stretch, so the Coda is G all the way out - bars 45 and 46 quote
  %% 19 and 20, and 47 is the closing Bb.
  g1:maj7/fis  g:maj7/fis  g:maj7/fis  %% Coda 45-47
}

%% The figure: a note on 3, one on the "and", on the "a", on the "e"
%% of 4, then the landing note on the "and" of 4, tied over the bar.
%%
%% INTRO AND MELODY USE DIFFERENT FIGURES, deliberately:
%%   Intro   D C D C D  - alternates, no step up
%%   Melody  D E D C D  - steps up to E first, then falls through
%% This is by ear, not an oversight. Do not collapse them into one.
%%
%% The E natural is FLATTENED ON MOST OF THE Cm(maj7)/B BARS, where it
%% would otherwise be a major 3rd rubbing the chord's own third. Bars 10,
%% 11 and 15 take the Eb; bars 12, 13, 16 and 17 are D7/A bars, where the
%% E natural is a clean 9th and stays.
%%
%% BAR 14 IS THE EXCEPTION - a Cm(maj7)/B bar that keeps its E natural.
%% That is deliberate, not an oversight: bars 11 and 15 (the answer bars)
%% mirror each other and both have the Eb, while 10 and 14 (the held-note
%% bars) deliberately differ, so the second half of the head leans where
%% the first half sat inside. Do not "fix" bar 14 without being asked.
%%
%% Bars 10, 11 and 15 use their own figures (figDeb, figBeb) so that figD
%% and figB stay shared and untouched for the bars that keep the E.
figDC   = { d'8 c'16 d'8 c'16 d'8~ }   %% INTRO: D C D C D, lands on D
%% Bar 21 only: the 1st ending of A, whose last D carries back over the
%% repeat into bar 10's opening D. A real tie CANNOT be used - LilyPond
%% looks for the next printed note, finds the 2nd ending's Bb, warns
%% "unterminated tie" and draws nothing at all. \laissezVibrer draws the
%% hanging half-tie, which is the correct engraving for a tie whose
%% destination is a repeat jump rather than the next bar on the page.
figDClv = { d'8 c'16 d'8 c'16 d'8\laissezVibrer }

figDCout = { d'8 c'16 d'8 c'16 d'8 }   %% same, untied - for bar 21, where
                                       %% the line continues across a D.S.
                                       %% jump that no tie can be drawn over

figD    = { d'8 e'16 d'8 c'16 d'8~ }   %% MELODY: D E D C D, lands on D
figDeb  = { d'8 ees'16 d'8 c'16 d'8~ } %% figD with Eb - bar 10 only
figB    = { d'8 e'16 d'8 c'16 b8~ }    %% MELODY: lands on B
%% Bars 11 and 15 - the head's two answer bars, which mirror each other.
%% Identical to figB but with Eb for the E natural. Both are Cm(maj7)/B
%% bars, so the Eb is the chord's own third rather than a major 3rd
%% rubbing against it. Its own figure rather than an edit to figB
%% because bars 12 and 16 share figB and KEEP their E naturals.
figBeb  = { d'8 ees'16 d'8 c'16 b8~ }
figFs   = { fis'8 f'16 fis'8 f'16 fis'8~ }   %% MELODY bar 17: the same
                                             %% rhythm on F# / F

figBout = { d'8 e'16 d'8 c'16 b8 }     %% MELODY: untied form -
                                       %% currently UNUSED

cell   = \figDC                        %% every statement inside the Intro
answer = { d'8 b8 r4 }             %% tied-in eighth, B eighth, quarter rest

%% Two-beat lead-in; \figDC is exactly a half bar, so it fills 3 and 4.
pickup = { \partial 2 \figDC }

%% First head.
%% The 1st-ending wraparound, identical in A and B: Bb quarter, quarter
%% rest, then the lead-in. UNTIED - a tie cannot be drawn back across a
%% repeat jump. A's 2nd ending is the same bar with the tied figure.
wrapAround = { bes,4 r4 \figDCout }

%% bars 19 and 20, also used verbatim by the Coda
mNineteen = { fis'8 d'8 r4 g16 g g d' d' d' g' g' }
mTwenty   = { g'16 d' d' d' a a a g  g8. d8. b,8 }

mFive   = { r2 \cell }             %% half rest through 1-2, then the
                                   %% figure - bars 2 and 6
mSix    = { \answer \cell }        %% bars 3, 4, 7, 8

intro = {              %% four bars, repeated as desired
  d'1 |                %% m1 - the pickup, held out
  \mFive |             %% m2 - half rest through beats 1-2
  \mSix |              %% m3
  \textMark \markup { \italic "Repeat as desired" }
  \mSix |              %% m4 - its figure is the lead-in; on the repeat it
}                      %%      ties back to m1, on the way out to the vamp

melody = {
  \global
  \pickup
  %% Clef on the first system only. The initial clef is already engraved
  %% by this point, so hiding it from here on leaves that one in place
  %% and suppresses the reminder at every later line break.
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "Intro" }
  \repeat volta 2 { \intro }
  \break

  \mark \markup { \bold \box "Vamp" }
  \textMark \markup { \italic "Melody (first time only)" }
  \repeat volta 2 {
    d'1 |
    \improvisationOn
    \repeat unfold 8 b'4
    \improvisationOff
  }
  \alternative {
    { \improvisationOn \repeat unfold 4 b'4 \improvisationOff }
    %% 2nd time: two beats of vamp, then the lead-in into the Melody.
    %% Uses \figDC (D C D C D) - the lead-in comes out of the vamp, so
    %% it carries the Intro's figure, not the E-form the Melody itself uses.
    { \textMark \markup { \italic "2nd ending on cue" }
      \improvisationOn \repeat unfold 2 b'4 \improvisationOff \figDC }
  }
  \break

  %% Melody. Its own figure (with the E); the held note at the start of
  %% each bar is whatever the previous bar landed on.
  \segnoMark \default
  \mark \markup { \bold \box "A" }
  \repeat volta 2 {
  d'2 \figDeb |     %% bar 10 - tied in from the lead-in, lands D.
                     %%   Eb, not E natural - bar 10 only. Bars 13 and
                     %%   14 are the same shape and keep figD.
  \answer \figBeb | %% bar 11 - the Intro's answer shape, lands B.
                     %%   Eb here, not E natural - bar 11 only.
  b4  g'4 \figB |    %% bar 12 - opens on B, G4 on 2 (11 of D7), lands B
  b2  \figD |        %% bar 13 - lands D, in A's E-form
  \break
  d'2 \figD |        %% bar 14 - opens on D (m13's landing), lands D
  \answer \figBeb | %% bar 15 - same shape as bar 11, lands B, and
                     %%   takes its Eb too
  b4  g'4 \figB |    %% bar 16 - opens on B, G4 on 2 (11 of D7), lands B
  b2  \figFs |       %% bar 17 - figure moves to F#/F, lands F#
    \break
    %% bars 18 and 19 - tied-in F# eighth, then a D on the "and" of 1.
    %%   Splitting beat 1 into two eighths is what makes room for it, and
    %%   it echoes the answer shape in bars 11 and 15. Both bars sit at
    %%   the melody's usual d'; bar 18 held a d'' (an octave up) for a
    %%   while, then came down to match bar 19.
    fis'8 d'8 r8 \tuplet 3/2 { fis'16 fis'16 fis'16 } \figFs |
    %% bars 19-20 - the Coda quotes these verbatim, so they are
    %%   variables: edit them once and both places follow.
    \codaMark 1
    \mNineteen |
    \mTwenty |
  }
  %% Endings. Both are Bb quarter, quarter rest, then the lead-in.
  %% 1st carries a HANGING tie (\laissezVibrer): its last D ties back over
  %% the repeat into bar 10's opening D. Written out rather than using
  %% \wrapAround, which bars 30 and 35 still share.
  %% 2nd IS tied, D to D, straight into B's held whole note.
  \alternative {
    { bes,4 r4 \figDClv }
    { bes,4 r4 \figDC }
  }
  \break

  %% ---- B: bars 1-4 restated, then the held D. Loops with endings. ----
  %% 1st ending wraps back to bar 23 - half note, then bar 22's lead-in,
  %% UNTIED because a tie cannot be drawn back across the repeat.
  %% 2nd ending holds the full bar and carries on to the Solos.
  \mark \markup { \bold \box "B" }
  \repeat volta 2 {
    d'1 |                 %% bar 23  = bar 1
    \mFive |              %% bar 24  = bar 2
    \mSix |               %% bar 25  = bar 3
    \mSix |               %% bar 26  = bar 4, tie intact
    d'1~ | d'1~ | d'1 |   %% bars 27-29 - the D held. No tie out of 29:
                          %%   the 1st ending now starts on Bb.
  }
  \alternative {
    { \wrapAround }       %% bar 30 - bar 22 verbatim, wraps to bar 23
    { d'1 }               %% bar 31 - held out, on to the Solos
  }
  %% no \bar "||" here: it lands on the same barline as the Solos'
  %% repeat-start and would override the |: that opens the solo loop.
  \break

  %% ---- Solos: the vamp, open, then jump back to A ----
  \mark \markup { \bold \box "Solos" }
  \textMark \markup { \italic "Open" }
  %% 3 bars + 1st/2nd endings. No \bar "||" anywhere around this: an
  %% explicit bar lands on the same barline as a repeat sign and
  %% overrides it, leaving the loop open at one end.
  \repeat volta 2 {
    \improvisationOn
    \repeat unfold 12 b'4
    \improvisationOff
  }
  \alternative {
    { \improvisationOn \repeat unfold 4 b'4 \improvisationOff }
    {
      \textMark \markup { \italic "Last time through" }
      %% two beats of vamp, then bar 22's lick on 3 and 4, tied into 37
      \improvisationOn \repeat unfold 2 b'4 \improvisationOff
      \figDC
    }
  }
  \break

  %% Solos continue - still the same section, so no new rehearsal mark.
  %% Bars 23-26 restated, then the D held four bars. The D.S. sits at the
  %% end of THIS passage, not at the end of the vamp loop, so these bars
  %% are played once on the way past rather than being jumped over.
  %% 37-40 loop on plain repeats - no endings
  \repeat volta 2 {
    d'1 |               %% bar 37  = bar 23
    \mFive |            %% bar 38  = bar 24
    \mSix |             %% bar 39  = bar 25
    \mSix |             %% bar 40  = bar 26; its tie is drawn into 41,
  }                     %%   and is understood on the way round
  d'1~ | d'1~ | d'1~ | d'1 |   %% bars 41-44 - the D held
  \jump "D.S. al Coda"
  \break

  %% ---- Coda: bars 19 and 20 again, then out on the Bb ----
  %% break-visibility forces the coda sign onto the START of this system;
  %% without it the mark draws at the end of the previous one.
  \once \override Score.CodaMark.break-visibility = #begin-of-line-visible
  \codaMark 1
  \mark \markup { \bold \box "Coda" }
  \mNineteen |          %% bar 45 - bar 19 verbatim
  \mTwenty |            %% bar 46 - bar 20 verbatim
  bes,8 r8 r2. |        %% bar 47 - the Bb, then out
  \fine
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordPart
    }
    \new Staff {
      \new Voice \with { \consists "Pitch_squash_engraver" } {
        \transpose c c' \melody
      }
    }
  >>
  \layout {
    indent = 0
    \context {
      \Score
      %% With the clef suppressed after system 1, each system would
      %% otherwise begin with nothing at all. Force the system-start
      %% bar (collapsed by default on a single staff) so the left edge
      %% is closed.
      \override SystemStartBar.collapse-height = #0
    }
  }
}

\score {
  \unfoldRepeats <<
    \new ChordNames { \chordPart }
    \new Staff { \transpose c c' \melody }
  >>
  \midi { }
}
