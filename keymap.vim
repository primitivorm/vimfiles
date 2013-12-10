"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","

" Opening files located in the same directory as the current file {{{
cmap %% <C-R>=expand('%:h').'/'<cr>
"open in the same window replace existent
map <leader>ew :e %%
"split horizontal
map <leader>es :sp %%
"split vertical
map <leader>ev :vsp %%
"open in a new tab
map <leader>et :tabe %%
" }}}

" Window navigation {{{
map <C-w> <C-w>w " cycle between the open windows
map <C-Left> <C-w>h " focus the window to the left
map <C-Down> <C-w>j " focus the window to the down
map <C-Up> <C-w>k " focus the window to the up
map <C-Right> <C-w>l " focus the window to the right
"}}}

" Create window splits easier. The default {{{
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nmap <silent>vv <C-w>v
nmap <silent>ss <C-w>s
" }}}

" Adjust viewports {{{
"Same size
nmap <Leader>= <C-w>=
"Maximize Up to Down
nmap <Leader>_ <C-w>_
"Maximize Left to Right
nmap <Leader><Bar> <C-w><Bar>
"}}}

" Resize window {{{
"http://vim.usrsb.in/117060445
"can resize your windows using Alt plus an arrow key.
nmap <C-A-Left>  : vertical res +1<cr>
nmap <C-A-Right> : vertical res -1<cr>
nmap <C-A-Down>  : res +1<cr>
nmap <C-A-Up>    : res -1<cr>
" }}}

" Tab maps {{{
" Tab navigation like Firefox
nmap <silent><C-Tab> :  tabnext<cr>
nmap <silent><S-Tab> :  tabprev<cr>
nmap <silent><C-F4>  :  tabclose<cr>
nmap <silent><C-T>  :   tabnew<cr>
"http://stackoverflow.com/questions/2106138/rearrange-tabs-with-the-mouse-in-gvim
"Move tab to Left
function! TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

"Move tab to Right
function! TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
 endfunction0

nmap <silent><A-Left>  : call TabLeft()<CR>
nmap <silent><A-Right> : call TabRight()<CR>
" }}}

" Easy Vim Mapping like others editors {{{

"Shift-Home, Shift-End
nnoremap <silent><S-Home> <Esc>v^
nnoremap <silent><S-End> <Esc>v$
inoremap <silent><S-Home> <Esc>v^
inoremap <silent><S-End> <Right><Esc>v$

"Ctrl-Shift-Home, Ctrl-Shift-End
nnoremap <silent><C-S-Home> <Esc>v^gg
nnoremap <silent><C-S-End> <Esc>v$G$
inoremap <silent><C-S-Home> <Esc>v^gg
inoremap <silent><C-S-End> <Right><Esc>v$G$

"Ctrl-Shift-Left, Ctrl-Shift-Right
nnoremap <silent><C-S-Left> <Esc>vb
nnoremap <silent><C-S-Right> <Esc>vw
inoremap <silent><C-S-Left> <Esc>vb
inoremap <silent><C-S-Right> <Right><Esc>vw

"Shift-Up, Shift-Down
nnoremap <silent><S-Up> <Esc>vk
nnoremap <silent><S-Down> <Esc>vj
vnoremap <silent><S-Up> k
vnoremap <silent><S-Down> j
inoremap <silent><S-Up> <Esc>vk
inoremap <silent><S-Down> <Right><Esc>vj

"Change to Normal mode
vnoremap <silent><Up> <Esc>k
vnoremap <silent><Down> <Esc>j

"Sift-left, Shift-Right
nnoremap <silent><S-Left> vh
nnoremap <silent><S-Right> vl
vnoremap <silent><S-Left> h
vnoremap <silent><S-Right> l
inoremap <silent><S-Left> <Esc>vh
inoremap <silent><S-Right> <Right><Esc>vl

"in Insert mode Left goto last initial Visual selection and Change to Insert mode
vnoremap <silent><Left> <Esc>`<i
"in Insert mode Right goto last final Visual selection and Change to Insert mode
vnoremap <silent><Right> <Esc>`>a

" Backspace in Visual mode deletes selection
vnoremap <silent><BS> di
" Backspace in Normal mode goto back word
nnoremap <silent><BS> b
" Ctrl-Backspace erase a word
nnoremap <silent><C-BS> diw
"Tab in Normal mode goto next word
nnoremap <silent><Tab> w
" Del switch to Insert mode
vnoremap <silent><Del> <Del>i

" to the clipboard with <leader>x <leader>y and <leader>p
"CUT
nmap <leader>x "+x
vmap <leader>x "+x
"YANK
map <leader>Y "+yy
vmap <leader>y "+y
"PASTE
map <leader>p "+gp
noremap <leader>P "+gP

"disable paste when MiddleMouse press
"http://vim.wikia.com/wiki/Mouse_wheel_for_scroll_only_-_disable_middle_button_paste
map <MiddleMouse> <LeftMouse>

"CTRL-N is New file
nmap <silent><C-N>  :   tabnew<cr>

"CTRL-O is Open file
if has('gui_running')
    nmap <c-o> :browse confirm e<cr>
else
    nmap <c-o> :tabe %%
endif

"CTRL-F is Find command
map <C-F> /\v<C-r><C-w>
"Replace
nmap <C-h> :%s/<C-r><C-w>/

"CTRL-U is Change minus to MAYUS
vmap <C-u> U
"CTRL-L is Change MAYUS to minus
vmap <C-l> u

"Spelling Check
nmap <c-f7> :set spell!<cr>
nmap <f7> ]s
nmap <s-f7> [s

"insert autoclose for {
imap {<CR> {<CR>}<Esc>O

"insert autoclose for %
inoremap % %%<Left>
"}}}

" Tab completion {{{
"for file completion
imap <c-f> <c-x><c-f>
"for line completion
imap <C-l> <c-x><c-l>
"for thesaurus file
imap <c-t> <c-x><c-t>
"for tag completion
imap <c-]> <c-x><c-]>
"current file all words
imap <c-u> <c-x><c-u>
"macro completion
imap <c-d> <c-x><c-d>
""for words in current file
"imap <c-i> <c-x><c-i>
"}}}

" Execute current line or current selection as Vim EX commands. {{{
"http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands
nmap <F10> :exe getline(".")<CR>
vmap <F10> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>
"}}}
"
"SnipMate completion {{{
imap <C-Space> <C-G>u<C-R>=snipMate#TriggerSnippet()<CR>
" }}}

" Highlight all words when press <CR> {{{
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nmap <silent> <expr> <CR> Highlighting()

"http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type <leader>/ to toggle highlighting on/off.
nmap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=1000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'),'\').'\>'
    augroup end
    setl updatetime=1000
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
""call at startup
"call AutoHighlightToggle()

"http://vim.wikia.com/wiki/Open_Windows_Explorer_showing_directory_of_current_buffer
nmap <leader>e :!start explorer "%:p:h"<CR>

"center search
"http://vim.wikia.com/wiki/VimTip528
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap { {zz
nmap } }zz
nmap G Gzz
" }}}

" General {{{

"Go to last edit location with ,.
nmap ,. '.

" Type <leader>hl to toggle highlighting on/off, and show current value.
map <leader>h :set hlsearch! hlsearch?<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"list
nmap <leader>l :set list!<CR>

" Edit the vimrc file
" source $MYVIMRC
nmap <silent><leader>ed :e $MYVIMRC<CR>
nmap <silent><leader>sv :so $MYVIMRC<CR>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
imap jj <Esc>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Folding
nmap <Space> za
vmap <Space> za

" Reselect text that was just pasted with ,v
nmap <leader>v V`]

" }}}

"--------------------------------------------
"FUNCTIONS
"--------------------------------------------

" StripTrailingWhitespaces {{{
" taken from: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun
" command to strip white space from any file
nmap <leader>s :call <SID>StripTrailingWhitespaces()<cr>
"auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
" for al File Types
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nmap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Theme Rotating {{{
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      "railscasts#amy#
      let colorstring = "default#Monokai#eclipse#badwolf#mustang#wombat#github#smyck#bandit#blackboard#Sunburst#galaxy#candy#hybrid#hybrid-light#mac_classic#mickeysoft#solarized#proman"
      let x = match(colorstring,"#",g:themeindex)
      let y = match(colorstring,"#",x + 1)
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring,x + 1,y - x - 1)
         return ":colorscheme ".themestring
      endif
   endwhile
endfunction

" Rotate Color Scheme <F12>
nmap <silent><F12> :execute RotateColorTheme()<CR>
" }}}

"--------------------------------------------
"PLUGINS
"--------------------------------------------

" Bundle {{{
nmap <leader>bi :BundleInstall<cr>
" }}}

" GUndo {{{
nmap <silent><S-U> :GundoToggle<CR>
" }}}

" Ctrlp {{{
nmap <C-p> :CtrlP<CR>
imap <C-p> <esc>:CtrlP<CR>
nmap <C-b> :CtrlPBuffer<CR>
imap <C-b> <esc>:CtrlPBuffer<CR>
" }}}

" msbuild {{{
autocmd BufRead *.csproj,*.vbproj,*.cs,*.vb,*.sln nmap <F5> :make /t:rebuild<cr>
" }}}

" vim-nerdtree-tabs {{{
map <F2> :NERDTreeToggle<CR>
"map <F2> :NERDTreeTabsToggle<CR>
" }}}

" Tagbar {{{
map <F3> :TagbarToggle<CR>
nmap <C-]> :tabnew %<CR>g<C-]>
vmap <C-]> <Esc>:tabnew %<CR>gvg<C-]>
" }}}

" ctags {{{
"Search and destroy using tags
map <C-F3> :!ctags -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>
" }}}

" Fugitive {{{
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :GitPush<CR>
nmap <silent> <leader>gu :GitPull<CR>
"}}}

" sql formatter {{{
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>
" }}}

" dbext {{{
" execute statement
autocmd FileType sql nmap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql vmap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql map <A-F1> :DBDescribeTable <cr>

"remap <leader>sl+ to <leader>l+
autocmd FileType sql nmap <leader>lt :DBListTable <cr>
autocmd FileType sql nmap <leader>lp :DBListProcedure <cr>
autocmd FileType sql nmap <leader>lv :DBListView <cr>
autocmd FileType sql nmap <leader>lc :DBListColumn <cr>
" }}}

" Omnisharp {{{
autocmd FileType *.cs map <F5> :wa!<cr>:call OmniSharp#Build()<cr>
autocmd FileType *.cs map gd :call OmniSharp#GotoDefinition()<cr>
autocmd FileType *.cs nmap fi :call OmniSharp#FindImplementations()<cr>
autocmd FileType *.cs nmap fu :call OmniSharp#FindUsages()<cr>
autocmd FileType *.cs nmap <leader>tl :call OmniSharp#TypeLookup()<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
autocmd FileType *.cs nmap <c-space> :call OmniSharp#GetCodeActions()<cr>
" rename with dialog
autocmd FileType *.cs nmap nm :call OmniSharp#Rename()<cr>
autocmd FileType *.cs nmap <silent><S-F2> :call OmniSharp#Rename()<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
autocmd FileType *.cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" Force OmniSharp to reload the solution. Useful when switching branches etc.
autocmd FileType *.cs nmap <leader>rl :call OmniSharp#ReloadSolution()<cr>
autocmd FileType *.cs nmap <leader>cf :call OmniSharp#CodeFormat()<cr>
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
autocmd FileType *.cs nmap <leader>ss :OmniSharpStartServer<cr>
autocmd FileType *.cs nmap <leader>sp :OmniSharpStopServer<cr>
autocmd FileType *.cs nmap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
" }}}

" Syntastic {{{
nmap <silent> <leader>sc :SyntasticCheck<cr>
" }}}

" multiple-cursor {{{
"https://github.com/terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'   "like SublimeText 2
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"go to end of word in insert mode
imap <c-e> <esc>ea
" }}}

" argumentrewrap {{{
"https://github.com/jakobwesthoff/argumentrewrap
nmap <silent> <leader>ra :call argumentrewrap#RewrapArguments()<CR>
" }}}

" autoformat {{{
"https://github.com/Chiel92/vim-autoformat
autocmd BufRead,BufNewFile *.sql nmap <leader>f <Plug>SQLU_Formatter<cr>
autocmd BufRead,BufNewFile *.sql vmap <leader>f <Plug>SQLU_Formatter<cr>
autocmd BufRead,BufNewFile *.css nmap <leader>f :call CssPretty()<cr>
autocmd BufRead,BufNewFile *.css vmap <leader>f :call CssPretty()<cr>
autocmd BufRead,BufNewFile *.js nmap <leader>f :call JsBeautify()<cr>
autocmd BufRead,BufNewFile *.js vmap <leader>f :call JsBeautify()<cr>
autocmd BufRead,BufNewFile *.htm nmap <leader>f :call HtmlBeautify()<cr>
autocmd BufRead,BufNewFile *.htm vmap <leader>f :call HtmlBeautify()<cr>
autocmd BufRead,BufNewFile *.html nmap <leader>f :call HtmlBeautify()<cr>
autocmd BufRead,BufNewFile *.html vmap <leader>f :call HtmlBeautify()<cr>
" }}}

"redefine MyDiff function {{{
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}
