let g:neojs_pluginfile = '~/src/mklabs/neojs/docs/plugins.md'

source $HOME/.vim/main.vim

call plug#begin('~/.vim/bundles')
source $HOME/.vim/plugins.vim
call plug#end()

source $HOME/.vim/config.vim
source $HOME/.vim/theme.vim
source $HOME/.vim/mappings.vim
source $HOME/.vim/events.vim

" Plugin specific configuration
source $HOME/.vim/gist.vim
source $HOME/.vim/filer.vim
source $HOME/.vim/unite.vim
source $HOME/.vim/deoplete.vim
source $HOME/.vim/airline.vim
source $HOME/.vim/ultisnips.vim
source $HOME/.vim/plug.vim
