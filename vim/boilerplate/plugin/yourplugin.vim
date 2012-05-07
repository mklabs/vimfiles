" {{ filename }} -  {{ title }}
" Maintainer:       {{ author }}

if exists("g:loaded_{{ filename }}") || v:version < 700 || &cp
  finish
endif
let g:loaded_{{ filename }} = 1

"
" Fun things start here
"



" vim:set sw=2 sts=2:

