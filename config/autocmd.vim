" Autocommand config
"

" Remember last location in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif

" remove any trailing whitespace on file save.
au BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" always set fileformat=unix
au BufWrite * set fileformat=unix

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" autocmd VimEnter * if !argc() | VimFilerExplorer -status -winwidth=30 | endif
" Make Click and <Enter> expand the dir instead of cding into it
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
autocmd FileType vimfiler nmap <silent><buffer> <Enter> <Plug>(vimfiler_smart_l)

