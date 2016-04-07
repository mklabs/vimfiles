"
" General configuration
"

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

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
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Splitting a window reduce the size of the current window and leave the other
" windows the same
set noequalalways

" Show (partial) command in the status line
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
