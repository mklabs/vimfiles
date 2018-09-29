" General configuration
" load the plugin and indent settings for the detected filetype

filetype plugin indent on

set splitright

" show line numbers
set number

" show line and column number
set ruler

syntax enable

" keep curent color settings
syntax on

" Use modeline overrides
set modeline
set modelines=10

" no fold by default
set nofoldenable

" No Backup! Yeah. COMMIT EVERYTHING
set nobackup
set noswapfile

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" disable preview window in completions
set completeopt=menu

" Status bar
set laststatus=2

" Splitting a window reduce the size of the current window and leave the other
" windows the same
set noequalalways

" Show (partial) command in the status line
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if &termencoding == ""
  let &termencoding = &encoding
endif

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

" use the clipboard for ALL operations (as opposed to interacting with the '+'
" and/or '*' registers explicitly)
set clipboard+=unnamedplus

" let g:vimfiler_tree_closed_icon = 'aa'

" Theme / Colorsheme configuration

" scheme
" colorscheme slate

" terminal should support 256 colors
set t_Co=256

let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
