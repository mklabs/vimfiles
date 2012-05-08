" cowsay.vim -  just vim saying cowsay
" Maintainer:   mklabs

"  _____________
" <  Cowsay.vim >
"  -------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"

if exists("g:loaded_cowsay") || v:version < 700 || &cp
  finish
endif
let g:loaded_cowsay = 1

"  _________
" < Utility >
"  ---------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

function! s:error(str)
  echohl ErrorMsg
  echo '... '. a:str . ' ...'
  echohl None
endfunction

"  _________________________________________
" /  ## Commands                            \
" |                                         |
" | Commands below accepts arguments or     |
" | visual range.                           |
" |                                         |
" | ### :Cowsay                             |
" |                                         |
" | Output the cow, a simple echo.          |
" |                                         |
" | ### :Cow                                |
" |                                         |
" | Same as ':Cowsay', expect that it       |
" | replaces the selected lines (if used in |
" | visual mode) or append what the cow     |
" | said below the cursor.                  |
" |                                         |
" | ### :CowComment                         |
" |                                         |
" | Same as ':CowComment', expect that it   |
" | also triggers :TComment if is           |
" \ installed.                              /
"  -----------------------------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

function! s:Cow(args, ...)
  if !executable('cowsay')
    return s:error('cowsay is not installed')
  endif

  if a:args != ""
    let lines = a:args
  else
    let lines = join(getline(a:1, a:2), "\n")
  endif

  let cow = system('cowsay', lines)
  return cow
endfunction

function! s:CowSay(args, ...)
  let cow = s:Cow(a:args, a:1, a:2)
  echo cow
endfunction

function! s:CowInsert(args, ...)
  let cow = s:Cow(a:args, a:1, a:2)
  let lines = split(cow, "\n")
  let oldlines = getline(a:2, a:2 + len(lines))
  call setline(a:1, lines + oldlines)
  return lines
endfunction

function! s:CowComment(args, ...)
  let lines = s:CowInsert(a:args, a:1, a:2)
  if exists("g:loaded_tcomment")
    let end = a:1 + len(lines)
    call tcomment#Comment(a:1, end)
  endif
endfunction

command! -nargs=* -range Cowsay         call s:CowSay(<q-args>, <line1>, <line2>)
command! -nargs=* -range Cow            call s:CowInsert(<q-args>, <line1>, <line2>)
command! -nargs=* -range CowComment     call s:CowComment(<q-args>, <line1>, <line2>)
