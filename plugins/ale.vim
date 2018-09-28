" Ale global configuration

let g:ale_linters = {
\ 'javascript': ['eslint', 'prettier']
\}

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
