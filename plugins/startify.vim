let g:startify_list_order = [
  \ ['  >> Bookmarks'], 'bookmarks',
  \ ['  >> Sessions'], 'sessions',
  \ ['  >> Most recently used files in cwd (mru)'], 'dir',
  \ ['  >> Most recently used files (mru)'], 'files',
  \ ]

let g:startify_bookmarks = ['~/.bashrc', '~/.hyper.js',
\ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240
