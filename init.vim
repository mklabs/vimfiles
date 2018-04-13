" janus' vimrc
" https://raw.github.com/carlhuda/janus/master/vimrc

set nocompatible                  " Must come first because it changes other options.

so plugins.vim

" General configuration
"

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

let loaded_matchparen = 1
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

" use the clipboard for ALL operations (as opposed to interacting with the '+' and/or '*' registers explicitly), set the
set clipboard+=unnamedplus

" Autocommand config
"

" Remember last location in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif

" remove any trailing whitespace on file save.
au BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" always set fileformat=unix
au BufWrite * set fileformat=unix

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Mappings

" <Leader> key set to ,
let mapleader=','
let maplocalleader=' '

" Tab switch
nmap <silent> <S-Up>                        :tabprevious<CR>
nmap <silent> <S-Down>                      :tabnext<CR>
nmap <silent> <D-Up>                        :tabprevious<CR>
nmap <silent> <D-Down>                      :tabnext<CR>

" Buffer switch
nmap <silent> <S-left>                      :bprev<CR>
nmap <silent> <S-right>                     :bnext<CR>
nmap <silent> <S-h>                         :bprev<CR>
nmap <silent> <S-l>                         :bnext<CR>
nmap <silent> <D-left>                      :bprev<CR>
nmap <silent> <D-right>                     :bnext<CR>

" Ctrl+arrow keys to switch between window
nmap <silent> <C-left>                     :wincmd h<CR>
nmap <silent> <C-right>                    :wincmd l<CR>
nmap <silent> <C-Down>                     :wincmd j<CR>
nmap <silent> <C-Up>                       :wincmd k<CR>

" Same for hjkl
nmap <silent> <C-h>                        :wincmd h<CR>
nmap <silent> <C-l>                        :wincmd l<CR>
nmap <silent> <C-j>                        :wincmd j<CR>
nmap <silent> <C-k>                        :wincmd k<CR>

" Browser like Ctrl-W to close current bufffer and remove it from the list
nmap <C-W>                                :bd<CR>

" ",," to switch to previous edited buffer
nmap <Leader><Leader>       :b#<CR>

" `tt` in normal mode to toggle comments
noremap tt :TComment<CR>

" Unite outline
nmap <C-o> :Unite -start-insert -direction=topleft -winwidth=40 -vertical outline<CR>

" Filer
nmap <Leader>n :VimFilerExplorer -parent -no-focus -status -winwidth=30<CR>
nmap <Leader>b :VimFiler<CR>

" Fuzzy finders (fzf on unix / ctrlp on win32)
if exists(':Files')
  map <C-b> :Buffers<CR>
  map <C-p> :Files<CR>
elseif exists(':CtrlPBuffer')
  map <C-b> :CtrlPBuffer
endif

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)<CR>
xmap <leader><tab> <plug>(fzf-maps-x)<CR>
omap <leader><tab> <plug>(fzf-maps-o)<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)<CR>
imap <c-x><c-j> <plug>(fzf-complete-file-ag)<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)<CR>


let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = 'aa'

" autocmd VimEnter * if !argc() | VimFilerExplorer -status -winwidth=30 | endif

" Make Click and <Enter> expand the dir instead of cding into it
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
autocmd FileType vimfiler nmap <silent><buffer> <Enter> <Plug>(vimfiler_smart_l)

" Theme / Colorsheme configuration

" scheme
" colorscheme slate

" terminal should support 256 colors
set t_Co=256

let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12


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

let $NVIM_TUI_ENABLE_TRUE_COLOR=1


colorscheme oceandeep

" terminal should support 256 colors
set t_Co=256


let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
