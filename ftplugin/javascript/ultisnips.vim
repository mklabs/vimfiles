let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

let s:candidates = []

function! s:menuLeave()
  let candidates = []
  let g:unite_source_menu_menus.snips.command_candidates = neojs#unite#candidates(candidates, [])
endfunction

function! s:menu()
  let candidates = []

  let snippets = UltiSnips#SnippetsInCurrentScope(1)
  let names = keys(snippets)

  for snippet in names
    let description = snippets[snippet]
    call add(candidates, neojs#unite#create_candidate(snippet . ' - ' . description, snippet, 'call g:ExpandSnipFromMenu("' . snippet . '")'))
  endfor

  let g:unite_source_menu_menus.snips.command_candidates = neojs#unite#candidates(candidates, [])
  let s:menu_cache = copy(g:unite_source_menu_menus)
endfunction

let g:unite_source_menu_menus.snips = neojs#unite#source_menu('snips', 'UltiSnips Menu', 'g', s:candidates)
let g:unite_source_menu_menus.snips.command_candidates = neojs#unite#candidates(s:candidates, [])

function! g:ExpandSnipFromMenu(snippet)
  let line = getline('.')
  let last = matchstr(line, '\w*$')
  let line = substitute(line, last, '', 'g')
  if line == ""
    call setline('.', a:snippet . ' ')
  else
    call setline('.', line . a:snippet . ' ')
  endif
  call cursor(getcurpos()[1], getcurpos()[2] + len(a:snippet) + 10)
  call UltiSnips#ExpandSnippet()
endfunction

augroup unite_ultisnips
  autocmd! * <buffer>
  autocmd BufEnter <buffer> call s:menu()
  autocmd BufLeave <buffer> call s:menuLeave()
augroup END

nnoremap <silent>[menu]s :Unite -silent -start-insert menu:snips<CR>
