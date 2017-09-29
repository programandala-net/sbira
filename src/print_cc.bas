' print_cc.bas

' This file is part of Sbira
' http://programandala.net/en.program.sbira.html

rem Procedure that prints at the center of a window.

rem Authors:
rem Simon n Goodwin, 1991-12
rem Suggested by Dario Leslie
rem Adapted to Sbira by Marcos Cruz (programandala.net), 2017

' Last modified 201709291505
' See change log at the end of the file

' ==============================================================
' License

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

' ==============================================================

deffn centre_line(ch%)
  ret win_height%(#ch%) div (win_cursor_height%(#ch%)*2)
enddef

deffn centre_column(ch%)
  ret win_width%(#ch%) div (win_cursor_width%(#ch%)*2)
enddef

defproc print_cc(ch%,text$)
  at #ch%,centre_line(c%),centre_column(c%)-(len(text$) div 2)
  ' XXX FIXME -- Out of range error above if text$ is too long.
  print #ch%,text$;
enddef

' ==============================================================
' Change log

' 2017-09-23: Start. Adapt the original code, extracted from the
' examples included in DIY Toolkit (volume C, <chans_demo_bas>).
'
' 2017-09-27: Update file header.

' vim: filetype=sbim
