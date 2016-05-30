source $HOME\vimfiles\main.vim

call plug#begin('$HOME\vimfiles\bundles')
source $HOME\vimfiles\plugins.vim

" win specific plugins

" unfortunately, fzf does not support windows, so fallback to the excellent ctrlp
" todo: could test for ``which fzf` and fallback to it automatically
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

source $HOME\vimfiles\config.vim
source $HOME\vimfiles\theme.vim
source $HOME\vimfiles\mappings.vim
source $HOME\vimfiles\events.vim

" Plugin specific configuration
source $HOME\vimfiles\gist.vim
source $HOME\vimfiles\filer.vim
source $HOME\vimfiles\deoplete.vim
source $HOME\vimfiles\airline.vim
source $HOME\vimfiles\ultisnips.vim
source $HOME\vimfiles\plug.vim
source $HOME\vimfiles\unite.vim
source $HOME\vimfiles\tern.vim

colorscheme default
