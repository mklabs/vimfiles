let g:lightline = {}

let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ }

" Set color to the components:
let g:lightline.component_type = {
\  'linter_checking': 'left',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'linter_ok': 'left',
\ }

" Add the components to the lightline, for example to the right side:
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
