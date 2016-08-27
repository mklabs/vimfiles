"
" Mappings

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

" Browser like Ctrl-W to close current bufffer and remove it from the list
nmap <C-W>                                :bd<CR>

" ",," to switch to previous edited buffer
nmap <Leader><Leader>       :b#<CR>

" `tt` in normal mode to toggle comments
noremap tt :TComment<CR>

" Unite outline
nmap <C-o> :Unite -start-insert -direction=topleft -winwidth=40 -vertical outline<CR>

" Filer
nmap <Leader>n :VimFilerExplorer -parent -no-focus -status -winwidth=30<CR>
nmap <Leader>b :VimFiler<CR>

" Fuzzy finders (fzf on unix / ctrlp on win32)
if exists(':Files')
  map <C-b> :Buffers<CR>
  map <C-p> :Files<CR>
elseif exists(':CtrlPBuffer')
  map <C-b> :CtrlPBuffer
endif

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)<CR>
xmap <leader><tab> <plug>(fzf-maps-x)<CR>
omap <leader><tab> <plug>(fzf-maps-o)<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)<CR>
imap <c-x><c-j> <plug>(fzf-complete-file-ag)<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)<CR>
