" TODO: PlugRemove

if !exists('g:plug_add_file')
  let g:plug_add_file = '~/.vim/plugins.vim'
endif

let s:added = ''

fun! s:plugAdd(plugin)
  let s:added = a:plugin
  exe "silent !echo \"Plug '" . a:plugin . "'\" >> " . g:plug_add_file

  set statusline=%!g:MyStatusLine()

  so g:plug_add_file
endf

fun! g:MyStatusLine()
  return '%f - Added plugin %1*' . s:added . '%* to ' . g:plug_add_file
endf

command! -nargs=* PlugAdd call s:plugAdd(<f-args>)
