" vimfiles: fancy vim distrib
" ============================

if exists('g:loaded_vimfiles')
  " finish
endif
let g:loaded_vimfiles = 1

let g:VIMFILES_SEP = has('win32') ? '\' : '/'
let g:VIMFILES_DIR = join([$HOME, has('win32') ? 'vimfiles' : '.vim'], g:VIMFILES_SEP)
let g:VIMFILES_HIGROUP = 'Comment'
let g:VIMFILES_SILENT = 0
let s:begin = 0

function! vimfiles#join(...)
  let list = a:000
  let value = join(list, '/')

  " clean up windows \ separator
  let value = substitute(value, '\', '/', 'g')

  " cleanup any consecutive slash
  let value = substitute(value, '/\+', '/', 'g')

  " lastly, return the correct platform specific path
  return substitute(value, '/', has('win32') ? '\' : '/', 'g')
endfunction

function! vimfiles#glob(pattern)
  return split(glob(a:pattern), '\n')
endfunction

function! vimfiles#source(pattern)
  let path = vimfiles#join(g:VIMFILES_DIR, a:pattern)
  for file in vimfiles#glob(path)
    call vimfiles#log('Comment', 'Source', file)
    exe "source " . file
  endfor
endfunction

let s:logs = []
function! vimfiles#log(group, ...)
  let msg = join(a:000, ' ')
  call add(s:logs, { 'group': a:group, 'msg': 'Vimfiles: ' . msg })
endfunction

function! vimfiles#debug(group, ...)
  let msg = join(a:000, ' ')
  echohl a:group | echomsg msg | echohl None
endfunction

function! vimfiles#end()
  call vimfiles#log('Todo', 'Calling plug#end')
  call plug#end()
endfunction

function! s:Vimfiles(pattern)
  call vimfiles#source(a:pattern)
endfunction

function! s:Vimfile(repo)
  if s:begin == 0
    call vimfiles#log('Todo', 'Calling plug#begin() with ' . g:VIMFILES_BUNDLES)
    call plug#begin(g:VIMFILES_BUNDLES)
    let s:begin = 1
  endif

  call vimfiles#log('String', 'Plug ' . a:repo)
  Plug a:repo
endfunction

function! s:Messages()
  for log in s:logs
    call vimfiles#debug(log.group, log.msg)
  endfor
endfunction

command! -nargs=+ Vimfiles 		call s:Vimfiles(<args>)
command! -nargs=+ Vimfile  		call s:Vimfile(<args>)
command! VimfilesMessages  	call s:Messages()

if exists(':Debug') == 0
  command! -nargs=+ Debug call vimfiles#debug(<q-args>)
endif
