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

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" set filetype to js for files with node shebang thing these files don't have
" an extension. pretty sure there is a plugin for this, for a bunch of
" filetype.
function! s:NodeAndTheBang(name)
  let nodebang = matchstr(getline(1), "^#.*". a:name)
  if nodebang != ''
    set ft=javascript
  endif
endfunction

" call this shebang check on every bufread or newfile
autocmd! BufRead,BufNewFile * call s:NodeAndTheBang('node')


