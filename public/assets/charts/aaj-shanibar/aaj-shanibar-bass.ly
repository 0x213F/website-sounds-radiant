\version "2.24.0"

%% "Aaj Shanibar" - BASS
%%
%% The four-bar phrase, transcribed from the Logic export
%% ("Aaj Shanibar.mid", the five identical "Vintage Soul" tracks).
%% Nothing here is invented: every pitch and rhythm is what was played,
%% read off the MIDI at 480 ppq and quantised to eighths, which is what
%% it already was to within about a 30th of a beat.
%%
%% It loops. In the arrangement it just repeats every four bars under
%% the Intro, the vamp and the head.
%%
%% CHORDS match the lead sheet, and the line fits them exactly - the
%% whole phrase uses C D Eb F F# G A B and nothing else, which is
%% precisely Cm(maj7) plus D7. Bars 1-2 spell the C minor chord (bar 2
%% descends F Eb D C and lands on the B natural, the major 7th); bars
%% 3-4 spell the D7 (bar 3 is D G F# G A D, a D major triad outright).
%%
%% This is what settled the tune's harmony: the chart used to run
%% D7/A first and Cm(maj7)/B second, which put this line's F natural
%% against D7's F#. Rotating the cycle made every note a chord tone.
%%
%% REGISTER: written exactly as played, C3 up to F4. That is a tenor
%% register, not a bass one - the top of it sits only a 6th below the
%% melody. Play it an octave down if it is meant to be the floor of
%% the arrangement.

\header {
  title = "Aaj Shanibar"
  subtitle = "Bass"
  composer = "Rupa"
  tagline = ##f
}

#(set-global-staff-size 22)
\paper {
  ragged-last-bottom = ##t
  ragged-right = ##f
  top-margin = 0.7\in
  paper-height = 5.5\in
  paper-width  = 8.5\in
}

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 127
}

%% Split exactly like the staff - \repeat volta is notational, so an
%% unrepeated chord part would drift out of alignment on the page.
bassChords = \chordmode {
  \repeat volta 2 {
    c1:m7+/b  c:m7+/b      %% bars 1-2
    d1:7/a    d:7/a        %% bars 3-4
  }
}

bass = {
  \global
  \clef bass
  %% Two bars a system. The line runs C3 to F4, so the top third of it
  %% needs ledger lines; crammed onto one system it is unreadable.
  \repeat volta 2 {
  %% bar 1 - root, 5th, octave, then down through the b3
  c8   g8   c'8  r8    d'8  ees'8 g8   c8   |
  %% bar 2 - the 11 on 2, then F Eb D C landing on the major 7th,
  %%   which is held across the barline
  r4        f'4         ees'8 d'8   c'8  b8~ |
  \break
  %% bar 3 - D major outlined: D, then F# G A back down to D
  b8   d'8  g8   r8    fis8 g8    a8   d8~  |
  %% bar 4 - sits on the b7 and root of D7
  d8   r8   c8   b,8   c8   d8    c4        |
  }
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \bassChords }
    \new Staff { \bass }
  >>
  \layout { indent = 0 }
}

\score { \unfoldRepeats << \new ChordNames \bassChords \new Staff \bass >> \midi { } }
