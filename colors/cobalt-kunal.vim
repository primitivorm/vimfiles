" File: cobalt-kunal.vim
" Author: Kunal Sarkhel
" WEBSITE: http://github.com/techwzird/Gedit-Colorschemes-for-Vim/
" Description: A port of the gtksourceview-2.0 colorscheme, cobalt, that comes
"              with the the gedit text edior to gvim
" Last Modified: Monday, August 15, 2011

" Initialization and Setup {{{1
" ============================================================================
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "cobalt-kunal"
" 1}}}

" Normal Color {{{1
" ============================================================================
hi Normal           guifg=#ffffff   guibg=#001b33
" 1}}}

" Core Highlights {{{1
" ============================================================================
hi  ColorColumn     guifg=NONE      guibg=#ff0044
hi  Cursor          guifg=bg        guibg=fg        gui=NONE
hi  CursorIM        guifg=bg        guibg=fg        gui=NONE
hi  CursorLine      guifg=NONE      guibg=#003b70   gui=NONE
hi  CursorColumn    guifg=NONE      guibg=#003b70   gui=NONE
hi  lCursor         guifg=bg        guibg=fg        gui=NONE
hi  DiffAdd         guifg=#ffee80   guibg=NONE      gui=NONE
hi  DiffChange      guifg=#ff9d00   guibg=NONE      gui=NONE
hi  DiffDelete      guifg=#3ad900   guibg=NONE      gui=NONE
hi  DiffText        guifg=#777777   guibg=NONE      gui=NONE
hi  Directory       guifg=#1e90ff   guibg=bg        gui=NONE
hi  ErrorMsg        guifg=#ffffff   guibg=#990000   gui=bold
"hi  FoldColumn      guifg=#ffffff   guibg=#000d1a   gui=bold
"hi  Folded          guifg=#ffffff   guibg=#000d1a   gui=NONE
hi  FoldColumn      guifg=#ffffff   guibg=#00264d   gui=bold
hi  Folded          guifg=#ffffff   guibg=#00264d   gui=NONE
hi  IncSearch       guifg=#ffffff   guibg=#00bf8c   gui=NONE
hi  LineNr          guifg=#0065bf   guibg=#000d1a   gui=NONE
hi  MatchParen      guifg=NONE      guibg=#4f94cd   gui=NONE
hi  ModeMsg         guifg=#ffee80   guibg=NONE      gui=bold
hi  MoreMsg         guifg=#2e8b57   guibg=bg        gui=bold
hi  NonText         guifg=#9ac0cd   guibg=bg        gui=NONE
hi  Pmenu           guifg=#0000ff   guibg=#c0c8cf   gui=bold
hi  PmenuSel        guifg=#c0c8cf   guibg=#0000ff   gui=bold
hi  PmenuSbar       guifg=#ffffff   guibg=#c1cdc1   gui=NONE
hi  PmenuThumb      guifg=#ffffff   guibg=#838b83   gui=NONE
hi  Question        guifg=#00ee00   guibg=NONE      gui=bold
hi  Search          guifg=#ffffff   guibg=#00bf8c   gui=NONE
hi  SignColumn      guifg=#ffffff   guibg=#cdcdb4   gui=NONE
hi  SpecialKey      guifg=#777777   guibg=NONE      gui=NONE
hi  SpellBad        guisp=#ee2c2c   gui=undercurl
hi  SpellCap        guisp=#0000ff   gui=undercurl
hi  SpellLocal      guisp=#008b8b   gui=undercurl
hi  SpellRare       guisp=#ff00ff   gui=undercurl
hi  StatusLine      guifg=#ffffff   guibg=#000a14   gui=NONE
hi  StatusLineNC    guifg=#0065bf   guibg=#000a14   gui=italic
hi  TabLine         guifg=fg        guibg=#d3d3d3   gui=underline
hi  TabLineFill     guifg=fg        guibg=bg        gui=reverse
hi  TabLineSel      guifg=fg        guibg=bg        gui=bold
hi  Title           guifg=#009acd   guibg=bg        gui=bold
hi  VertSplit       guifg=#000d1a    guibg=#000a14
hi  Visual          guifg=#ffffff   guibg=#0088ff   gui=NONE
hi  WarningMsg      guifg=#ee9a00   guibg=bg        gui=NONE
hi  WildMenu        guifg=#000000   guibg=#87ceeb   gui=NONE
" 1}}}

" Syntax {{{1
" ============================================================================

"  General {{{2
" -----------------------------------------------------------------------------
hi  Comment         guifg=#0088ff   guibg=NONE      gui=italic

hi  Constant        guifg=#ffee80   guibg=NONE      gui=NONE
hi  String          guifg=#3ad900   guibg=NONE      gui=NONE
"hi  Character
hi  Number          guifg=#ff0044
hi  Boolean         guifg=#ff0044   guibg=NONE      gui=NONE
hi  Float           guifg=#ff0044

hi  Identifier      guifg=#cccccc   guibg=NONE      gui=NONE
hi  Function        guifg=#cccccc   guibg=NONE      gui=NONE

hi  Statement       guifg=#ff9d00   guibg=NONE      gui=NONE
"hi  Conditional
"hi  Repeat
"hi  Label
"hi  Operator
hi  Keyword         guifg=#ff9d00   guibg=NONE      gui=bold
"hi  Exception

hi  PreProc         guifg=#80ffbb   guibg=NONE      gui=bold
hi  Include         guifg=#3ad900
hi  Define          guifg=#0088ff   guibg=NONE      gui=bold
"hi  Macro
"hi  PreCondit

hi  Type            guifg=#80ffbb   guibg=NONE      gui=NONE
"hi  StorageClass
"hi  Structure
"hi  Typedef

"hi  Special         guifg=#ffdd00   guibg=#ffffff   gui=NONE
hi  Special         guifg=#ff0044   guibg=NONE      gui=bold
hi  SpecialChar     guifg=#cccccc
"hi  Tag
"hi  Delimiter
"hi  SpecialComment
"hi  Debug

hi  Underlined      guifg=#80ffbb   guibg=NONE      gui=italic,underline

hi  Ignore          guifg=#777777   guibg=NONE      gui=NONE

hi  Error           guifg=#ffffff   guibg=#990000   gui=bold

hi  Todo            guifg=#ffdd00   guibg=NONE      gui=bold
" 2}}}

" Vim {{{2
" -----------------------------------------------------------------------------
hi VimError         guifg=#ffffff   guibg=#990000   gui=bold
hi VimCommentTitle  guifg=#528b8b   guibg=bg        gui=bold,italic
" 2}}}

" QuickFix {{{2
" -----------------------------------------------------------------------------
hi qfFileName       guifg=#607b8b   guibg=NONE      gui=italic
hi qfLineNr         guifg=#0088aa   guibg=NONE      gui=bold
hi qfError          guifg=#ffffff   guibg=#990000      gui=bold
" 2}}}

" Python {{{2
" -----------------------------------------------------------------------------
"hi pythonDecorator  guifg=#cd8500   guibg=NONE      gui=NONE
"hi link pythonDecoratorFunction pythonDecorator
hi pythonInclude    guifg=#cccccc
hi pythonBuiltin    guifg=#ff0044   guibg=NONE     gui=bold
hi pythonStatement  guifg=#ff9d00   guibg=NONE      gui=bold
hi pythonFunction   guifg=NONE
" 2}}}

" Diff {{{2
" -----------------------------------------------------------------------------
hi diffOldFile      guifg=#da70d6   guibg=NONE      gui=italic
hi diffNewFile      guifg=#ffff00   guibg=NONE      gui=italic
hi diffFile         guifg=#0088ff   guibg=NONE      gui=bold
hi diffLine         guifg=#ff00ff   guibg=NONE      gui=italic
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi diffRemoved      guifg=#3ad900   guibg=NONE      gui=NONE
hi diffChanged      guifg=#ff9d00   guibg=NONE      gui=NONE
hi diffAdded        guifg=#ffee80   guibg=NONE      gui=NONE
hi link             diffSubname     diffLine
hi link             diffComment     Comment
" 2}}}

" 1}}}
