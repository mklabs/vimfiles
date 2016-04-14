
function! s:edit(file)
  let dirname = fnamemodify(a:file, ':h')
  echo dirname

  exe 'silent !mkdir -p ' . dirname
  exe 'edit ' . a:file
endf

command! -complete=file -nargs=1 Edit call s:edit(<q-args>)
