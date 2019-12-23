if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLLVMIndent()
setlocal indentkeys=o,O,},:

function! GetLLVMIndent()
  let plnum = prevnonblank(v:lnum - 1)
  if plnum == 0
    return 0
  endif

  let ind = indent(plnum)
  let prevline = getline(plnum)
  let curline = getline(v:lnum)
  let swlen = shiftwidth()
  let commentTail = '\s*\(;.*\)\?$'
  if prevline =~ '^.*[{:]' . commentTail
    let ind += swlen
  endif
  if curline =~ '^\s*[}].*' || curline =~ '.*:' . commentTail
    let ind -= swlen
  endif

  return ind
endfunction
