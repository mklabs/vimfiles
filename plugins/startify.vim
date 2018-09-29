let g:startify_list_order = [
  \ ['  >> Bookmarks'], 'bookmarks',
  \ ['  >> Sessions'], 'sessions',
  \ ['  >> Most recently used files in cwd (mru)'], 'dir',
  \ ['  >> Most recently used files (mru)'], 'files',
  \ ]

let g:startify_bookmarks = systemlist(
\ "node -e \"path = require('path');"
\ . "fs = require('fs');"
\ . "HOME = process.env.USERPROFILE || process.env.HOME; "
\ . "try {"
\ . " files = fs.readdirSync(path.join(HOME, 'dev')); "
\ . " files = files.map(dir => path.join(HOME, 'dev', dir)); "
\ . " files = files.map(dir => ({ dir, stat: fs.statSync(dir) })); "
\ . " files = files.filter(dir => dir.stat.isDirectory());"
\ . " files = files.filter(dir => !dir.dir.includes('Recycle.Bin'));"
\ . " files = files.map(dir => dir.dir);"
\ . " files = files.map(dir => dir.replace(HOME, '~'));"
\ . " console.log(files.join('\\n'));"
\ . "} catch(e) {}"
\ . "\"")

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240
