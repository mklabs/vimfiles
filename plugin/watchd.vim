

fun! s:open(files, cmdlist)
  let file = a:files
  let args = join(a:cmdlist, " ")

  let msg = file . " changed."

  let welcome = "\nTelling " . file . " changed is the default action."
  let welcome .= "\n\nYou might want to define a command to run by providing some arguments:"
  let welcome .= "\n\n  :Watch ls"
  let welcome .= "\n\n  :Watch npm test"
  let welcome .= "\n\n  :Watch eslint"
  let welcome .= "\n\n---"

  let cmdOption = args != "" ? args : "echo " . msg
  if args != ""
    let welcome = "\nStarting watching " . file
    let welcome .= "\n\nCommand to run on change: "
    let welcome .= "\n\n    " . args
  endif

  let cmd = "echo '" . welcome . "'"
  let cmd .= " && watchd " . file . " -c \"" . cmdOption . "\""

  exe "VTerm " . cmd
endf

fun! s:watch(args)
  return s:open(expand("%"), a:args)
endf

fun! s:watchFiles(file, ...)
  let cmd = copy(a:000)

  return s:open(a:file, cmd)
endf

command! -nargs=* -complete=file Watch call s:watch(<q-args>)
command! -nargs=* -complete=file WatchFiles call s:watchFiles(<f-args>)
