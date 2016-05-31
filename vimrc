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

if has('win32') == 0
  colorscheme OceanicNext
  set background=dark
endif

let g:startify_list_order = [
  \ ['  >> Most recently used files in cwd (mru)'], 'dir',
  \ ['  >> Most recently used files (mru)'], 'files',
  \ ['  >> Sessions'], 'sessions',
  \ ['  >> Bookmarks'], 'bookmarks'
  \ ]

let node = split('node ' . system('node -v'), '\n')
let npm = split('npm ' . system('npm -v'), '\n')
let g:startify_custom_header = map(node + npm, '"   ". v:val')

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" Define mappings
Vimfiles 'config/mappings.vim'

" Custom stuff
Plug '~/src/mklabs/t.vim'

call vmf#end()
