' win.bas

' This file is part of Sbira
' http://programandala.net/en.program.sbira.html

rem SBASIC functions to fetch window channel information.

rem Authors:
rem Simon n Goodwin, 1988
rem Adapted to Sbira by Marcos Cruz (programandala.net), 2017

' Last modified 201709272319
' See change log at the end of the file

' ==============================================================
' License

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

' ==============================================================

deffn win_base(chan%)
  ' Address of top left of screen.
  ret chan_l(chan%,50)
enddef

deffn win_ink%(chan%)
  ' Current ink in chan%.
  ret chan_b%(chan%,70)
enddef

deffn win_paper%(chan%)
  ' Current paper in chan%.
  ret chan_b%(chan%,68)
enddef

deffn win_width%(chan%)
  ' Pixel width of window chan%.
  ret chan_w%(chan%,28)
enddef

deffn win_height%(chan%)
  ' Pixel height of window chan%.
  ret chan_w%(chan%,30)
enddef

deffn win_xpos%(chan%)
  ' Cursor x coordinate of window chan%.
  ret chan_w%(chan%,34)
enddef

deffn win_ypos%(chan%)
  ' Cursor y coordinate of window chan%.
  ret chan_w%(chan%,36)
enddef

deffn win_xmin%(chan%)
  ' x co-ordinate of left edge of window chan%.
  ret chan_w%(chan%,24)
enddef

deffn win_ymin%(chan%)
  ' y co-ordinate of top of window chan%.
  ret chan_w%(chan%,26)
enddef

deffn win_cursor_height%(chan%)
  ' Cursor height in pixels of window chan%.
  ret chan_w%(chan%,40)
enddef

deffn win_cursor_width%(chan%)
  ' Cursor width in pixels of window chan%.
  ret chan_w%(chan%,40)
enddef

deffn win_attr%(chan%)
  ' See Table 3
  ret chan_b%(chan%,66)
enddef

deffn win_font1(chan%)
  ret chan_l(chan%,42)
enddef

deffn win_font2(chan%)
  ret chan_l(chan%,46)
enddef

' XXX TODO --
' deffn win_line%(chan%)
'   ret win_ypos%(chan%)/win_cursor_height%(chan%)
' enddef

' XXX TODO --
' deffn win_column%(chan%)
'   ret win_xpos%(chan%)/win_cursor_width%(chan%)
' enddef

' ==============================================================
' Change log

' 2017-09-23: Start. Adapt the original code, extracted from the
' examples included in DIY Toolkit (volume C, <chans_demo_bas>).
'
' 2017-09-24: Try drafts of `win_column%` and win_line%`.
'
' 2017-09-27: Update file header.

' vim: filetype=sbim
