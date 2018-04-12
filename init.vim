
let g:VIMFILES_BUNDLES = vmf#join(g:VIMFILES_DIR, '.bundles')
let g:unite_source_outline_indent_witdh = 7

" Load Common plugin configuration
Vimfiles 'config/common/*.vim'

" nvim / vim specific plugins
let dist = has('nvim') ? 'nvim' : 'vim'
Vimfiles 'config/' . dist . '/*.vim'

" " Define mappings
Vimfiles 'config/mappings.vim'
" call vmf#end()
