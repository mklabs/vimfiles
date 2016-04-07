"
" Mappings
"

" <Leader> key set to ,
let mapleader=','

map <Leader>n :NERDTreeToggle<CR>

" Shift+left to switch to prev tab
" Shift+right to switch to next
nmap <silent> <S-left>                      :tabprevious<CR>
nmap <silent> <S-right>                     :tabnext<CR>

" Same for hjkl
nmap <silent> <S-l>                        :tabnext<CR>
nmap <silent> <S-k>                        :tabnext<CR>
nmap <silent> <S-j>                        :tabprevious<CR>
nmap <silent> <S-h>                        :tabprevious<CR>

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

" Use ctrlp to list buffers with Ctrl-b
nmap <silent> <C-b>                        :CtrlPBuffer<CR>


" `tt` in normal mode to toggle comments
noremap tt :TComment<CR>
