%% "Compared to What" - the changes, in CONCERT pitch.
%%
%% Shared by compared-to-what-bass.ly (as is) and
%% compared-to-what-tenor.ly (via \transpose bes c in its \score).
%% Edit the harmony HERE, once. The repeat structure below must stay
%% in step with both parts' staves - see GOTCHAS.md #1.
%%
%% FORM (notated bars):
%%   Intro   1-4    Eb        the lick x4, repeated
%%   Solo    5-12   Ebm       repeated
%%           13-20  Eb7       bar 20 turns to Dm on beat 3
%%           21-28  Dm
%%           29-36  F7
%%   Build   37-40  F7
%%           41-44  Gbm7
%%           45-48  Gm7
%%           49-56  Abm7 Am7 Bbm7 Bm7, two bars each
%%           57-60  C7        bass on the upbeats, high C
%%   Release 61-64  F7        back on the lick
%%   Head    65-80  F7        lyrics only - no melody written. Bass
%%                            pedals F eighths 65-74, then the hits:
%%                            75 & 79  F7 (dotted q) Bb7 (8~q) F7 (q)
%%                            76 N.C.   77 F7 on 1, vocal break
%%                            78 rest   80 solo break
%%   Solo 2  81-96  F7        16 bars; 65-96 (32 bars) repeated
%%   Last time: D.S. al Coda. The segno is on bar 37 (Build). Play
%%   through the Build, Release and the Head, then at the end of the
%%   Head (bar 80) jump:
%%   Coda    97-98  F7        the lick in F, vamped
%%           99-100           1st ending - lick, back to 97
%%           101-105          2nd ending - bars 75-79 again, the hits,
%%                            fermata on the last F7. End.
%%
%% KEY: the head is in F - the original key. The Real Book chart it was
%% taken from is a whole step up (G7 / C7), so everything from it is
%% transposed down: G7 -> F7, C7 -> Bb7. The Coda was specified as a
%% G7 vamp before that came to light; moved to F with the rest.
%%
%% The head's hits come from the Real Book chart (bars 11-16 of its
%% 16-bar form). Bars 76, 78 and 80 follow it too: N.C., the rest of
%% the vocal break, and the solo break.

changes = \chordmode {
  %% Intro. Written as plain Eb, as asked - the lick's Db would also
  %% support Eb7 if that is what the band actually hears here.
  \repeat volta 2 { ees1 ees ees ees }

  %% Solo
  \repeat volta 2 { \repeat unfold 8 ees1:m }
  \repeat unfold 7 ees1:7
  ees2:7 d2:m                 %% bar 20 - Dm on the last two beats
  \repeat unfold 8 d1:m
  \repeat unfold 8 f1:7

  %% Build - the roots climb chromatically, as in the Logic export.
  %% Qualities from Gb up are m7 throughout (from "Ab minor seven").
  %% The bass's build figure now has a MAJOR 3rd, which contradicts
  %% the Gbm7 and Gm7 - see BUILD in compared-to-what-bass.ly. From
  %% Abm7 the bass plays root and 4th only, so no clash there.
  \repeat unfold 4 f1:7
  \repeat unfold 4 ges1:m7
  \repeat unfold 4 g1:m7
  aes1:m7 aes:m7  a:m7 a:m7  bes:m7 bes:m7  b:m7 b:m7
  %% C7: the V of F, setting up the return. The bass drops to upbeats
  %% on C here (the export had C octaves).
  \repeat unfold 4 c1:7
  \repeat unfold 4 f1:7        %% Release

  \repeat volta 2 {
    %% Head
    \repeat unfold 10 f1:7                 %% 65-74
    %% F7 reprinted on 1 for redundancy - chordChanges would hide it
    \once \set chordChanges = ##f
    f4.:7 bes4.:7 f4:7                     %% 75 - hits
    r1                                     %% 76 - N.C.
    f1:7 f1:7                              %% 77-78
    %% F7 reprinted on 1 for redundancy - chordChanges would hide it
    \once \set chordChanges = ##f
    f4.:7 bes4.:7 f4:7                     %% 79 - hits
    f1:7                                   %% 80 - solo break
    %% Solo 2
    \repeat unfold 16 f1:7                 %% 81-96
  }

  %% Coda
  %% mirrors the staves: 2 bars + 1st ending (2) / 2nd ending (5)
  \repeat volta 2 { f1:7 f:7 }            %% 97-98
  \alternative {
    { f1:7 f:7 }                           %% 99-100
    {
      \once \set chordChanges = ##f
      f4.:7 bes4.:7 f4:7                   %% 101 = 75
      r1                                   %% 102 = 76, N.C.
      f1:7 f1:7                            %% 103-104 = 77-78
      \once \set chordChanges = ##f
      f4.:7 bes4.:7 f4:7                   %% 105 = 79, fermata
    }
  }
}
