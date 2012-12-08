" vim-mp.vim -
" Maintainer:       mklabs

if exists("g:loaded_vim_mp") || v:version < 700 || &cp
  finish
endif
let g:loaded_vim_mp = 1


let s:script = join([expand('<sfile>:h'), 'mp/convert'], '/')

function! s:MarkdownPreview()
  let output = system('node ' . s:script . ' ' . expand('%'))
  echo output
endfunction

"
" Fun things start here
"
function! s:initCommands()
  command! -buffer MarkdownPreview call s:MarkdownPreview()
endfunction

autocmd FileType markdown call s:initCommands()



" vim:set sw=2 sts=2:

