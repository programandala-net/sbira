' device.bas

' This file is part of Sbira
' http://programandala.net/en.program.sbira.html

rem Function that returns the first device where a file can be found.

' This function is deprecated. SBASIC's `home_dir$` can be used
' instead.

rem Author: Marcos Cruz (programandala.net), 2016, 2017

' Last modified 201709291507
' See change log at the end of the file

' ==============================================================
' License

' You may do whatever you want with this work, so long as you
' retain all copyright, authorship and credit notices and this
' license in all redistributed copies and derived works.
' There is no warranty.

' ==============================================================

deffn device$(file$,devices$)

  ' Return the first device from a list where the given file is found,
  ' eg. "flp3_".
  '
  ' devices$ = list of 3-letter devices, without separators, eg.
  ' "winflpmdvdev".

  loc device_offset%,drive_number%,dev$

  if ftest(file$)
    for device_offset%=1 to len(devices$) step 3
      for drive_number%=1 to 8
        let dev$=devices$(device_offset% to device_offset%+2)&drive_number%&"_"
        if not ftest(dev$&file$):exit device_offset%
      endfor drive_number%
    endfor device_offset%
  endif

  ret dev$

enddef

' ==============================================================
' Change log

' 2016-01-25: Extract from ce4_sbim.
'
' 2017-09-12: Fix typo. Rename "_sbim" ".sbim".
'
' 2017-09-17: Rename ".sbim" ".bas". Update header.
'
' 2017-09-27: Update file header.

' vim: filetype=sbim
