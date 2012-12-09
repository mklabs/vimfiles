" Get the script's filename, in this file s:n is 'nodedoc'
let s:n = exists('s:n') ? s:n : fnamemodify(expand('<sfile>', 1), ':t:r')

" Load guard
if ( exists('g:loaded_ctrlp_'.s:n) && g:loaded_ctrlp_{s:n} )
  \ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_{s:n} = 1

let s:nodedoc_var = {
\  'init':   'ctrlp#nodedoc#init()',
\  'exit':   'ctrlp#nodedoc#exit()',
\  'accept': 'ctrlp#nodedoc#accept',
\  'lname':  'nodedoc',
\  'sname':  'nodedoc',
\  'type':   'feed',
\  'sort':   0,
\}

" Add this extension's settings to g:ctrlp_ext_vars
call add(g:ctrlp_ext_vars, s:nodedoc_var)

let s:file = 'all'
let s:cache = expand('<sfile>:h:h:h') . "/" . s:file ".json"
function! ctrlp#nodedoc#init()
  let url = printf('http://nodejs.org/api/%s.html', s:file)

  if filereadable(s:cache)
    let res = join(readfile(s:cache), '\n')
    let s:links = webapi#json#decode(res)
  else
    echo "... request " . url "..."
    let res = webapi#http#get(url).content
    echo "... Parsing html ..."

    let dom = webapi#html#parse(iconv(res, 'utf-8', &encoding))
    let headers = dom.findAll('h2')
    let s:links = []
    for header in headers
      let link = header.find('a')
      let txt = substitute(header.toString(), '<h2>', '', '')
      let txt = substitute(txt, '<span>.*', '', '')
      if has_key(link, 'name')
        call add(s:links, [txt, 'http://nodejs.org/api/all.html#' . link.attr.id])
      endif
    endfor

    echo "... caching " . s:cache . " ..."
    call writefile(split(webapi#json#encode(s:links), '\n'), s:cache)
  endif

	return map(copy(s:links), 'v:val[0]')
endfunc

function! ctrlp#nodedoc#accept(mode, str)
	silent call openbrowser#open(filter(copy(s:links), 'v:val[0] == a:str')[0][1])
	call ctrlp#exit()
endfunction

function! ctrlp#nodedoc#exit()
  if exists('s:links')
    unlet! s:links
  endif
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#nodedoc#id()
	return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
