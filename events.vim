"
" Autocommand config
"

" Remember last location in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif

" remove any trailing whitespace on file save.
au BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
