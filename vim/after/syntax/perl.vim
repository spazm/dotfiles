" ~/.vim/after/syntax/perl.vim

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs

" non quoted and double quoted heredocs interpolate variables,
" while single quoted heredocs do not.
" @perlInterpSQ and @perlInterpDQ are defined in $VIMRUNTIME/syntax/perl.vim

" match single quote for non-interpolated heredoc
syntax region perlHereDocSQLsingle matchgroup=Statement start=+<<\('\)\z(SQL\)\1+ end=+^\z1$+ contains=@SQL,@perlInterpSQ
" match optional surrounding double quote and any whitespace in the heredoc name
syntax region perlHereDocSQLdouble matchgroup=Statement start=+<<\("\?\)\z(\s*SQL\s*\)\1+ end=+^\z1$+ contains=@SQL,@perlInterpDQ
