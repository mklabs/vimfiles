let g:VIMFILES_BUNDLES = vimfiles#join(g:VIMFILES_DIR, '.bundles')

" Load Common plugin configuration
Vimfiles 'config/common/*.vim'

" nvim / vim specific plugins
let dist = has('nvim') ? 'nvim' : 'vim'
Vimfiles 'config/' . dist . '/*.vim'

" Include GUI specific config
if has('gui')
  Vimfiles 'config/gui/*.vim'
endif

" can't find a corect colorscheme for powerline, giving up and leaving it up to the user to set
colorscheme default

if has('win32') == 0
  colorscheme OceanicNext
  set background=dark
endif

call vimfiles#end()
