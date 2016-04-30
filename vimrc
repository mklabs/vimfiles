source $HOME/.config/nvim/main.vim

call plug#begin('~/.config/nvim/bundles')
source $HOME/.config/nvim/plugins.vim
call plug#end()

source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/events.vim

" Plugin specific configuration
source $HOME/.config/nvim/gist.vim
source $HOME/.config/nvim/filer.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/deoplete.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/ultisnips.vim
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/unite.vim
source $HOME/.config/nvim/tern.vim
