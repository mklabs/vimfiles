" vimfiles: higher lvl api / commands to vim-plug
" ===============================================

if exists('g:loaded_vimfiles')
  " finish
endif
let g:loaded_vimfiles = 1

let g:VIMFILES_SEP = has('win32') ? '\' : '/'
let g:VIMFILES_DIR = join([$HOME, has('win32') ? 'vimfiles' : '.vim'], g:VIMFILES_SEP)
let g:VIMFILES_HIGROUP = 'Comment'
let s:begin = 0

function! vmf#join(...)
  let list = a:000
  let value = join(list, '/')

  " clean up windows \ separator
  let value = substitute(value, '\', '/', 'g')

  " cleanup any consecutive slash
  let value = substitute(value, '/\+', '/', 'g')

  " lastly, return the correct platform specific path
  return substitute(value, '/', has('win32') ? '\' : '/', 'g')
endfunction

function! vmf#glob(pattern)
  return split(glob(a:pattern), '\n')
endfunction

function! vmf#source(pattern)
  let path = vmf#join(g:VIMFILES_DIR, a:pattern)
  for file in vmf#glob(path)
    call vmf#log('Comment', 'Source', file)
    exe "source " . file
  endfor
endfunction

let s:logs = []
function! vmf#log(group, ...)
  let msg = join(a:000, ' ')
  call add(s:logs, { 'group': a:group, 'msg': 'Vimfiles: ' . msg })
endfunction

function! vmf#logs()
  return s:logs
endfunction

function! vmf#clear()
  let s:logs = []
  return s:logs
endfunction

function! vmf#debug(group, ...)
  let msg = join(a:000, ' ')
  echohl a:group | echomsg msg | echohl None
endfunction

function! vmf#end()
  call vmf#log('Todo', 'Calling plug#end')
  call plug#end()
endfunction

function! s:Vimfiles(pattern)
  call vmf#source(a:pattern)
endfunction

function! s:Vimfile(repo)
  if s:begin == 0
    call vmf#log('Todo', 'Calling plug#begin() with ' . g:VIMFILES_BUNDLES)
    call plug#begin(g:VIMFILES_BUNDLES)
    let s:begin = 1
  endif

  call vmf#log('String', 'Plug ' . a:repo)
  Plug a:repo
endfunction

function! s:Messages()
  for log in s:logs
    call vmf#debug(log.group, log.msg)
  endfor
endfunction

command! -nargs=+ Vimfiles call s:Vimfiles(<args>)
command! -nargs=+ Vimfile  call s:Vimfile(<args>)
command! VimfilesMessages  call s:Messages()
