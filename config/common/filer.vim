let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = 'aa'

" autocmd VimEnter * if !argc() | VimFilerExplorer -status -winwidth=30 | endif

" Make Click and <Enter> expand the dir instead of cding into it
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
autocmd FileType vimfiler nmap <silent><buffer> <Enter> <Plug>(vimfiler_smart_l)
