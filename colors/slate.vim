" Author:      Michael Sanders (msanders42 [at] gmail [dot] com)
" Description: Slate colorscheme, adopted from TextMate.
" Usage:       This colorscheme is meant only for use with vim in a terminal
"              using the following custom colorscheme, or gvim.
"
"              To get it to work in Terminal.app, first install TerminalColors
"              (http://www.culater.net/software/TerminalColors/TerminalColors.php)
"              and use this theme I made to go along with this color scheme:
"              http://cloud.github.com/downloads/msanders/vim-files/Slate.terminal.
"
"              To get it to work in xterm, append the following file to your
"              ~/.Xresources:
"              http://cloud.github.com/downloads/msanders/vim-files/xterm-slate.txt.

" The following are the default 16 colors for Terminal.app:
"
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #EF5860
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF

" These are the modified colors for this theme:
" 			Colors		Bright Colors
" Black		#0F2130		#B0B3B9
" Red		#D22613		#F96795
" Green		#7CDE53		#A0F2A0
" Yellow	#EBE645		#F4EF82
" Blue		#2C9ADE		#A3FEFE
" Magenta	#FFA705		#F1B356 (magenta == orange now)
" Cyan		#8A95A7		#B0C3DA
" White		#F8F8F8		#FFFFFF

set bg=dark
hi clear
let colors_name = 'slate'

" General colors
hi Normal		guifg=#F8F8F8	guibg=#12384B	gui=NONE
hi NonText		guifg=#A3FEFE					gui=NONE	ctermfg=blue

hi Cursor		guifg=NONE		guibg=#8BA7A7
hi LineNr		guifg=#B0B3B9					gui=bold	ctermfg=darkgray						cterm=bold

hi VertSplit	guifg=#F8F8F8	guibg=#0F2130	gui=NONE	ctermfg=lightgray		ctermbg=black	cterm=NONE

hi Visual		guibg=#B0C3DA														ctermbg=cyan

hi Title		guifg=#F1B356	guibg=NONE					ctermfg=magenta			ctermbg=NONE
hi WildMenu		guifg=#0F2130	guibg=#B0B3B9				ctermfg=black			ctermbg=lightgray
hi ErrorMsg		guifg=#F8F8F8	guibg=#D22613	gui=bold	ctermfg=lightgray		ctermbg=darkred	cterm=bold
hi WarningMsg	guifg=#F4EF82	guibg=#0F2130	gui=bold	ctermfg=yellow			ctermbg=black   cterm=bold

hi ModeMsg		guifg=#B0B3B9	guibg=#0F2130	gui=bold	ctermfg=lightgray		ctermbg=black	cterm=bold

if version >= 700 " Vim 7 specific colors
  hi CursorLine					guibg=#0F2130										ctermbg=black	cterm=NONE
  hi! link CursorColumn CursorLine
  hi MatchParen	guifg=#0F2130	guibg=#B0B3B9					ctermfg=black		ctermbg=lightgray
  hi Search		guifg=NONE		guibg=NONE		gui=inverse		ctermfg=NONE		ctermbg=NONE	cterm=inverse
endif

hi Pmenu		guifg=#000000	guibg=#F8F8F8					ctermfg=black		ctermbg=lightgray
hi PmenuSbar	guifg=#8A95A7	guibg=#F8F8F8	gui=NONE		ctermfg=darkcyan	ctermbg=lightgray	cterm=NONE
hi PmenuThumb	guifg=#F8F8F8	guibg=#8A95A7	gui=NONE		ctermfg=lightgray	ctermbg=darkcyan	cterm=NONE

" Syntax highlighting
hi Comment		guifg=#2C9ADE					gui=italic		ctermfg=darkblue
hi String		guifg=#7CDE53									ctermfg=darkgreen

hi Keyword		guifg=#ffa705									ctermfg=darkmagenta
hi PreProc		guifg=#f1994a									ctermfg=magenta

hi Todo			guifg=#abc4dd	guibg=NONE						ctermfg=cyan	ctermbg=NONE
hi Constant		guifg=#fa6870									ctermfg=red

hi Identifier	guifg=#f1994a									ctermfg=magenta							cterm=NONE
hi Type			guifg=#f5f16e					gui=NONE		ctermfg=yellow
hi Statement	guifg=#f1994a					gui=NONE		ctermfg=magenta

hi Special		guifg=#84f796									ctermfg=green
hi Delimiter	guifg=#f1994a					gui=NONE		ctermfg=magenta

hi  link Number         Constant
hi! link StatusLine     VertSplit
hi! link StatusLineNC   VertSplit
hi! link Question       Special
hi! link MoreMsg        Special
hi! link Folded         Normal

hi link Operator        Delimiter
hi link Function        Identifier
hi link PmenuSel        PmenuThumb
hi link Error			ErrorMsg
hi link Conditional		Keyword
hi link Character		String
hi link Boolean			Constant
hi link Float			Number
hi link Repeat			Statement
hi link Label			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link SpecialComment	Special
hi link Debug			Special

" Ruby
hi link rubyClass				Keyword
hi link rubyModule				Keyword
hi link rubyKeyword				Keyword
hi link rubyOperator			Operator
hi link rubyIdentifier			Identifier
hi link rubyInstanceVariable	Identifier
hi link rubyGlobalVariable		Identifier
hi link rubyClassVariable		Identifier
hi link rubyConstant			Type

" HTML/XML
hi link xmlTag				HTML
hi link xmlTagName			HTML
hi link xmlEndTag			HTML
hi link htmlTag				HTML
hi link htmlTagName			HTML
hi link htmlSpecialTagName	HTML
hi link htmlEndTag			HTML
hi link HTML 				NonText

" JavaScript
hi link javaScriptNumber	Number

" Objc
hi link objcDirective		Type
hi objcMethodName ctermfg=darkyellow guifg=#eceb00

" CSS
hi link cssBraces			Normal
hi link cssTagName			NonText
hi link StorageClass		Special
hi link cssClassName		Special
hi link cssIdentifier		Identifier
hi link cssColor			Type
hi link cssValueInteger		Type
hi link cssValueNumber		Type
hi link cssValueLength		Type
hi cssPseudoClassId			guifg=#eceb00 ctermfg=darkyellow

hi clear SpellBad
hi SpellBad ctermfg=red term=underline cterm=underline
hi clear SpellCap
hi SpellCap term=underline cterm=underline
hi clear SpellRare
hi SpellRare term=underline cterm=underline
hi clear SpellLocal
hi SpellLocal term=underline cterm=underline

" vim:noet:sw=4:ts=4:ft=vim
