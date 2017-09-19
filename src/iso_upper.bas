rem iso_upper.bas

rem SBASIC functions to convert ISO 8859-1
rem characters and strings to uppercase.

rem Author: Marcos Cruz (programandala.net)

' 2017-09-19: Start: Code from Asalto y castigo
' (http://programandala.net/es.programa.asalto_y_castigo.superbasic.html)

deffn iso_upper%(char%)

  ' Return the uppercase char code of the given ISO 8859-1 char.

  sel on char%
    =97 to 122,224 to 246,248 to 254:\
      ret char%-32
    =remainder:\
      ret char%
  endsel

enddef

deffn iso_upper$(text$)

  ' Return the given ISO 8859-1 text in uppercase.

  loc i%,upper_text$
  let upper_text$=text$
  for i%=1 to len(upper_text$)
    let upper_text$(i%)=chr$(iso_upper%(code(text$(i%))))
  endfor i%
  ret upper_text$

enddef

deffn iso_upper_1$(text$)

  ' Return the given ISO 8859-1 text with the first letter in
  ' uppercase.

  ret iso_upper$(text$(1))&text$(2 to)

enddef

' vim: filetype=sbim
