let g:vimfiler_as_default_explorer = 1

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'

map <Leader>n :VimFilerExplorer<CR>
map <Leader>b :VimFiler<CR>

" Explorer window on startup
autocmd VimEnter * VimFilerExplorer

" Override Enter, right & left to navigate through dirs
autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Enter> l | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Enter> l | endif


autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Right> l | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Right> l | endif

autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Left> h | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Left> h | endif
