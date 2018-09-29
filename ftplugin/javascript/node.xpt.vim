" Thanks to Torgeir Thoresen vim personal files
"
" https://github.com/torgeir/vim/blob/master/snippets/ftplugin/javascript/javascript.xpt.vim

XPTemplate priority=lang-1

let s:f = g:XPTfuncs()

" strip directory portion of a pathname
function! s:f.strip_path(pathname)
  if has('win32')
    return substitute(system("node -pe \"require('path').basename('" .  shellescape(a:pathname) . "')"), "\n", "", 'g')
  else
    return substitute(system("basename " .  shellescape(a:pathname)), "\n", "", 'g')
  endif
endfunction

" camel cases words separated by -
function! s:f.camelize(str)
  return substitute(a:str, '[.-]\(\w*\)', '\u\1', 'g')
endfunction

XPT req " node require module
const `module^camelize(strip_path(V()))^ = require('``module^');
