\version "2.24.0"

%% "Compared to What" - bass chart.
%%
%% Built from the Logic export "~/Music/Logic/Compared to Whut.mid"
%% (144 bpm). FORM and chord reasoning live in
%% compared-to-what-changes.ily, shared with the tenor part.
%%
%% THE LICK is one bar, identical in every key of the export:
%%   root root b7 root (held across beat 3, written as a tie) |
%%   5 on the "and" of 3, b7 on the "and" of 4
%% It is written once, in Eb, and every other key is a \transpose of
%% it, so a rhythm change lands everywhere at once.
%%
%% Bass sounds an octave below written as usual; written here an octave
%% below the export's pitches (the export's Eb4 is written Eb3).
%%
%% Departures from the export, deliberately:
%%  - The export runs Eb for 16 bars; the form as specified is
%%    4 (Intro) + 8 (Solo, Ebm) + 8 (Eb7) = 20 notated bars. The form wins.
%%  - Bar 20: the export changes key only at the barline. Here the chord
%%    turns to Dm on beat 3, so the lick's back half is played in D
%%    (A on the "and" of 3, C on the "and" of 4) - which is exactly the
%%    D lick's back half, so it leads straight into bar 21.
%%  - Bar 36 and the Build (37-56) are NOT the export's lick - see
%%    BUILD below. The export keeps the lick climbing through the keys.
%%  - A few performance slips in the export are not transcribed: a
%%    dropped A in the B bars, a doubled F, a stray Eb grace.

%% BUILD. Bar 36 sets it up: the F of the lick on the downbeat, then
%% "ups" on low F - the "and" of every beat. Written F2, which sounds
%% F1, the lowest F on the bass.
%%
%% From bar 37 a two-bar climb replaces the lick:
%%   | F (q) rest A (q) rest | Bb (dotted q) C (8) - up C, up F |
%% i.e. 1 3 4 5 of the chord. The "and" of 3 repeats the C from the
%% "and" of 2 (it was a low F until 2026-09-30); only the "and" of 4
%% drops to the root, leading into the next bar's downbeat.
%% Written once in F (buildFig) and transposed onto each chord.
%% Beat 4 of the first bar was not specified - left as a rest. The
%% "quarter rest, quarter F" x2 on beats 3-4 is written as eighths
%% (r8 C8 r8 F8): only two beats remain. Bar 36 still has F on every
%% "and" - it is not part of the figure.
%%
%% CLASH: the figure has a MAJOR 3rd (A over F). Transposed onto the
%% m7 chords it plays Bb over Gbm7, B over Gm7, C over Abm7 and so on -
%% a major 3rd against a minor chord, on beat 3 of every other bar.
%% Either the chords are dominant (Gb7 G7 Ab7 ...) or the figure's 3rd
%% flattens there. Left as-is, unresolved.
%%
%% From Abm7 (bar 49) the figure changes to a ONE-bar root-and-4th
%% pattern (climbFig), one per bar, rising with the chords:
%%   Ab (q)  Db (8)  Ab (8~8)  Db (8~8)  rest (8)
%% Both off-beat notes are tied eighths, so beats 3 AND 4 are shown -
%% a plain quarter on the "and" of 3 read as if it were on the beat.
%% No 3rd in it, so bars 49-56 no longer carry the CLASH above - it
%% remains in 41-48 (Gbm7, Gm7).
%%
%% The C7 bars (57-60) are upbeats on the high C - 16 in a row, no
%% downbeats (the export's octave figure is gone) - and 61-68 return
%% to the lick as the Release (4 bars); climbFig stops at Bm7.
%%
%% HEAD (65-80) and SOLO 2 (81-96), repeated as one 32-bar unit.
%% The head is in F (see KEY in the changes file). The bass pedals
%% low F eighths - the root - through it. Solo 2 goes back to the
%% lick in F, the same figure the Coda vamps on.
%% The hits (75, 79, and again at 101, 105) climb F Bb C - the last
%% one is the 5th of F7, not the root, so the figure rises. See the changes file for
%% the rests in 76, 78 and 80.
%%
%% ROADMAP: segno on bar 37 (Build), To Coda after bar 80, "Last time
%% D.S. al Coda" after Solo 2. Coda (97-100) is the lick in F, vamped.

\header {
  title = "Compared to What"
  subtitle = "Bass"
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

%% Beat 3 is shown: the "and of 2" Eb is two tied eighths, not a
%% quarter straddling the middle of the bar.
lick    = { ees8 ees8 des8 ees8~ ees8 bes,4 des8 }
lickD   = \transpose ees d  \lick
lickF   = \transpose ees f  \lick
lickGb  = \transpose ees ges \lick
lickG   = \transpose ees g  \lick
lickAb  = \transpose ees aes \lick
lickA   = \transpose ees a  \lick
lickBb  = \transpose ees bes \lick
lickB   = \transpose ees b  \lick

%% bar 20 - Eb lick's front half, D lick's back half (see header)
mTwenty = { ees8 ees8 des8 ees8 r8 a,4 c8 }

%% C7 bars - upbeats only, on the high C (the export's upper octave)
cUps = { r8 c'8 r8 c'8 r8 c'8 r8 c'8 }

%% Head - pedal, and the hit figure (bars 75 and 79)
pedal  = { f,8 f,8 f,8 f,8 f,8 f,8 f,8 f,8 }
hits   = { f,4. bes,8~ bes,4 c4 }
hitsEnd = { f,4. bes,8~ bes,4 c4\fermata }   %% the last bar of the tune

%% bar 36 - the lick's F on 1, then ups on low F (see BUILD)
mThirtySix = { f8 f,8 r8 f,8 r8 f,8 r8 f,8 }

%% the Build's two-bar climb, in F: 1 . 3 . | 4 5 . up 5, up 1
buildFig   = { f,4 r4 a,4 r4 | bes,4. c8 r8 c8 r8 f,8 }
buildGb    = \transpose f ges \buildFig
buildG     = \transpose f g   \buildFig

%% from Abm7 on - one bar, root and 4th, in Ab (see BUILD)
climbFig   = { aes,4 des8 aes,8~ aes,8 des8~ des8 r8 }
climbA     = \transpose aes a   \climbFig
climbBb    = \transpose aes bes \climbFig
climbB     = \transpose aes b   \climbFig

bass = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "Intro" }
  \repeat volta 2 { \lick \lick \lick \lick }
  \break

  \mark \markup { \bold \box "Solo" }
  \repeat volta 2 {
    \lick \lick \lick \lick \break
    \lick \lick \lick \lick
  }
  \break
  \lick \lick \lick \lick \break
  \lick \lick \lick \mTwenty \bar "||" \break

  \lickD \lickD \lickD \lickD \break
  \lickD \lickD \lickD \lickD \bar "||" \break

  \lickF \lickF \lickF \lickF \break
  \lickF \lickF \lickF \mThirtySix \bar "||" \break

  \segnoMark \default
  \mark \markup { \bold \box "Build" }
  \buildFig \buildFig \break      %% 37-40  F7
  \buildGb \buildGb \break        %% 41-44  Gbm7
  \buildG \buildG \break          %% 45-48  Gm7
  \climbFig \climbFig \climbA \climbA \break   %% 49-52  Abm7 Am7
  \climbBb \climbBb \climbB \climbB \break     %% 53-56  Bbm7 Bm7
  \cUps \cUps \cUps \cUps \bar "||" \break   %% 57-60  C7

  \mark \markup { \bold \box "Release" }
  \lickF \lickF \lickF \lickF \break    %% 61-64
  %% no \bar "||" here - it would eat the Head's repeat-start

  \repeat volta 2 {
    \mark \markup { \bold \box "Head" }
    \pedal \pedal \pedal \pedal \break                 %% 65-68
    \pedal \pedal \pedal \pedal \break                 %% 69-72
    \pedal \pedal \hits r1 \break                       %% 73-76
    f,4 r2. | r1 | \hits |                              %% 77-79
    \textMark \markup { \italic "Solo break" }
    r1                                                  %% 80
    %% To Coda sits on the barline after 80 (marks attach to the
    %% following bar, and at the \break it draws on this system).
    \codaMark 1
    \textEndMark \markup { \italic "To Coda" }
    \bar "||" \break

    \mark \markup { \bold \box "Solo 2" }
    \lickF \lickF \lickF \lickF \break                 %% 81-84
    \lickF \lickF \lickF \lickF \break
    \lickF \lickF \lickF \lickF \break
    \lickF \lickF \lickF \lickF                         %% 93-96
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
  \repeat volta 2 { \lickF \lickF }                   %% 97-98
  \alternative {
    { \lickF \lickF }                                 %% 99-100
    {
      \break   %% the 2nd ending gets its own system
      \textMark \markup { \italic "Last time" }
      \hits r1                                         %% 101-102
      f,4 r2. | r1 | \hitsEnd                          %% 103-105
    }
  }
  \bar "|."
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \changes }
    \new Staff { \bass }
  >>
  \layout {
    indent = 0
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  \unfoldRepeats << \new ChordNames \changes \new Staff \bass >>
  \midi { }
}
