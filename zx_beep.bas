rem 'zx_beep' procedure for S*BASIC
rem that simulates the ZX Spectrum's 'beep' command

rem Version 0.1.0+201709180046

' Author: Marcos Cruz (programandala.net), 2017

' ==============================================================
' License

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

' ==============================================================
' Credit

' The required information was found in the following
' files, from Dilwyn Jones' website:
'
' - <http://www.dilwyn.me.uk/docs/articles/beeps.pdf>, anonymous.
'
' - <http://www.dilwyn.me.uk/sound/music.zip>, by Dilwin Jones.
'
' - <http://www.dilwyn.me.uk/sound/playscale.zip>, by Mark Swift
'   (1993) and Simon N. Goodwin (1994).

' ==============================================================
' Usage example

' ----
' merge zx_beep_bas
' init_zx_beep
' zx_beep seconds,pitch
' ----

' Where "seconds" and "pitch" are the parameters
' accepted by ZX Spectrum's 'beep' command.

' ==============================================================

defproc zx_beep(duration,tone)

  beep duration*500000/72,ql_pitch%(tone+zx_middle_c_offset)
  repeat zx_beep_wait
    if not beeping:exit zx_beep_wait
  endrep zx_beep_wait

enddef

defproc init_zx_beep

  loc i,pitchs%,pitchs_per_data%,middle_c_hz

  let middle_c_hz=261.60
  let pitchs_per_data%=6
  let pitchs%=\
    (@zx_beep_pitch_end-@zx_beep_pitch)*pitchs_per_data%

  dim ql_pitch%(pitchs%-1)
  restore @zx_beep_pitch

  for i=0 to pitchs%-1
    read hz
    if hz=middle_c_hz:\
      let zx_middle_c_offset=i:\
      print "middle C -->" ' XXX INFORMER
    let ql_pitch%(i)=11447/hz-10.6
    print i,ql_pitch%(i):pause ' XXX INFORMER
  endfor i

enddef

@zx_beep_pitch

data 0016.35, 0017.32, 0018.35, 0019.45, 0020.60, 0021.83
data 0023.12, 0024.50, 0025.96, 0027.50, 0029.14, 0030.87
data 0032.70, 0034.65, 0036.71, 0038.89, 0041.20, 0043.65
data 0046.25, 0049.00, 0051.91, 0055.00, 0058.27, 0061.74
data 0065.41, 0069.30, 0073.42, 0077.78, 0082.41, 0087.31
data 0092.50, 0098.00, 0103.80, 0110.00, 0116.50, 0123.50
data 0130.80, 0138.60, 0146.80, 0155.60, 0164.80, 0174.60
data 0185.00, 0196.00, 0207.70, 0220.00, 0233.10, 0246.90
data 0261.60, 0277.20, 0293.70, 0311.10, 0329.60, 0349.20
data 0370.00, 0392.00, 0415.30, 0440.00, 0466.20, 0493.90
data 0523.30, 0554.40, 0587.30, 0622.30, 0659.30, 0698.50
data 0740.00, 0784.00, 0830.60, 0880.00, 0932.30, 0987.80
data 1047.00, 1109.00, 1175.00, 1245.00, 1319.00, 1397.00
data 1480.00, 1568.00, 1661.00, 1760.00, 1865.00, 1976.00
data 2093.00, 2217.00, 2349.00, 2489.00, 2637.00, 2794.00
data 2960.00, 3136.00, 3322.00, 3520.00, 3729.00, 3951.00
data 4186.00, 4435.00, 4699.00, 4978.00, 5274.00, 5588.00
data 5920.00, 6272.00, 6645.00, 7040.00, 7459.00, 7902.00

@zx_beep_pitch_end

' ==============================================================

' XXX TODO -- New data.

' frequency approx = 11447/(10.6+pitch)
'     pitch approx = 11447/freq-10.6

' Frequency       BEEP    Note

' 440     15      A 
' 415.3   17      G#
' 391.99  19      G 
' 369.99  20      F#
' 349.22  22      F 
' 329.62  24      E 
' 311.12  26      D#
' 293.66  28      D 
' 277.18  31      C#
' 261.62  33      C 
' 246.94  36      B 
' 233.08  39      A#
' 220     41      A 
' 207.65  45      G#
' 195.99  48      G 
' 184.99  51      F#
' 174.61  55      F 
' 164.81  59      E 
' 155.56  63      D#
' 146.83  67      D 
' 138.59  72      C#
' 130.81  77      C 
' 123.47  82      B 
' 116.54  88      A#
' 110     93      A 
' 103.82  100     G#
' 97.99   106     G 
' 92.49   113     F#
' 87.3    121     F 
' 82.4    128     E 
' 77.78   137     D#
' 73.41   145     D 
' 69.29   155     C#
' 65.4    164     C 
' 61.73   175     B 
' 58.27   186     A#
' 55      198     A 
' 51.91   210     G#
' 48.99   223     G 
' 46.24   237     F#
' 43.65   252     F 

' a    41
' a#   38
' b    36
' c    33 (middle C)
' c#   31
' d    28
' d#   26
' e    24
' f    22
' f#   20
' g    19
' g#   17
' a    15
' a#   14
' b    12
' c    11
' c#   10
' d    9
' d#   8
' e    7
' f    6
' f#   5
' g    4
' g#   3


' vim: filetype=sbim
