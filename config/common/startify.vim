let g:startify_list_order = [
  \ ['  >> Most recently used files in cwd (mru)'], 'dir',
  \ ['  >> Most recently used files (mru)'], 'files',
  \ ['  >> Sessions'], 'sessions',
  \ ['  >> Bookmarks'], 'bookmarks'
  \ ]

let node = split('node ' . system('node -v'), '\n')
let npm = split('npm ' . system('npm -v'), '\n')
let g:startify_custom_header = map(node + npm, '"   ". v:val')

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240
