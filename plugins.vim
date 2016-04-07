
call plug#begin('~/.vim/bundles')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'

Plug 'mhartington/oceanic-next'

Plug 'Shougo/deoplete.nvim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'pangloss/vim-javascript'
Plug 'nono/vim-handlebars'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Add plugins to &runtimepath
call plug#end()
