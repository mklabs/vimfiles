set nocompatible

if has('win32')
  so ~/AppData/Local/nvim/vimrc.vim
  so ~/AppData/Local/nvim/config/plugins.vim
  so ~/AppData/Local/nvim/config/autocmd.vim
  so ~/AppData/Local/nvim/plugins/emmet.vim
  so ~/AppData/Local/nvim/plugins/vimfiler.vim
  so ~/AppData/Local/nvim/plugins/startify.vim
  so ~/AppData/Local/nvim/plugins/ack.vim
  so ~/AppData/Local/nvim/plugins/ale.vim
  so ~/AppData/Local/nvim/plugins/lightline.vim
  so ~/AppData/Local/nvim/plugins/split-term.vim
  so ~/AppData/Local/nvim/config/mappings.vim
else
  so ~/.config/nvim/vimrc.vim
  so ~/.config/nvim/config/plugins.vim
  so ~/.config/nvim/config/autocmd.vim
  so ~/.config/nvim/plugins/emmet.vim
  so ~/.config/nvim/plugins/vimfiler.vim
  so ~/.config/nvim/plugins/startify.vim
  so ~/.config/nvim/plugins/ack.vim
  so ~/.config/nvim/plugins/ale.vim
  so ~/.config/nvim/plugins/lighline.vim
  so ~/.config/nvim/plugins/split-term.vim
  so ~/.config/nvim/config/mappings.vim
end
