" janus' vimrc
" https://raw.github.com/carlhuda/janus/master/vimrc

set nocompatible                  " Must come first because it changes other options.

" Pathogen
" --------

runtime! autoload/pathogen.vim
silent! call pathogen#infect()

" additional pathogen paths
silent! call pathogen#infect("custom-bundle")
silent! call pathogen#infect("~/src/vim/bundle")

" auto-generate doc for each plugin in pathogen runtime path
call pathogen#helptags()

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Show (partial) command in the status line
set showcmd
