"
" Mappings
"

" <Leader> key set to ,
let mapleader=','
let maplocalleader=' '

" Tab switch
nmap <silent> <S-Up>                        :tabprevious<CR>
nmap <silent> <S-Down>                      :tabnext<CR>

" Buffer switch
nmap <silent> <S-left>                      :bprev<CR>
nmap <silent> <S-right>                     :bnext<CR>

" Ctrl+arrow keys to switch between window
nmap <silent> <C-left>                     :wincmd h<CR>
nmap <silent> <C-right>                    :wincmd l<CR>
nmap <silent> <C-down>                     :wincmd j<CR>
nmap <silent> <C-up>                       :wincmd k<CR>

" Same for hjkl
nmap <silent> <C-h>                        :wincmd h<CR>
nmap <silent> <C-l>                        :wincmd l<CR>
nmap <silent> <C-j>                        :wincmd j<CR>
nmap <silent> <C-k>                        :wincmd k<CR>

" bonus Shift+ up / down same as Ctrl + up / down
nmap <silent> <S-down>      :wincmd j<CR>
nmap <silent> <S-up>        :wincmd k<CR>

" ",," to switch to previous edited buffer
nmap <Leader><Leader>       :b#<CR>

" `tt` in normal mode to toggle comments
noremap tt :TComment<CR>
