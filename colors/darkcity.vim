" Vim color file
" Maintainer: Oscar Hellström
" Last Change: 2006-02-16
" Version: 0.1
" Notes:
" Terminal colors based on Baycomb v1.2
" http://www.vim.org/scripts/script.php?script_id=1454
" GUI colors based on Oceanblack
" http://www.vim.org/scripts/script.php?script_id=603

""" Init
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "darkcity"


"""" GUI Colors
hi CursorIM         gui=bold        guifg=white             guibg=Gray
hi Cursor		    guibg=#ffffff   guifg=#000000
hi CursorLine	    guibg=DarkRed
"hi CursorLine	    guibg=#3e4446
hi CursorColumn	    guibg=#3e4446

hi Directory                        guifg=LightSeaGreen     guibg=bg
hi DiffAdd          gui=None        guifg=fg                guibg=DarkCyan
hi DiffChange       gui=None        guifg=fg                guibg=Green4
hi DiffDelete       gui=None        guifg=fg                guibg=black
hi DiffText         gui=bold        guifg=fg                guibg=bg
hi ErrorMsg                         guifg=LightYellow       guibg=FireBrick
hi VertSplit        gui=NONE        guifg=black             guibg=grey60
hi Folded           gui=bold        guifg=#b0d0e0           guibg=#305060
hi FoldColumn       gui=None        guifg=#b0d0e0           guibg=#305060
hi IncSearch        gui=reverse     guifg=fg                guibg=bg
hi LineNr                           guifg=#777777           guibg=#101010
hi ModeMsg                          guifg=LightGreen        guibg=DarkGreen
hi MoreMsg          gui=bold        guifg=SeaGreen4         guibg=bg
if version < 600
    " same as SpecialKey
hi NonText                          guifg=#3D5D6D           guibg=#123A4A
else
    " Bottom fill (use e.g. same as LineNr)
hi NonText          gui=None        guifg=LightSkyBlue      guibg=#000000
endif
hi Normal           gui=None        guifg=honeydew2         guibg=#000000
hi Question         gui=bold        guifg=SeaGreen2         guibg=bg
hi Search           gui=NONE        guifg=NONE              guibg=LightSkyBlue4
hi SpecialKey                       guifg=#324262           guibg=#103040
hi StatusLine       gui=bold        guifg=black             guibg=grey88
hi StatusLineNC     gui=NONE        guifg=grey10            guibg=grey60
hi Title            gui=bold        guifg=MediumOrchid1     guibg=bg
hi Visual           gui=reverse     guifg=SeaGreen          guibg=WHITE
hi VisualNOS        gui=bold,underline guifg=fg             guibg=bg
hi WarningMsg       gui=bold        guifg=FireBrick1        guibg=bg
hi WildMenu         gui=bold        guifg=Black             guibg=Chartreuse


"""" Syntax Colors

hi Comment          gui=None        guifg=#B1D81B
hi Constant                         guifg=cyan3             guibg=bg
hi String           gui=None        guifg=#E07330           guibg=bg
hi Character        gui=None        guifg=Cyan              guibg=bg
hi Number           gui=None        guifg=#b72a2a           guibg=black
hi Boolean          gui=bold        guifg=#dbd134           guibg=bg
hi Float            gui=None        guifg=#b72a2a           guibg=bg

hi Identifier                       guifg=LightSkyBlue3
hi Function         gui=None        guifg=DarkSeaGreen3     guibg=bg

hi Statement        gui=NONE        guifg=#dbd134
hi Conditional      gui=None        guifg=#048f01             guibg=bg
hi Repeat           gui=None        guifg=#048f01         guibg=bg
hi Label            gui=None        guifg=LightGreen        guibg=bg
hi Operator         gui=None        guifg=Chartreuse        guibg=bg
hi Keyword          gui=None        guifg=LightGreen        guibg=bg
hi Exception        gui=None        guifg=LightGreen        guibg=bg

hi PreProc                          guifg=SkyBlue1
hi Include          gui=None        guifg=LightSteelBlue3   guibg=bg
hi Define           gui=None        guifg=LightSteelBlue2   guibg=bg
hi Macro            gui=None        guifg=LightSkyBlue3     guibg=bg
hi PreCondit        gui=None        guifg=LightSkyBlue2     guibg=bg


hi Type             gui=NONE        guifg=#80a0ff
hi StorageClass     gui=None        guifg=#80a0ff           guibg=bg
hi Structure        gui=None        guifg=#80a0ff           guibg=bg
hi Typedef          gui=None        guifg=#80a0ff           guibg=bg

hi Special                          guifg=#999999
hi SpecialChar      gui=none        guifg=#cf7000             guibg=#101010
hi Tag              gui=bold        guifg=White             guibg=bg
hi Delimiter        gui=bold        guifg=White             guibg=bg
hi SpecialComment   gui=bold        guifg=White             guibg=bg
hi Debug            gui=bold        guifg=White             guibg=bg
hi Underlined       gui=underline   guifg=honeydew4         guibg=bg
hi Ignore                           guifg=bg
hi Error                            guifg=LightYellow       guibg=FireBrick
hi Todo                             guifg=Cyan              guibg=#507080

"""" Color terminal definitions

hi Cursor           cterm=None        ctermfg=White             ctermbg=DarkGray 
hi Normal                                   ctermfg=LightGrey
hi Number                                   ctermfg=DarkRed
hi Operator                                 ctermfg=LightGreen
hi Conditional                              ctermfg=DarkGreen
hi Repeat                                   ctermfg=DarkGreen
hi Exception                                ctermfg=LightGreen
hi function                                 ctermfg=DarkGreen
hi SpecialKey                               ctermfg=LightBlue
hi NonText          cterm=bold              ctermfg=LightBlue
hi Directory                                ctermfg=darkcyan
hi ErrorMsg         cterm=bold              ctermfg=Yellow          ctermbg=1
hi IncSearch        cterm=reverse           ctermfg=fg             
hi Search           cterm=NONE              ctermfg=white             ctermbg=LightBlue
hi MoreMsg          cterm=bold              ctermfg=LightGreen
hi ModeMsg          cterm=NONE              ctermfg=LightGreen
hi LineNr                                   ctermfg=Gray            ctermbg=DarkGray
hi Question         cterm=bold              ctermfg=green
hi StatusLine       cterm=NONE              ctermfg=blue            ctermbg=grey
hi StatusLineNC     cterm=NONE              ctermfg=black           ctermbg=grey
hi VertSplit        cterm=NONE              ctermfg=black           ctermbg=grey
hi Title                                    ctermfg=15
hi Visual           cterm=reverse           ctermfg=DarkGreen           ctermbg=White
hi VisualNOS        cterm=underline,bold    ctermfg=black           ctermbg=darkcyan 
hi WarningMsg       cterm=bold              ctermfg=Yellow
hi WildMenu         cterm=bold              ctermfg=Black           ctermbg=LightGray
hi Folded           cterm=NONE              ctermfg=darkgreen       ctermbg=NONE 
hi FoldColumn                               ctermfg=green           ctermbg=black
hi DiffAdd                                                          ctermbg=4
hi DiffChange                                                       ctermbg=5
hi DiffDelete       cterm=bold              ctermfg=4               ctermbg=6
hi DiffText         cterm=bold                                      ctermbg=1
hi Comment          cterm=NONE              ctermfg=DarkGray
hi Constant                                 ctermfg=Cyan
hi Special                                  ctermfg=Gray
hi Identifier                               ctermfg=LightBlue
hi Statement                                ctermfg=Yellow
hi PreProc                                  ctermfg=LightBlue
hi Type                                     ctermfg=Blue 
hi Underlined       cterm=underline         ctermfg=fg
hi Ignore                                   ctermfg=fg
hi Error            cterm=bold              ctermfg=yellow
hi Macro            cterm=NONE              ctermfg=LightBlue
hi Include          cterm=NONE              ctermfg=LightBlue
hi String           cterm=NONE              ctermfg=Brown
hi boolean          cterm=bold              ctermfg=yellow

"""" New Vim 7.0 items
hi Pmenu                                    ctermfg=lightgrey       ctermbg=darkblue
hi PmenuSel                                 ctermfg=white           ctermbg=lightblue
