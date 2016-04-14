

fun! s:github(args)
  let parts = split(a:args, '/')
  let repo = join(parts[:1], '/')
  let file = substitute(a:args, repo, '', 'g')

  let url = "https://api.github.com/repos/" . repo . "/git/trees/master"
  let tree = JSON#parse(system("curl -s " . url))

  if has_key(tree, 'message') && tree.message == "Not Found"
    echo repo . " is not a valid repo.\nPlease, check that https://github.com/" . repo . " exists."
    return
  endif


  if file == ""
    let file = "/readme.md"

    let readme = filter(tree.tree, 'v:val.path == "readme.md"')

    if empty(readme)
      echo "No readme found for " . repo
    endif

    return
  endif

  let file = substitute(file, 'blob/master/', '', '')
  exe "r! curl -s https://raw.githubusercontent.com/" . repo . "/master" . file
endf

command! -nargs=* Github call s:github(<q-args>)
