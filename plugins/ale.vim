" Ale global configuration

let g:ale_linters = {
\ 'javascript': ['eslint', 'prettier'],
\ 'vim': ['vint']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint']
\}

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
