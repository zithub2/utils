if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLyIndent()
setlocal indentkeys=o,O,},>>

function! GetLyIndent()
  let plnum = prevnonblank(v:lnum - 1)
  if plnum == 0
    return 0
  endif

  let prevline = getline(plnum)
  let curline = getline(v:lnum)
  let swlen = shiftwidth()
  let lcpat = '\s*\(%.*\)\?$' "line comment pattern

  if prevline =~ '^\s*#\?(' || prevline =~ ')' . lcpat || curline =~ ')' . lcpat
    let ind = lispindent(v:lnum)
  elseif prevline =~ '{' || curline =~ '}'
    let ind = cindent(v:lnum)
  else
    let ind = indent(plnum)
  endif

  if prevline =~ '<<'
    let ind += swlen
  endif
  if curline =~ '>>'
    let ind -= swlen
  endif

  return ind
endfunction
