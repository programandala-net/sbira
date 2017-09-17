rem `zx_beep` procedure for S*BASIC

rem By Marcos Cruz (programandala.net), 2017

rem Version 0.0.0+201709172135

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

defproc zx_beep(duration,tone)

  ' XXX TODO
  '
  beep duration*1000000/72,pitch(tone)

enddef

defproc init_zx_beep

enddef

@zxbeep_notes

' Data extracted from the <beep.pdf> file found in
' http://www.dilwyn.me.uk/docs/articles/index.html

data 0016.35, 0017.32, 0018.35, 0019.45, 0020.60, 0021.83, 0023.12
data 0024.50, 0025.96, 0027.50, 0029.14, 0030.87, 0032.70, 0034.65
data 0036.71, 0038.89, 0041.20, 0043.65, 0046.25, 0049.00, 0051.91
data 0055.00, 0058.27, 0061.74, 0065.41, 0069.30, 0073.42, 0077.78
data 0082.41, 0087.31, 0092.50, 0098.00, 0103.80, 0110.00, 0116.50
data 0123.50, 0130.80, 0138.60, 0146.80, 0155.60, 0164.80, 0174.60
data 0185.00, 0196.00, 0207.70, 0220.00, 0233.10, 0246.90, 0261.60
data 0277.20, 0293.70, 0311.10, 0329.60, 0349.20, 0370.00, 0392.00
data 0415.30, 0440.00, 0466.20, 0493.90, 0523.30, 0554.40, 0587.30
data 0622.30, 0659.30, 0698.50, 0740.00, 0784.00, 0830.60, 0880.00
data 0932.30, 0987.80, 1047.00, 1109.00, 1175.00, 1245.00, 1319.00
data 1397.00, 1480.00, 1568.00, 1661.00, 1760.00, 1865.00, 1976.00
data 2093.00, 2217.00, 2349.00, 2489.00, 2637.00, 2794.00, 2960.00
data 3136.00, 3322.00, 3520.00, 3729.00, 3951.00, 4186.00, 4435.00
data 4699.00, 4978.00, 5274.00, 5588.00, 5920.00, 6272.00, 6645.00
data 7040.00, 7459.00, 7902.00

' vim: filetype=sbim
