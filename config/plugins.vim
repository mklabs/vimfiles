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
" Plug 'vim-airline/vim-airline'

" Themes

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'mattn/gist-vim'
Plug 'mhinz/vim-signify'

" Syntax
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'
Plug 'nono/vim-handlebars'

" Theme
Plug 'mhartington/oceanic-next'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-scripts/oceandeep'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'mhartington/oceanic-next'

" Lint
Plug 'neomake/neomake', { 'do': 'npm install --loglevel http -g eslint jsonlint' }

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-dispatch'
Plug 'xabikos/vscode-javascript'

call plug#end()
