" Mappings

" <Leader> key set to ,
let mapleader=','
let maplocalleader=' '

" Tab switch
nmap <silent> <S-Up>                        :tabprevious<CR>
nmap <silent> <S-Down>                      :tabnext<CR>

" Buffer switch
nmap <silent> <S-left>                      :tabprevious<CR>
nmap <silent> <S-right>                     :tabnext<CR>
nmap <silent> <S-h>                         :bprev<CR>
nmap <silent> <S-l>                         :bnext<CR>

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

" Open tab with Ctrl+T
nmap <silent> <C-o>                        :tabnew<CR>

" Browser like Ctrl-W to close current bufffer and remove it from the list
" nmap <C-W>                                :bd<CR>

" ",," to switch to previous edited buffer
nmap <Leader><Leader>       :b#<CR>

" `tt` in normal mode to toggle comments
noremap tt :TComment<CR>

" Filer
nmap <Leader>n :VimFilerExplorer -parent -no-focus -status -winwidth=30<CR>
nmap <Leader>b :VimFiler<CR>

" ALE
nmap <silent> <leader>f <Plug>(ale_fix)

