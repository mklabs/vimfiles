let g:VIMFILES_BUNDLES = vmf#join(g:VIMFILES_DIR, '.bundles')

" Load Common plugin configuration
Vimfiles 'config/common/*.vim'

" nvim / vim specific plugins
let dist = has('nvim') ? 'nvim' : 'vim'
Vimfiles 'config/' . dist . '/*.vim'

" Include GUI specific config
if has('gui')
  Vimfiles 'config/gui/*.vim'
endif

function! s:Glob(pattern)
  let path = vmf#join(a:pattern)
  call vmf#log('Comment', 'Glob pattern', a:pattern)
  call vmf#log('Comment', 'Glob path', path)
  for file in vmf#glob(path)
    call vmf#log('Comment', 'Source', file)
    exe "source " . file
  endfor
endfunction

call s:Glob('~/src/mklabs/t.vim/plugin/*.vim')

" can't find a corect colorscheme for powerline, giving up and leaving it up to the user to set
colorscheme default

if has('win32') == 0
  colorscheme OceanicNext
  set background=dark
endif

call vmf#end()
