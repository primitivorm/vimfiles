" Vim color file
" Maintainer: Primitivo Roman <cibercafe_montero@hotmail.com>
"     Based on the work by: Ricardo Valeriano <ricardo.valeriano@gmail.com>
"     URL: https://github.com/ricardovaleriano/vim-github-theme
" Last Change: Feb, 06, 2013
" Version: 0.1
" Homepage:https://github.com/primitivorm/vim-proman-theme.git

" This is a ViM's version of the proman color theme.

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "proman"
set t_Co=256

hi Comment              guifg=#696969 ctermfg=105 gui=italic,bold cterm=italic,bold

hi Constant             guifg=#008080 ctermfg=30
    hi String           guifg=#C71585 ctermfg=161
    hi Character        guifg=#C71585 ctermfg=161
    hi Number           guifg=#009999 ctermfg=30
    hi Boolean          gui=bold cterm=bold
    hi Float            guifg=#009999 ctermfg=30
    hi RubySymbol       guifg=#990073 ctermfg=90

hi Identifier           guifg=#1e90ff ctermfg=30
    hi Function         guifg=#ff4500 ctermfg=88 gui=bold cterm=bold

hi Statement            guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Conditional      guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Repeat           guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Label            guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Operator         guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Keyword          guifg=#800000 ctermfg=16 gui=bold cterm=bold
    hi Exception        guifg=#800000 ctermfg=88 gui=bold cterm=bold

hi PreProc              guifg=#ff00ff ctermfg=102 gui=bold cterm=bold
    hi Include          guifg=#009999 ctermfg=102 gui=bold cterm=bold
    hi Define           guifg=#ff4500 ctermfg=16 gui=bold cterm=bold
    hi Macro            guifg=#ff4500 ctermfg=102 gui=bold cterm=bold
    hi PreCondit        guifg=#ff4500 ctermfg=102 gui=bold cterm=bold

hi Type                 guifg=#4B0082 ctermfg=60 gui=bold cterm=bold
    hi StorageClass     guifg=#4B0082 ctermfg=16 gui=bold cterm=bold gui=bold cterm=bold
    hi Structure        guifg=#4B0082 ctermfg=16 gui=bold cterm=bold
    hi Typedef          guifg=#4B0082 ctermfg=16 gui=bold cterm=bold

hi Special              guifg=#dd1144 ctermfg=161
    hi SpecialChar      guifg=#808080 ctermfg=161
    hi Tag              guifg=#000080 ctermfg=18
    hi Delimiter        guifg=#dd1144 ctermfg=161
    hi SpecialComment   guifg=#999999 ctermfg=102 gui=bold,italic cterm=bold,italic
    hi Debug            guifg=#aa0000 ctermfg=124

hi Underlined           gui=underline cterm=underline
hi Ignore               guifg=bg
hi Error                guifg=#a61717 ctermfg=124 guibg=#e3d2d2 ctermbg=188
hi Todo                 guifg=#999988 ctermfg=102 gui=italic cterm=italic

hi Cursor               guifg=NONE ctermfg=NONE guibg=#ff9900 ctermbg=227
hi CursorLine           guifg=NONE ctermfg=NONE guibg=#E6E6FA ctermbg=230 cterm=bold term=bold
hi CursorColumn         guifg=NONE ctermfg=NONE guibg=#E6E6FA ctermbg=230 cterm=bold term=bold
hi Directory            guifg=#4183c4 ctermfg=68
hi DiffAdd              guifg=#000000 ctermfg=16 guibg=#ddffdd ctermbg=194
hi DiffDelete           guifg=#000000 ctermfg=16 guibg=#ffdddd ctermbg=224
hi DiffText             guibg=#666666 ctermbg=59
hi ErrorMsg             guifg=#a61717 ctermfg=124 guibg=#e3d2d2 ctermbg=188 gui=bold cterm=bold
hi VertSplit            guifg=#666666 ctermfg=59 guibg=#eaeaea ctermbg=188
hi LineNr               guifg=#666666 ctermfg=59 guibg=#eaeaea ctermbg=188
hi ModeMsg              gui=bold cterm=bold
hi Normal               guifg=#101010 ctermfg=16 guibg=#f8f8f8 ctermbg=231
hi Pmenu                guibg=#babdb6 ctermbg=145 guifg=#555753 ctermfg=59
hi StatusLine           guifg=#666666 ctermfg=59 guibg=#eaeaea ctermbg=188
hi Visual               guifg=#000000 ctermfg=NONE guibg=#B0C4DE ctermbg=230
hi Search               guifg=#000000 ctermfg=NONE guibg=#ffff8c ctermbg=230

"this is a workaround to show the cursor on the Terminal.app
"thanks to: http://www.damtp.cam.ac.uk/user/rbw/vim-osx-cursor.html
if $TERM_PROGRAM == "Apple_Terminal" && !has("gui_running")
  hi CursorLine term=none cterm=none "Invisible CursorLine
  hi Cursor     ctermfg=none ctermbg=85
  set cursorline
  match Cursor /\%#/
endif
