#!/usr/bin/env python3
"""Regenerate the individual part files from killing-in-the-name.ly.

The master holds every music definition; each part is that same music plus its
own header and \score block. Edit the master, then run this.
"""
import pathlib, re, sys

HERE = pathlib.Path(__file__).parent
MASTER = HERE / "killing-in-the-name.ly"

PARTS = {
    "sax": ("Sax (Bari, E-flat)", """\\score {
  <<
  \\new ChordNames { \\transpose ees, c' \\chordPart }
  \\new Staff = "main" \\with { instrumentName = "Sax" } <<
    \\new Voice { \\saxPart }
    \\new NullVoice = "vox" { \\voxPart }
  >>
  \\new Lyrics \\with { alignAboveContext = "main" }
    \\lyricsto "vox" { \\voxLyrics }
  >>
  \\layout {
    \\context { \\Staff \\override TimeSignature.style = #'numbered }
    \\context { \\DrumStaff \\override TimeSignature.style = #'numbered }
    \\context { \\RhythmicStaff \\override TimeSignature.style = #'numbered }
  }
}"""),
    "bass": ("Bass", """\\score {
  <<
  \\new ChordNames { \\chordPart }
  \\new Staff = "main" \\with { instrumentName = "Bass" } <<
    \\new Voice { \\bassPart }
    \\new NullVoice = "vox" { \\voxPart }
  >>
  \\new Lyrics \\with { alignAboveContext = "main" }
    \\lyricsto "vox" { \\voxLyrics }
  >>
  \\layout {
    \\context { \\Staff \\override TimeSignature.style = #'numbered }
    \\context { \\DrumStaff \\override TimeSignature.style = #'numbered }
    \\context { \\RhythmicStaff \\override TimeSignature.style = #'numbered }
  }
}"""),
    "drums": ("Drums", """\\score {
  <<
  \\new ChordNames { \\chordPart }
  \\new DrumStaff = "main" \\with { instrumentName = "Drums" \\accepts NullVoice } <<
    \\new DrumVoice { \\voiceOne \\drumsUp }
    \\new DrumVoice { \\voiceTwo \\drumsDown }
    \\new NullVoice = "vox" { \\voxPart }
  >>
  \\new Lyrics \\with { alignAboveContext = "main" }
    \\lyricsto "vox" { \\voxLyrics }
  >>
  \\layout {
    \\context { \\Staff \\override TimeSignature.style = #'numbered }
    \\context { \\DrumStaff \\override TimeSignature.style = #'numbered }
    \\context { \\RhythmicStaff \\override TimeSignature.style = #'numbered }
  }
}"""),
    "guitar": ("Guitar", """\\score {
  <<
  \\new ChordNames { \\chordPart }
  \\new Staff = "main" \\with { instrumentName = "Guitar" } <<
    \\new Voice { \\guitarPart }
    \\new NullVoice = "vox" { \\voxPart }
  >>
  \\new Lyrics \\with { alignAboveContext = "main" }
    \\lyricsto "vox" { \\voxLyrics }
  >>
  \\layout {
    \\context { \\Staff \\override TimeSignature.style = #'numbered }
    \\context { \\DrumStaff \\override TimeSignature.style = #'numbered }
    \\context { \\RhythmicStaff \\override TimeSignature.style = #'numbered }
  }
}"""),
}

TEMPLATE = '''\\version "2.24.0"

%% "Killing In the Name" - {sub} part
%% Generated from killing-in-the-name.ly by gen-parts.py; edit the master, not this.

\\header {{
  title = "Killing In the Name"
  subtitle = "{sub}"
  tagline = ##f
}}

%% Staff size matched to the score; the lyric line needs the room.
#(set-global-staff-size 16)
\\paper {{ ragged-last-bottom = ##f }}

{music}
{score}
'''


def shared_music(master_text):
    start = master_text.index("swing = \\markup {")
    end = master_text.index("\\score {")
    block = master_text[start:end]
    # The parts set their own staff size.
    block = re.sub(r"%%[^\n]*staff size[^\n]*\n%%[^\n]*\n#\(set-global-staff-size \d+\)\n", "", block)
    return block.strip("\n")


def main():
    text = MASTER.read_text()
    music = shared_music(text)
    assert "set-global-staff-size" not in music, "staff size leaked into the shared block"
    for name, (sub, score) in PARTS.items():
        out = HERE / f"killing-in-the-name-{name}.ly"
        if out.exists():
            (HERE / f"killing-in-the-name-{name}.ly.prev").write_text(out.read_text())
        out.write_text(TEMPLATE.format(sub=sub, music=music, score=score))
        print("wrote", out.name)


if __name__ == "__main__":
    sys.exit(main())
