" hob.vim -         It's like Hub. But from Vim.
" Maintainer:       mklabs

if exists("g:loaded_hob") || v:version < 700 || &cp
  finish
endif
let g:loaded_hob = 1

"
" Fun things start here
"
"
function! s:error(str)
  echohl ErrorMsg
  echo a:str
  echohl None
endfunction

" curl url and insert its standard output below the cursor
function! s:request(url)
  " always make a head request before the real one
  " abort if we got 404 response
  let head = system('curl -s -I'. a:url)

  if matchstr(head, '404 Not Found') != ''
    return s:error('... 404 Not Found: ' . a:url . ' ...')
  endif

  exe ":r! curl -s -k " . a:url
endfunction

function! s:github_url(repo, filepath, ...)
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

function! s:github_get(url)
  call s:request(a:url)
endfunction

let s:urls = {}
function! s:url_mapping(id)
  return has_key(s:urls, a:id) ? s:urls[a:id] : ''
endfunction

function! s:define(id, url)
  " add to our url mappings
  let s:urls[a:id] = a:url
endfunction

function! s:Complete_get(A, L, P)
  return s:completion_filter(keys(s:urls), a:A)
endfunction

" completion filter helper. borrowed to vim-rails:
" https://github.com/tpope/vim-rails/blob/master/autoload/rails.vim#L2162-2173
function! s:completion_filter(results,A)
  let results = sort(type(a:results) == type("") ? split(a:results,"\n") : copy(a:results))
  call filter(results,'v:val !~# "\\~$"')
  let filtered = filter(copy(results),'s:startswith(v:val,a:A)')
  if !empty(filtered) | return filtered | endif
  let regex = s:gsub(a:A,'[^/]','[&].*')
  let filtered = filter(copy(results),'v:val =~# "^".regex')
  if !empty(filtered) | return filtered | endif
  let regex = s:gsub(a:A,'.','[&].*')
  let filtered = filter(copy(results),'v:val =~# regex')
  return filtered
endfunction

" same here: https://github.com/tpope/vim-rails/blob/master/autoload/rails.vim#L35-41
function! s:gsub(str,pat,rep)
  return substitute(a:str,'\v\C'.a:pat,a:rep,'g')
endfunction

function! s:startswith(string,prefix)
  return strpart(a:string, 0, strlen(a:prefix)) ==# a:prefix
endfunction


"
" ## Commands
"

function! s:HobGet(bang, args)
  " lookup if the args passed in is a user defined url mappin
  let predef = s:url_mapping(a:args)
  let hasdef = predef != ''

  " handle args
  let parts = split(a:args, ' ')

  if predef == '' && len(parts) != 2
    return s:error('Missing repo / filename. Try :HobHelp')
  endif

  let url = hasdef ? predef : s:github_url(parts[0], parts[1])
  echo "... Fetching URL " . url . "..."

  call s:github_get(url)
endfunction

function! s:HobHelp()
  exe ':h hob'
endfunction

"
" Initialisation
"

function! s:HobInit()
  if exists('g:hob_urls')
    :call extend(s:urls, g:hob_urls)
  endif
endfunction

command! -bar -bang -nargs=* -complete=customlist,s:Complete_get HobGet call s:HobGet(<bang>0,<q-args>)
command! -bar -bang -nargs=0 HobHelp  call s:HobHelp()


call s:HobInit()

" vim:set sw=2 sts=2:

