source $HOME/.vim/config/main.vim

call plug#begin('$HOME/.vim/bundles')
source $HOME/.vim/config/plugins.vim
call plug#end()

source $HOME/.vim/config/config.vim
source $HOME/.vim/config/theme.vim
source $HOME/.vim/config/mappings.vim
source $HOME/.vim/config/events.vim

" Plugin specific configuration
source $HOME/.vim/config/gist.vim
source $HOME/.vim/config/filer.vim
source $HOME/.vim/config/fzf.vim
source $HOME/.vim/config/deoplete.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/ultisnips.vim
source $HOME/.vim/config/plug.vim
source $HOME/.vim/config/unite.vim
source $HOME/.vim/config/tern.vim

" Theme / Colorsheme configuration
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
