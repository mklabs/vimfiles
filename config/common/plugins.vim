
call plug#begin("~/.vim/.bundles")

" Filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Status bar
Plug 'vim-airline/vim-airline'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/oceandeep'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'mhartington/oceanic-next'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'mattn/gist-vim'

" Syntax
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'

" Theme
Plug 'mhartington/oceanic-next'

" Lint
Plug 'benekastah/neomake', { 'do': 'npm install --loglevel http -g eslint jsonlint' }

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-startify'

" Custom stuff
" Plug '~/src/mklabs/t.vim', { 'do': 'npm link --cache-min Infinity' }

call plug#end()
