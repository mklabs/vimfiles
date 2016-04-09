let g:vimfiler_as_default_explorer = 1
let g:NERDTreeHijackNetrw = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'

map <Leader>n :NERDTreeToggle<CR>
map <Leader>b :VimFiler<CR>

" Override Enter, right & left to navigate through dirs
autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Enter> l | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Enter> l | endif


autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Right> l | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Right> l | endif

autocmd VimEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Left> h | endif
autocmd BufEnter * if (&filetype ==# 'vimfiler') | nmap <buffer> <Left> h | endif
