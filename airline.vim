
set noshowmode

" Font
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete

let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
let g:airline#extensions#tabline#buffer_idx_mode = 1
