
call plug#begin("~/.vim/.bundles")

" Filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'

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
Plug 'nono/vim-handlebars'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

" Theme
Plug 'mhartington/oceanic-next'

" Lint
Plug 'neomake/neomake', { 'do': 'npm install --loglevel http -g eslint jsonlint' }

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-startify'

" Snippet
Plug 'sirver/ultisnips'
" Plug 'honza/vim-snippets'

" node
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --loglevel http' }

if has('unix')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
elseif has('win32')
  Plug 'ctrlpvim/ctrlp.vim'
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'vimlab/split-term.vim'

  Plug 'carlitux/deoplete-ternjs',  { 'do': 'npm install --loglevel http -g tern' }
  Plug 'neovim/node-host',          { 'do': 'npm install --loglevel http' }
endif

call plug#end()
