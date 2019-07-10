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

  let ind = indent(plnum)
  let prevline = getline(plnum)
  let curline = getline(v:lnum)
  let swlen = shiftwidth()
  if prevline =~ '^.*\(<<\|{\)' . '\s*\(%.*\)\?$'
    let ind += swlen
  endif
  if curline =~ '^\s*\(>>\|}\).*'
    let ind -= swlen
  endif

  return ind
endfunction
