" Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ctrl-{key} to fuzzy find stuff
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
