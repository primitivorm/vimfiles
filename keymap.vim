"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","

" Opening files located in the same directory as the current file {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" }}}

" Split new window/buffer {{{
" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
" window
nmap <leader>w<left>   : topleft  vnew<CR>
nmap <leader>w<right>  : botright vnew<CR>
nmap <leader>w<up>     : topleft  new<CR>
nmap <leader>w<down>   : botright new<CR>
nmap <leader>wh        : topleft  vnew<CR>
nmap <leader>wl<right> : botright vnew<CR>
nmap <leader>wk<up>    : topleft  new<CR>
nmap <leader>wj<down>  : botright new<CR>
" buffer
nmap <leader>s<left>    : leftabove  vnew<CR>
nmap <leader>s<right>   : rightbelow vnew<CR>
nmap <leader>s<up>      : leftabove  new<CR>
nmap <leader>s<down>    : rightbelow new<CR>
nmap <leader>sh         : leftabove  vnew<CR>
nmap <leader>sl         : rightbelow vnew<CR>
nmap <leader>sk         : leftabove  new<CR>
nmap <leader>sj         : rightbelow new<CR>
" }}}

" Window navigation {{{
noremap <C-w> <C-w>w " cycle between the open windows
noremap <C-Left> <C-w>h " focus the window to the left
noremap <C-Down> <C-w>j " focus the window to the down
noremap <C-Up> <C-w>k " focus the window to the up
noremap <C-Right> <C-w>l " focus the window to the right
"}}}

" Create window splits easier. The default {{{
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent>vv <C-w>v
nnoremap <silent>ss <C-w>s
" }}}

" Adjust viewports {{{
"Same size
nnoremap <Leader>= <C-w>=
"Maximize Up to Down
nnoremap <Leader>_ <C-w>_
"Maximize Left to Right
nnoremap <Leader><Bar> <C-w><Bar>
"}}}

" Resize window {{{
"http://vim.usrsb.in/117060445
"can resize your windows using Alt plus an arrow key.
nnoremap <C-A-Left>  : vertical res +1<cr>
nnoremap <C-A-Right> : vertical res -1<cr>
nnoremap <C-A-Down>  : res +1<cr>
nnoremap <C-A-Up>    : res -1<cr>
" }}}

" Tab maps {{{0
" Tab navigation like Firefox
nnoremap <silent><C-Tab> : tabnext<cr>
nnoremap <silent><S-Tab> : tabprev<cr>
nnoremap <silent><C-F4>  : tabclose<cr>
nnoremap <silent><C-T>  : tabnew<cr>

"http://stackoverflow.com/questions/2106138/rearrange-tabs-with-the-mouse-in-gvim
"Move tab to Left
function TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

"Move tab to Right
function TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
 endfunction0

nnoremap <silent><A-Left>  : call TabLeft()<CR>
nnoremap <silent><A-Right> : call TabRight()<CR>
" }}}

" Easy Vim Mapping like others editors {{{

"disable paste when MiddleMouse press
"http://vim.wikia.com/wiki/Mouse_wheel_for_scroll_only_-_disable_middle_button_paste
noremap <MiddleMouse> <LeftMouse>

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

" to the clipboard with ,y and ,p
map <leader>Y "+yy
map <leader>p "+gp
map <leader>P "+gP
nnoremap <leader>x "+x
vnoremap <leader>y "+y
vnoremap <leader>x "+x
nmap Y yy

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>       :update<CR>
vnoremap <C-S>      <C-C>:update<CR>
inoremap <C-S>      <C-O>:update<CR>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
" CTRL-Y is redo
noremap <C-Y> :redo <cr>
inoremap <C-Y> <C-O><C-R>

"Find
map <C-f> /<C-r><C-w>
"Replace
nnoremap <C-h> :%s/<C-r><C-w>/NEW_WORD

"Change minus - MAYUS
vnoremap <C-u> U
vnoremap <C-l> u

"spelling
nnoremap <c-f7> :set spell!<cr>
nnoremap <f7> ]s
nnoremap <s-f7> [s

"http://superuser.com/questions/641946/add-file-specific-good-words-to-internal-vim-wordlist-via-modeline
"http://superuser.com/questions/623336/how-does-one-add-a-word-containing-a-slash-to-ones-vim-spell-dictionary-file
"http://superuser.com/questions/133208/how-to-make-vim-spellcheck-remember-a-new-word
function! AutoSpellGoodWords()
    let l:goodwords_start = search('\C-\*-SpellGoodWordsStart-\*-', 'wcn')
    let l:goodwords_end = search('\C-\*-SpellGoodWordsEnd-\*-', 'wcn')
    if l:goodwords_start == 0 || l:goodwords_end == 0
        return
    endif
    let l:lines = getline(l:goodwords_start + 1, l:goodwords_end - 1)
    let l:words = []
    call map(l:lines, "extend(l:words, split(v:val, '\\W\\+'))")
    for l:word in l:words
        silent execute ':spellgood! ' . l:word
    endfor
endfunction

"autocmd BufReadPost * call AutoSpellGoodWords()
nnoremap <leader>as call AutoSpellGoodWords()<cr>

"insert automatically } after insert {
inoremap {<CR> {<CR>}<Esc>O
" }}}

" Tab completion {{{
"for file completion
inoremap <c-f> <c-x><c-f>
"for line completion
inoremap <C-l> <c-x><c-l>
"for thesaurus file
inoremap <c-t> <c-x><c-t>
"for words in current file
inoremap <c-i> <c-x><c-i>
"for tag completion
inoremap <c-]> <c-x><c-]>
"current file all words
inoremap <c-u> <c-x><c-u>
"macro completion
inoremap <c-d> <c-x><c-d>

" Execute current line or current selection as Vim EX commands.
"http://stackoverflow.com/questions/14385998/how-can-i-execute-the-current-line-as-vim-ex-commands
nnoremap <F10> :exe getline(".")<CR>
vnoremap <F10> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

""for dictionary completion
"inoremap <C-k> <c-x><c-k>

"http://stackoverflow.com/questions/15870365/why-is-tab-completion-wildmenu-not-working
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if strlen(substr)==0                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if !has_period && !has_slash
    "check if autocomplpop is visible
    if !pumvisible()
      return "\<C-X>\<C-U>"                       " wordfuzzycompletion
    endif
  elseif (has_slash)
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         "omni completion
  endif
endfunction

"inoremap <tab> <c-r>=Smart_TabComplete()<CR>
imap <tab> <c-r>=Smart_TabComplete()<CR>
"snipMate completion
"inoremap <C-space> <C-G>u<C-R>=snipMate#TriggerSnippet()<CR>
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
nnoremap <silent> <expr> <CR> Highlighting()

"http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type <leader>/ to toggle highlighting on/off.
nnoremap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
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
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap { {zz
nnoremap } }zz
nnoremap G Gzz
" }}}

" General {{{

"Go to last edit location with ,.
nnoremap ,. '.

" reindent complete file without losing position
nnoremap <leader>if mqHmwgg=G`wzt`q

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent><leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent><leader>cn :let @* = expand("%:t")<CR>

" Type <leader>hl to toggle highlighting on/off, and show current value.
noremap <leader>hl :set hlsearch! hlsearch?<CR>

" cd to the directory containing the file in the buffer
"map <silent><leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
map <silent><leader>md :!mkdir -p %:p:h<CR>
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"list
nmap <leader>l :set list!<CR>

" Edit the vimrc file
nnoremap <silent><leader>ed :e $MYVIMRC<CR>
nnoremap <silent><leader>sv :so $MYVIMRC<CR>
" nmap <leader>v :tabedit $MYVIMRC<CR>
" source $MYVIMRC

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"https://github.com/LStinson/Vim/blob/master/plugin/pulse.vim

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Quick alignment of text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

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
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>
"auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
" for al File Types
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <c-q> :call <SID>QuickfixToggle()<cr>

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

" XML formatter {{{
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')

    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

"remap in autoformat section
"nmap <silent> <leader>fx :%FormatXML<CR>
"vmap <silent> <leader>fx :FormatXML<CR>
" }}}

  "{{{Theme Rotating
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
nnoremap <silent><F12> :execute RotateColorTheme()<CR>
" }}}

"--------------------------------------------
"PLUGINS
"--------------------------------------------

" Bundle {{{
nmap <leader>bi :BundleInstall<cr>
" }}}

" GUndo {{{
nnoremap <silent><S-U> :GundoToggle<CR>
" }}}

"" undotree {{{
"nnoremap <silent><S-U> :UndotreeToggle<CR>
"" }}}

" Ctrlp {{{
nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>
" }}}

" Surround {{{
" <leader># Surround a word with #{ruby interpolation}
map <leader># ysiw#
vmap <leader># c#{<C-R>"}<ESC>
" <leader>" Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>
" <leader>' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>
" <leader>) or <leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>
" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>
" <leader>{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>
" }}}

" msbuild {{{
autocmd BufRead *.csproj,*.vbproj,*.cs,*.vb,*.sln nnoremap <F5> :make /t:rebuild<cr>
" }}}

" Tabular {{{
 if exists(":Tabularize")
    vnoremap <Leader>t= :Tabularize /=<CR>
    vnoremap <Leader>t: :Tabularize /:\zs<CR>
    vnoremap <Leader>t, :Tabularize /,\zs<CR>
    nnoremap <Leader>t> :Tabularize /=>\zs<CR>
    vnoremap <Leader>t> :Tabularize /=>\zs<CR>
    nnoremap <Leader>t- :Tabularize /-<CR>
    vnoremap <Leader>t- :Tabularize /-<CR>
    nnoremap <Leader>t" :Tabularize /"<CR>
    vnoremap <Leader>t" :Tabularize /"<CR>
    vmap <Leader>t3 :Tabularize /#<CR>
    vmap <Leader>t' :Tabularize /'<CR>
    vmap <Leader>t" :Tabularize /"<CR>
    vmap <Leader>t0 :Tabularize /)/r1c1l0<CR>
    vmap <Leader>t== :Tabularize /=/r1c1l0<CR>
endif
" }}}

" Pandoc {{{
" convert text to Table
"https://github.com/vim-pandoc/vim-pandoc
"http://connermcd.wordpress.com/2012/05/20/pandoc-table-editing-in-vim/
command! -range=% Rst :'<,'>!pandoc -f markdown -t rst
" }}}

" vim-nerdtree-tabs {{{
noremap <F2> :NERDTreeToggle<CR>
"noremap <F2> :NERDTreeTabsToggle<CR>
" }}}

" Tagbar {{{
map <F3> :TagbarToggle<CR>
nnoremap <C-]> :tabnew %<CR>g<C-]>
vnoremap <C-]> <Esc>:tabnew %<CR>gvg<C-]>
" }}}

" ctags {{{
"Search and destroy using tags
"map <C-F3> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>
map <C-F3> :!ctags -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>
" }}}

" Fugitive {{{
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
"}}}

" sql formatter {{{
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>
" }}}

" dbext {{{
" mappings for sql files
" execute statement
autocmd FileType sql nnoremap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql vnoremap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql map <A-F1> :DBDescribeTable <cr>

"remap <leader>sl+ to <leader>l+
autocmd FileType sql nnoremap <leader>lt :DBListTable <cr>
autocmd FileType sql nnoremap <leader>lp :DBListProcedure <cr>
autocmd FileType sql nnoremap <leader>lv :DBListView <cr>
autocmd FileType sql nnoremap <leader>lc :DBListColumn <cr>
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
autocmd FileType *.cs nnoremap <leader>ss :OmniSharpStartServer<cr>
autocmd FileType *.cs nnoremap <leader>sp :OmniSharpStopServer<cr>
autocmd FileType *.cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>
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
inoremap <c-e> <esc>ea
" }}}

" argumentrewrap {{{
"https://github.com/jakobwesthoff/argumentrewrap
nnoremap <silent> <leader>ra :call argumentrewrap#RewrapArguments()<CR>
" }}}

" autoformat {{{
"https://github.com/Chiel92/vim-autoformat
autocmd FileType cs nnoremap <leader>f :Autoformat<cr>
autocmd FileType cs vnoremap <leader>f :Autoformat<cr>
autocmd FileType sql nnoremap <leader>f <Plug>SQLU_Formatter<cr>
autocmd FileType sql vnoremap <leader>f <Plug>SQLU_Formatter<cr>
autocmd FileType css nnoremap <leader>f :call CssPretty()<cr>
autocmd FileType css vnoremap <leader>f :call CssPretty()<cr>
autocmd FileType xml nnoremap <leader>f :%FormatXML<CR>
autocmd FileType xml vnoremap <leader>f :FormatXML<CR>
autocmd FileType js nnoremap <leader>f :call JsBeautify()<cr>
autocmd FileType js vnoremap <leader>f :call JsBeautify()<cr>
autocmd FileType html noremap <leader>f :call HtmlBeautify()<cr>
autocmd FileType html voremap <leader>f :call HtmlBeautify()<cr>
" }}}


"redefine MyDiff function
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
