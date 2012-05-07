" hob.vim -         It's like Hub. But from Vim.
" Maintainer:       mklabs

" if exists("g:loaded_hob") || v:version < 700 || &cp
"   finish
" endif
let g:loaded_hob = 1

"
" Fun things start here
"
"
function! hob#error(str)
  echohl ErrorMsg
  echo a:str
  echohl None
endfunction

" curl url and insert its standard output below the cursor
function! s:request(url)
  " always make a head request before the real one
  " abort if we got 404 response
  let head = system('curl -s -I '. a:url)

  if matchstr(head, '404 Not Found') != ''
    return s:error('... 404 Not Found: ' . a:url . ' ...')
  endif

  exe ":r! curl -s " . a:url
endfunction

function! hob#github_url(repo, filepath, ...)
  if match(a:repo, '/') == -1
    return s:error('... Repo must be in the form user/repo. Invalid: '. a:repo . ' ...')
  endif

  if !exists('a:filepath')
    return s:error('... A filepath must be provided ...' . a:filepath)
  endif

  " see if a branch was passed in, otherwise defaults to master
  let branch = exists('a:1') ? a:1 : 'master'

  " https://raw.github.com/:user/:repo/:branch/:filepath
  let url = "https://raw.github.com/" . join([a:repo, branch, a:filepath], '/')

  return url
endfunction

function! hob#github_get(url)
  call s:request(a:url)
endfunction

let s:urls = {}
function! hob#url_mapping(id)
  return has_key(s:urls, a:id) ? s:urls[a:id] : ''
endfunction

function! hob#define(id, url)
  " add to our url mappings
  let s:urls[a:id] = a:url
endfunction

"
" ## Commands
"

function! s:HobGet(bang, args)
  " lookup if the args passed in is a user defined url mappin
  let predef = hob#url_mapping(a:args)
  let hasdef = predef != ''

  " handle args
  let parts = split(a:args, ' ')

  if predef == '' && len(parts) != 2
    return hob#error('Missing repo / filename. Try :HobHelp')
  endif

  let url = hasdef ? predef : hob#github_url(parts[0], parts[1])
  echo "... Fetching URL " . url . "..."

  call hob#github_get(url)
endfunction

function! s:HobHelp()
  exe ':h hob'
endfunction

command! -bar -bang -nargs=* HobGet   call s:HobGet(<bang>0,<q-args>)
command! -bar -bang -nargs=0 HobHelp  call s:HobHelp()

" test
call hob#define('foo', 'https://raw.github.com/h5bp/html5-boilerplate/master/index.html')

" vim:set sw=2 sts=2:

