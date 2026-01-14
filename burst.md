# Burst (.bst) Language

This document describes the Burst (.bst) file format implemented by `burst.k` in KeyKit. It includes a full spec, a user guide, and a quick reference. Examples are taken from `bst/_BURST_DEMO.bst`.

## Overview

A `.bst` file is made of 4 sections separated by `%`:

1. **Sequence**: how parts are ordered/combined.
2. **Scales/Chords**: named scales and chord mappings.
3. **Parts**: definitions of parts, each containing bursts.
4. **Variations**: optional transformation expressions.

The parser reads the whole file as a single string with comments removed and whitespace normalized.

## Preprocessing

Preprocessing happens before parsing **only if the file does not start with `%`**.

- **Includes**: `include <path>;` is text-replaced in place.
- **Macros**: lines at the very beginning, starting with `#NAME=VALUE`, are collected and applied as simple string substitution to the rest of the file (section text only).

If the file starts with `%`, preprocessing is skipped entirely.

## Lexical Rules

- Comments: `// ...` to end of line.
- Whitespace: spaces, tabs, newlines are normalized to spaces.
- Identifiers (symbols): letters, digits, underscore; must start with a letter.
- Numbers: `123`, `-4`, `0.5`, `-3.25`.

## Full Grammar (EBNF)

The grammar below mirrors `burst.k` behavior.

```ebnf
bst_file ::= [prelude] sequence "%" scales "%" parts "%" variations ;

prelude ::= { macro_line | include_stmt } ;
macro_line ::= "#" symbol "=" macro_value ;
macro_value ::= { macro_char } ;
macro_char ::= ? any char except newline ? ;

include_stmt ::= "include" space file_path ";" ;
file_path ::= file_char { file_char } ;
file_char ::= ? any char except ";" ? ;

sign ::= "+" | "-" ;
digit ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
hex_digit ::= digit | "A" | "B" | "C" | "D" | "E" | "F" | "a" | "b" | "c" | "d" | "e" | "f" ;
octal_digit ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" ;
letter ::= "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z"
         | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" ;
symbol ::= letter { letter | digit | "_" } ;
space ::= " " ;

integer ::= [sign] digit {digit} ;
number ::= [sign] digit {digit} [ "." digit {digit} ] ;

intseq ::= integer { space integer } ;
floatseq ::= number { space number } ;

sequence ::= seq_chain { "--" seq_chain } ;
seq_chain ::= seq_simul { "||" seq_simul } ;
seq_simul ::= seq_item { "," seq_item } ;
seq_item ::= partid_list [ ":" chordid ] ;
partid_list ::= partid { "|" partid } ;

scales ::= chord_entry { ";" chord_entry } [ ";" ] ;
chord_entry ::= chordid "," scale_spec "," transpose "," segmentation ;
chordid ::= symbol ;
scale_spec ::= scale_char { scale_char } ;
scale_char ::= ? any char except "," and ";" ? ;
transpose ::= number ;
segmentation ::= number { space number } [ ":" [number] [space number] ] ;

parts ::= part { ">>" part } ;
part ::= part_header ";" { burst } ;
part_header ::= [binprefix] partid [space length] ;
partid ::= symbol ;
length ::= integer ;
binprefix ::= "x" | "o" | "X" integer | "O" integer ;

burst ::= m_burst | s_burst | b_burst | d_burst | r_burst | p_burst | c_burst | t_burst ;

m_burst ::= "@" mode_m header_common ";" m_lines ;
s_burst ::= "@" mode_s header_common ";" s_lines ;
b_burst ::= "@" mode_b header_common ";" b_lines ;
d_burst ::= "@" mode_d header_common ";" d_lines ;
r_burst ::= "@" mode_r header_common ";" r_lines ;

mode_m ::= [binprefix] "m" ;
mode_s ::= [binprefix] "s" ;
mode_b ::= [binprefix] "b" ;
mode_d ::= [binprefix] "d" ;
mode_r ::= [binprefix] "r" ;

header_common ::= channel space init_spec space constant [ "::" commands ] ;
channel ::= integer ;
constant ::= number ;

init_spec ::= init_m | init_s | init_d | init_r ;
init_m ::= pitch_list | pitch_range ;
init_s ::= "all" | pitch_list ;
init_d ::= "all" | pitch_list ;
init_r ::= integer ;

pitch_list ::= integer { "+" integer } ;
pitch_range ::= integer "-" integer ;

burst_marker ::= "s" ;
burst_repeat ::= "rep" space integer ;

period ::= rhythm_list [ ":" period_mods ] ;
period_mods ::= number [ space number [ space number [ space number ] ] ] ;
rhythm_list ::= intseq | bin_pattern ;

duration ::= duration_list [ ":" number ] ;
duration_list ::= intseq | floatseq | "l" ;

m_lines ::= (m_line | burst_marker | burst_repeat) { ";" (m_line | burst_marker | burst_repeat) } [ ";" ] ;
m_line ::= length "," period [ "," duration ] [ "," m_intervals ] ;

s_lines ::= (s_line | burst_marker | burst_repeat) { ";" (s_line | burst_marker | burst_repeat) } [ ";" ] ;
s_line ::= length "," period [ "," duration ] [ "," intseq ] ;

b_lines ::= (b_line | burst_marker | burst_repeat) { ";" (b_line | burst_marker | burst_repeat) } [ ";" ] ;
b_line ::= length "," period [ "," duration ] [ "," intseq ] ;

d_lines ::= (d_line | burst_marker | burst_repeat) { ";" (d_line | burst_marker | burst_repeat) } [ ";" ] ;
d_line ::= length "," period [ "," duration ] ;

r_lines ::= (r_line | burst_marker | burst_repeat) { ";" (r_line | burst_marker | burst_repeat) } [ ";" ] ;
r_line ::= length "," period "," floatseq ;

m_intervals ::= interval_spec [ "," interval_spec ] [ "," sas_list ] ;
interval_spec ::= interval_list [ ":" [number] [space number] ] ;
interval_list ::= "#" number { space number } | number { space number } ;
sas_list ::= number { space number } ;

bin_pattern ::= xpattern | opattern | Xpattern | Opattern ;
xpattern ::= hex_word { space hex_word } ;
hex_word ::= hex_digit hex_digit ;
opattern ::= octal_word { space octal_word } ;
octal_word ::= octal_digit octal_digit ;
Xpattern ::= hex_wordN { space hex_wordN } ;
hex_wordN ::= hex_digit { hex_digit } ;
Opattern ::= octal_wordN { space octal_wordN } ;
octal_wordN ::= octal_digit { octal_digit } ;

p_burst ::= "@" [binprefix] p_mode space channel space velocity space offset [ ":" commands ] ";" p_lines ;
p_mode ::= "pd" | "pm" ;
velocity ::= integer ;
offset ::= integer ;

p_lines ::= p_line { ";" p_line } [ ";" ] ;
p_line ::= length "," p_rhythms "," p_pitches ;
p_rhythms ::= rhythm_spec { "," rhythm_spec } ;
p_pitches ::= pitch_seq { "," pitch_seq } ;
rhythm_spec ::= intseq | bin_pattern ;
pitch_seq ::= intseq ;

c_burst ::= "@c" space channel space ctlno space length ";" lfo_defs ;
ctlno ::= integer ;
lfo_defs ::= lfo_def { ";" lfo_def } [ ";" ] ;
lfo_def ::= lfo_chain | lfo_set | lfo_spec ;
lfo_chain ::= ("add" | "am" | "fm") "," lfoid "," lfoid ;
lfo_set ::= "set" "," number ;
lfo_spec ::= lfoid "," shape "," period_num "," offset_num "," amp_num "," phase_num [ "," waveshaping_fn ] ;

lfoid ::= symbol ;
shape ::= integer ;
period_num ::= number ;
offset_num ::= number ;
amp_num ::= number ;
phase_num ::= number ;
waveshaping_fn ::= waveshaping_char { waveshaping_char } ;
waveshaping_char ::= ? any char except ";" and "," ? ;

t_burst ::= "@t" space length ";" tempo_defs ;
tempo_defs ::= tempo_def { ";" tempo_def } [ ";" ] ;
tempo_def ::= tempo_chain | tempo_set | tempo_swing | tempo_lfo ;

tempo_chain ::= ("add" | "am" | "fm") "," lfoid "," lfoid ;
tempo_set ::= "set" "," bpm ;
tempo_swing ::= "swing" "," bpm "," swingpercent ;
tempo_lfo ::= lfoid "," shape "," period_num "," offset_num "," amp_num "," phase_num ;

bpm ::= number ;
swingpercent ::= number ;

variations ::= variation { ">>" variation } ;
variation ::= variation_header ";" variation_stmt { ";" variation_stmt } [ ";" ] ;
variation_header ::= [binprefix] partid [space length] ;
variation_stmt ::= variation_expr ;
variation_expr ::= { variation_char } ;
variation_char ::= ? any char except ";" ? ;

commands ::= command { "," command } ;
command ::= symbol { space command_arg } ;
command_arg ::= number | symbol | quoted_string ;
quoted_string ::= "\"" { quoted_char } "\"" ;
quoted_char ::= ? any char except "\"" ? ;
```

## Semantics

### 1) Sequence Section

Defines how parts are assembled.

- `,` concatenates in time.
- `||` overlays in parallel.
- `--` separates blocks that play one after another.
- `|` mixes multiple part IDs before optional chord mapping.
- `:ChordID` applies a chord mapping to melodic material.

Example:
```
TEMPO : ALL --
M : S1 --
xM : S2 || xD|xR:ALL --
```

### 2) Scales/Chords Section

Defines named scales and chord mappings.

Each entry:
```
<ChordID>, <ScaleSpec>, <Transpose>, <Segmentation>;
```

Example:
```
S1, 05-39.09, 0, 8;
ALL, 12-01.00, 0, 32;
```

`scale_spec` is passed to `new scale(...)`. The string content is left as-is.

`segmentation` is a list of numbers, optionally with a `:mul rot` suffix.

### 3) Parts Section

Defines parts. Each part begins with:
```
>> [binprefix] <PartID> [Length];
```

If length is present, all phrase subparts are forced to that length.

Binary prefix at part level sets the default `Bpn` (bits per note) and `Td`:
- `x` -> hex (8 bits)
- `o` -> octal (6 bits)
- `Xn`/`On` -> custom bits per word

### 4) Bursts

Bursts are typed by their mode character:

- `m`: melodic
- `s`: scale-step sequence
- `b`: binary-pitch sequence
- `d`: drum hits
- `r`: rhythm-only hits
- `pd` / `pm`: strat-based rhythmic/pitch blocks
- `c`: controller LFOs
- `t`: tempo LFOs / set / swing

The `@` header selects the burst type, then parameters, then the data lines.

#### m/s/b/d/r Headers

```
@<mode> <channel> <init> <constant> [:: commands];
```

Examples:
```
@m 1 20 120;
@d 10 100 36;
@r 10 100 42 :: velmod 3 8 0.75 0;
```

- `channel`: MIDI channel (int)
- `init`: depends on mode
  - `m`: pitch list (`20+2+2`) or range (`20-24`)
  - `s`: `all` or list
  - `d`: `all` or list
  - `r`: integer velocity
- `constant`: used as volume or pitch depending on mode
- `commands`: post-processing commands applied to the phrase

#### m/s/b/d/r Lines

All share:
```
<len>, <period> [, <duration>] [, <extra>];
```

`period` is a rhythm list, optionally with modifiers:
```
<pattern> : <multi> <rotInt> <rot> <transla>;
```

`pattern` can be `intseq` or a binary pattern (see below).

`duration`:
```
l
l:0.5
4 2 2 : 0.5
```

##### m-mode extra (intervals)

```
<intervals> [, <intervals2>] [, <sas>]
```

Intervals allow:
```
# a b c
1 2 3
1 2 3 : mul rot
```

##### s/b-mode extra

Sequence of integers (as a list).

##### r-mode

`duration` is required and uses float numbers. Example:
```
48, A8 A8, 1 0.5 2 0 0.5 2;
```

##### Marker and repeat lines

```
s;
rep 2;
```

Marker `s` resets the repeat anchor. `rep N` repeats the previous block.

#### Binary Patterns

Binary patterns are represented in base-16 or base-8 blocks.

- `x` prefix -> hex words (`CA FE`)
- `o` prefix -> octal words (`74 40`)
- `Xn`/`On` -> custom word sizes

Examples:
```
128, CA FE, l:0.5, -2 -1 1 1 2 2 -1;
96, 74 40, l:0.5, -1 -2 1 1 1;
```

#### p-bursts (`pd` / `pm`)

```
@pd <chan> <velocity> <offset> [: commands];
<len>, <rhythms...>, <pitches...>;
```

The line encodes multiple rhythmic levels and matching pitch lists.
The number of rhythm blocks must match the number of pitch blocks.

Example:
```
@opm 1 100 25;
96, 40 55 40 55 40 55 40 66:2, 66 60, 1 1 1 -2 -2, 1 1 1 -2 -2 1;
```

#### c-bursts (`@c`)

Controller LFOs:

```
@c <chan> <ctl> <len>;
<id>, <shape>, <period>, <offset>, <amp>, <phase>[, <waveshape>];
add|am|fm, <src>, <dst>;
set, <value>;
```

Shapes:
```
0 sine, 1 square, 2 triangle, 3 saw, 4 reverse saw, 5 random
```

#### t-bursts (`@t`)

Tempo LFOs or direct tempo:

```
@t <len>;
set, <bpm>;
swing, <bpm>, <percent>;
<id>, <shape>, <period>, <offset>, <amp>, <phase>;
```

### 5) Variations Section

Variation entries are chunks evaluated by `evalstring` after substitution:

```
>> VARIATION1;
rhythmictransform(?xM!|?xD!|?xR!, 32, 3);
```

Special macros:
- `?PART!` expands to `P["PART"]["<track>"]` for each track type (`___drum_part`, `___ctl_part`, `___tempo_part`, `___melodic`).

## User Guide

### Minimal File

```
% SEQ % SCALES % PARTS % VARIATIONS
```

All sections must exist, even if empty.

### Example from demo

```
% 
TEMPO : ALL --
M : S1 --
REST:ALL --
xM : S2 --
% 
S1, 05-39.09, 0, 8;
ALL, 12-01.00, 0, 32;
%
>> xTEMPO 16;
@t;
set, 120;
```

### Binary Prefix Tips

- Use `x` for hex rhythms (8-bit words).
- Use `o` for octal rhythms (6-bit words).
- Use `Xn` or `On` for custom word widths, e.g. `X6` = 24 bits per word.

### Chord Mapping

Attach a chord ID in the sequence:
```
M : S1
xD|xR : ALL
```

Only the melodic part (`___melodic`) is chord-mapped.

## Quick Reference

### File Structure

- `%` separated sections: `sequence % scales % parts % variations`
- `//` comments, whitespace ignored

### Sequence Operators

- `,` concatenate
- `||` overlay
- `--` new chain
- `|` mix parts
- `:ChordID` apply chord mapping

### Burst Headers

- `@m chan init const [:: commands];`
- `@s chan init const [:: commands];`
- `@b chan init const [:: commands];`
- `@d chan init const [:: commands];`
- `@r chan init const [:: commands];`
- `@pd chan vel offset [: commands];`
- `@pm chan vel offset [: commands];`
- `@c chan ctl len;`
- `@t len;`

### Line Forms

- `len, period [, duration] [, extra];`
- `s;` (marker)
- `rep N;` (repeat)

### Period and Duration

- `period`: `intseq` or binary pattern, optional `: multi rotInt rot transla`
- `duration`: `intseq` or `floatseq` or `l` (period copy), optional `: scale`

### Binary Patterns

- `x`: hex bytes `CA FE`
- `o`: octal bytes `74 40`
- `Xn`/`On`: custom word size

### Commands

Commands are function calls applied after burst generation:
```
:: velmod 3 8 0.75 0, transpose 12
```

## Open Questions / Implementation Notes

- `scale_spec` is passed as a raw string to `new scale(...)`. The exact allowed syntax depends on KeyKit's scale constructor, not Burst.
- Some derived behaviors (length clamping, chord conversion, binary period normalization) are implemented by `burst.k` and may not be trivially portable.
