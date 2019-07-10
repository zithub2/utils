if exists("b:current_syntax")
  finish
endif

syn region  lyString		start=+"+  skip=+\\"+  end=+"+
hi def link lyString String

syn match lyVar "\<[a-zA-Z]\+\>"
hi def link lyVar Identifier

syn match lyDlm  "\({\|}\|<<\|>>\|//\)"
hi def link lyDlm Delimiter

syn match lyNote "\<[a-g]\(s\|ss\|f\|ff\)\?\([^a-zA-Z]\|$\)\@="
syn match lyNote "\<[rs]\([^a-zA-Z]\|$\)\@="
hi def link lyNote Normal

syn keyword lyKwd Staff Voice
syn keyword lyKwd with new relative absolute version language
hi def link lyKwd Keyword

sy match lyNum "[0-9]\+"
hi def link lyNum Number

" Comments
syn keyword lyCommentTodo    TODO MoreCmtKwdSepBySpace contained
hi def link lyCommentTodo Todo

syn match   lyLineComment      "%.*$" contains=lyCommentTodo
hi def link lyLineComment Comment

syn region  lyBlockComment     start="{-"  end="-}" contains=lyBlockComment,lyCommentTodo
hi def link lyBlockComment Comment


let b:current_syntax = "lilypond"
