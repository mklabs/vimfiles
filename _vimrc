source $HOME\vimfiles\config\main.vim

call plug#begin('$HOME\vimfiles\bundles')
source $HOME\vimfiles\config\plugins.vim

" win specific plugins

" unfortunately, fzf does not support windows, so fallback to the excellent ctrlp
" todo: could test for ``which fzf` and fallback to it automatically
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

source $HOME\vimfiles\config\config.vim
source $HOME\vimfiles\config\theme.vim
source $HOME\vimfiles\config\mappings.vim
source $HOME\vimfiles\config\events.vim

" Plugin specific configuration
source $HOME\vimfiles\config\gist.vim
source $HOME\vimfiles\config\filer.vim
source $HOME\vimfiles\config\deoplete.vim
source $HOME\vimfiles\config\airline.vim
source $HOME\vimfiles\config\ultisnips.vim
source $HOME\vimfiles\config\plug.vim
source $HOME\vimfiles\config\unite.vim
source $HOME\vimfiles\config\tern.vim

colorscheme default
