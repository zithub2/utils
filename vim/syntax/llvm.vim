"" kmr: one of keyword, match, region

syntax match Comment /;.*$/ contains=Todo
"syntax region Comment start=+/[*]+ end=+[*]/+

"syntax kmr Constant others
syntax region String start=+c"+ skip=+\\"+ end=+"+
"syntax kmr Character 'c'
syntax match Number /[-]\?[1-9][0-9]*/
syntax keyword Boolean true false
syntax match Float /[-]\?[0-9]\+[.][0-9]\+/

syntax match Identifier /[@%][._a-zA-Z][._a-zA-Z0-9]*/
"syntax kmr Function main printf

"syntax kmr Statement others
syntax keyword Conditional ret br call
"syntax kmr Repeat for do while until loop
syntax match Label /[a-zA-Z][_a-zA-Z0-9]*:/
"syntax kmr Operator + - * / ++ -- **
syntax keyword Operator add fadd mul fmul
syntax keyword Operator icmp eq le ge lt gt
syntax keyword Keyword define declare
"syntax kmr Exception try throw catch

"syntax kmr PreProc #others
"syntax kmr Include #include
"syntax kmr Define #define
"syntax kmr Macro #define
"syntax kmr PreCondit #if #else #endif

syntax keyword Type i1 i8 i16 i32 i64 i128
"syntax kmr StorageClass static register volatile
"syntax kmr Structure struct union enum
"syntax kmr Typedef typedef

"syntax kmr Special others
"syntax kmr SpecialChar special character in a constant
"syntax kmr Tag link, where you can use CTRL-]
"syntax kmr Delimiter comma in a csv file
"syntax kmr SpecialComment special things inside a comment
"syntax kmr Debug debugging statement

"syntax kmr Underlined html kinks

"syntax kmr Ignore left blank, hidden

"syntax kmr Error 0xyz

syntax keyword Todo TODO FIXME NOTE
