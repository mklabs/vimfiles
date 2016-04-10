
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec, file_rec/async', 'ignore_pattern', 'node_modules')
"
" Set "-no-quit" automatically in grep unite source.
call unite#custom#profile('source/grep', 'context', {
\   'no_quit' : 1
\ })
"
" Using ack-grep as recursive command.
" let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']

" Using ag as recursive command.
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',  '--hidden', '-g', '']

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\  'start-insert': 1
\ })

" Ctrl-{key} to fuzzy find stuff
map <C-p> :Unite -direction=botright -winheight=10 file_rec/neovim<CR>
map <C-b> :Unite -direction=botright -winheight=10 buffer bookmark<CR>
map <C-a> :Unite -direction=botright -winheight=10 file_rec/git<CR>
