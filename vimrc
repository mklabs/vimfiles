let g:VIMFILES_BUNDLES = vmf#join(g:VIMFILES_DIR, '.bundles')

" Load Common plugin configuration
Vimfiles 'config/common/*.vim'

" nvim / vim specific plugins
let dist = has('nvim') ? 'nvim' : 'vim'
Vimfiles 'config/' . dist . '/*.vim'

if has('win32') == 0
  colorscheme OceanicNext
  set background=dark
endif

" Define mappings
Vimfiles 'config/mappings.vim'

" call vmf#end()
