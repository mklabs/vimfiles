
command! -nargs=* Npm :Term npm <q-args>
command! -nargs=* Npmi :3Term npm install <args> --save

command! -count=2 -nargs=* Node :<count>Term node
