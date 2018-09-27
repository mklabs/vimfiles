call plug#begin()

" Filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Languages
Plug 'isruslan/vim-es6'
Plug 'bentayloruk/vim-react-es6-snippets'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Git
Plug 'mhinz/vim-signify'

" Syntax
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'
Plug 'nono/vim-handlebars'

" Theme
Plug 'mhartington/oceanic-next'

" Lint
Plug 'w0rp/ale', { 'do': 'npm install --loglevel notice -g eslint jsonlint prettier prettier-eslint-cli eslint-plugin-prettier eslint-config-prettier prettier' }

" Terminal
Plug '~/dev/split-term.vim'
" Plug 'vimlab/split-term.vim'

" FileSystem
Plug 'tpope/vim-eunuch'

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'tpope/vim-dispatch'
Plug 'xabikos/vscode-javascript'

call plug#end()
