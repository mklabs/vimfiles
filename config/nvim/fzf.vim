Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)<CR>
xmap <leader><tab> <plug>(fzf-maps-x)<CR>
omap <leader><tab> <plug>(fzf-maps-o)<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)<CR>
imap <c-x><c-j> <plug>(fzf-complete-file-ag)<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)<CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '14%'})<CR>
