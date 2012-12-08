" File: autoload/ctrlp/funky/js.vim
" Description: adds js support to ctrlp's funky extension
" Author: Mickael Daniel
" License: the MIT License

function! ctrlp#funky#javascript#filter(bufnr)
  let vars = [{
    \ 'pattern': '\m\C^[\t ]*var[\t ]\+\S\+',
    \ 'filter': ['\m\C^[\t ]*', '', '']
  \}]

  let functions = [{
    \ 'pattern': '\m.* = function',
    \ 'filter': ['\s*{', '', '']
  \}, {
    \ 'pattern': '\m\C^[\t ]*function \w*(.*)',
    \ 'filter': ['\s*{', '', '']
  \}]

  let filter = []
  " call extend(filter, vars)
  " call extend(filter, functions)

  return ctrlp#funky#abstract(a:bufnr, filter)
endfunction

" vim: fen:fdm=marker
