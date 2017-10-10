' pic.bas

' This file is part of Sbira
' http://programandala.net/en.program.sbira.html

rem PIC format tools.

rem Author: Marcos Cruz (programandala.net), 2017

' Last modified 201710101737
' See change log at the end of the file

' ==============================================================
' License

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

' ==============================================================

deffn pic_size%(file$,width%,height%)

  ' Set variables `width%` and `height%` to the size of the PIC
  ' image `file$`.
  '
  ' Return an I/O result: if the file can be read, return zero;
  ' otherwise return the corresponding error code, which is a
  ' negative integer.

  loc channel%
  let channel%=fopen(file$)

  if channel%>-1
    get #channel%\2,width%,height%
    close #channel%
  endif

  ret channel%*(channel%<0)

enddef

defproc load_pic(file$,x%,y%)

  ' Load a PIC image from `file$` and display at coordinates
  ' `x%`, `y%`. If the file can not be found, do nothing.

  loc pic_address,\
      width%,height%,\ ' image size in pixels
      ior%,\           ' I/O result
      pw%              ' picture window channel

  let ior%=pic_size%(file$,width%,height%)

  if not ior%
    let pw%=fopen("scr_")
    window #pw%,width%,height%,x%,y%
    let pic_address=l_wsa(file$)
    wsars #pw%,pic_address,
    close #pw%
  endif

  ' XXX REMARK -- The comma separator after the address
  ' parameter of `wsars` is used to give up the save area. A
  ' backslash separator would mean keep the save area. See the
  ' manual of EasyPtr 4.

enddef

' ==============================================================
' Change log

' 2017-10-10: Start.

' vim: filetype=sbim
