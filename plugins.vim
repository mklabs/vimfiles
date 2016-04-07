
call plug#begin('~/.vim/bundles')

" Filer
Plug 'scrooloose/nerdtree'

" Status bar
Plug 'vim-airline/vim-airline'

" Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'nono/vim-handlebars'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

" Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'

" Add plugins to &runtimepath
call plug#end()
