" chrome.vim -  Vim meets Chrome
" Maintainer:       mklabs

" if exists("g:loaded_chrome") || v:version < 700 || &cp
"   finish
" endif
" let g:loaded_chrome = 1

"
" There is so much power, and things we could do with the remote
" debugging protocol. This is just a start.
"

" dirname
let s:dirname = expand('<sfile>:h')

let s:client = {}

" XXX should parse back a JSON object into Vim dictionary
function! s:client.exec(args)
  let script = join([s:.dirname, 'chrome.js'], '/')
  return system('node ' . script . ' ' . join(a:args, ' '))
endfunction

function! s:client.shell(args)
  let script = join([s:.dirname, 'chrome.js'], '/')
  exe '!node ' . script . ' ' . join(a:args, ' ')
endfunction

" XXX params should be passed in as vim dictionary, and piped to the node script
" from node's land, collect stdin and parse json
function! s:client.send(cmd, params, ...)
  let tab = a:0 ? a:1 : 0
  return self.shell(['--command', a:cmd, '--tab', tab])
endfunction


" :CReload
" -------
"
"  Reload the active webpage by default, unless a tab number is
"  specified.
"
" > http://trac.webkit.org/browser/trunk/Source/WebCore/inspector/Inspector.json#L222
"
"   - name: reload
"   - description": Reloads given page optionally ignoring the cache.
"   - parameters:
"     - ignoreCache boolean (optional) If true, browser cache is ignored (as
"     if the user pressed Shift+refresh)
"     - scriptToEvaluateOnLoad string (optional) If set, the script will be
"     injected into all frames of the inspected page after reload.
"

function! s:Reload(...)
  let tab = a:0 ? a:1 : 0
  echo 'Reload tab n°' . tab
  call s:client.send('Page.reload', {}, tab)
endfunction

function! s:RuntimeEvaluate(...)
  let expression = join(a:000, ' ')
  call s:client.shell(['--command', 'Runtime.Evaluate', '--params-expression "' . expression . '"'])
endfunction

command! -nargs=? CReload             call s:Reload(<f-args>)
command! -nargs=* CRuntimeEvaluate    call s:RuntimeEvaluate(<f-args>)


" vim:set sw=2 sts=2:

