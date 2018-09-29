call plug#begin()

" Filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'

Plug 'ctrlpvim/ctrlp.vim'

" Languages
Plug 'isruslan/vim-es6'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Git
Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit'

" Syntax
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'
Plug 'nono/vim-handlebars'

" Theme
Plug 'mhartington/oceanic-next'

" Lint
Plug 'w0rp/ale', { 'do': 'npm install --loglevel notice -g eslint jsonlint prettier' }

" Terminal
Plug '~/dev/split-term.vim'
" Plug 'vimlab/split-term.vim'

" Snippets
Plug 'drmingdrmer/xptemplate'

" Templates
Plug 'aperezdc/vim-template'

" FileSystem
Plug 'tpope/vim-eunuch'

" Session
Plug 'tpope/vim-obsession'

" Layout / Windows Managemenr
Plug 'wesQ3/vim-windowswap'

" API Blueprint
Plug 'kylef/apiblueprint.vim'

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'tpope/vim-dispatch'
Plug 'xabikos/vscode-javascript'
Plug 'terryma/vim-multiple-cursors'

Plug 'mhinz/vim-startify'

call plug#end()
