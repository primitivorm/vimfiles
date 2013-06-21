"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","

" Personal macros {{{
"source ~/vimfiles/macros/macos_cs.vim
" }}}

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
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
nmap <leader>swh :topleft  vnew<CR>
nmap <leader>swl<right> :botright vnew<CR>
nmap <leader>swk<up>    :topleft  new<CR>
nmap <leader>swj<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
nmap <leader>sh   :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk     :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>
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
nnoremap <C-A-Right> :vertical res +1<cr>
nnoremap <C-A-Up> :res +1<cr>
nnoremap <C-A-Down> :res -1<cr>
nnoremap <C-A-Left> :vertical res -1<cr>
" }}}

" Tab maps {{{0
" Tab navigation like Firefox
nnoremap <silent><C-Tab> :tabnext<cr>
nnoremap <silent><S-Tab> :tabprev<cr>
nnoremap <silent><C-F4> :tabclose<cr>
inoremap <silent><C-Tab> :tabnext<cr>
inoremap <silent><S-Tab> :tabprev<cr>
inoremap <silent><C-F4> :tabclose<cr>

"http://vim.wikia.com/wiki/Alternative_tab_navigation
"nnoremap <A-F1> 1gt
"nnoremap <A-F2> 2gt
"nnoremap <A-F3> 3gt
"nnoremap <A-F4> 4gt
"nnoremap <A-F5> 5gt
"nnoremap <A-F6> 6gt
"nnoremap <A-F7> 7gt
"nnoremap <A-F8> 8gt
"nnoremap <A-F9> 9gt
"nnoremap <A-F0> 10gt

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

nnoremap <silent><A-Left> :call TabLeft()<CR>
nnoremap <silent><A-Right> :call TabRight()<CR>
" }}}

" Easy Vim Mapping like others editors {{{

"disable paste when MiddleMouse press
"http://vim.wikia.com/wiki/Mouse_wheel_for_scroll_only_-_disable_middle_button_paste
noremap <MiddleMouse> <LeftMouse>

"Shift-Home, Shift-End
inoremap <silent><S-Home> <Esc>v^
inoremap <silent><S-End> <Esc>lv$
nnoremap <silent><S-Home> <Esc>v^
nnoremap <silent><S-End> <Esc>v$

"Ctrl-Shift-Home, Ctrl-Shift-End
nnoremap <silent><C-S-Home> <Esc>v^gg
nnoremap <silent><C-S-End> <Esc>v$G

"Ctrl-Shift-Left, Ctrl-Shift-Right
inoremap <silent><C-S-Left> <Esc>vb
inoremap <silent><C-S-Right> <Esc>lw
nnoremap <silent><C-S-Left> <Esc>vb
nnoremap <silent><C-S-Right> <Esc>vw

"Shift-Up, Shift-Down
nnoremap <silent><S-Up> <Esc>vk
nnoremap <silent><S-Down> <Esc>vj
inoremap <silent><S-Up> <Esc>vk
inoremap <silent><S-Down> <Esc>vj
vnoremap <silent><S-Up> k
vnoremap <silent><S-Down> j

"Change to Normal mode
vnoremap <silent><Up> <Esc>k
vnoremap <silent><Down> <Esc>j

"Sift-left, Shift-Right
nnoremap <silent><S-Left> vh
nnoremap <silent><S-Right> vl
inoremap <silent><S-Left> <Esc>vh
inoremap <silent><S-Right> <Esc>vl
vnoremap <silent><S-Left> <Left>
vnoremap <silent><S-Right> <Right>

"in Insert mode Left goto last initial Visual selection and Change to Insert mode
vnoremap <silent><Left> <Esc>`<i
"in Insert mode Right goto last final Visual selection and Change to Insert mode
vnoremap <silent><Right> <Esc>`>i

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

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

"Find
map <C-f> /<C-r><C-w>
"Replace
nnoremap <C-H> :%s/<C-r><C-w>/NEW_WORD

"Change minus - MAYUS
vnoremap <C-u> U
vnoremap <C-l> u

"insert automatically } after insert {
inoremap {<CR> {<CR>}<Esc>O

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
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=1000
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
""call at startup
"call AutoHighlightToggle()

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
map <silent><leader>cd :lcd %:h<CR>

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
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Quick alignment of text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Jump to matching pairs easily, with Tab
"nnoremap <Tab> %
"vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" This command will execute the file, for example, if this is an
" HTML file, it will run:
" start c:\absolute\filename.html
" nnoremap <silent> <C-F6> :let old_reg=@"<CR>:let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>
""" command Preview :!"C:\Program Files\Mozilla Firefox\firefox.exe" %<CR>

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Shortcut to make
nnoremap mk :make<CR>

" Quick yanking to the end of the line
"nnoremap Y y$

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Creating folds for tags in HTML
nnoremap <leader>ft Vatzf

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" }}}

"" Disable arrow keys {{{
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"" }}}

"--------------------------------------------
"FUNCTIONS
"--------------------------------------------

" StripTrailingWhitespaces {{{
" taken from: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" command to strip white space from any file
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>
"auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
" }}}

" Align {{{
"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
function! s:Align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>Align()<CR>a
" }}}

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <leader>qf :call <SID>QuickfixToggle()<cr>

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

" Toggle the foldcolumn {{{
nnoremap <leader>fc :call FoldColumnToggle()<cr>

let g:last_fold_column_width = 4 " Pick a sane default for the foldcolumn

function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
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

nmap <silent> <leader>fx :%FormatXML<CR>
vmap <silent> <leader>fx :FormatXML<CR>
" }}}

  "{{{Theme Rotating
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      "railscasts#amy#
      let colorstring = "proman#Monokai#eclipse#badwolf#mustang#wombat#github#smyck#bandit#blackboard#Sunburst#galaxy#default#candy#hybrid#hybrid-light#mac_classic#mickeysoft#solarized"

      let x = match( colorstring, "#", g:themeindex )
      let y = match( colorstring, "#", x + 1 )
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring, x + 1, y - x - 1)
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

" GUndo {{{
nnoremap <silent><S-U> :GundoToggle<CR>
" }}}

" Ctrlp {{{
nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>
nnoremap <C-l> :CtrlPMRUFiles<CR>
inoremap <C-l> <esc>:CtrlPMRUFiles<CR>
nnoremap <C-t> :CtrlPBufTag<CR>
inoremap <C-t> <esc>:CtrlPBufTag<CR>
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
autocmd vimenter *.csproj, *.vbproj nnoremap <F5> :make /t:rebuild<cr>
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

" nerdtree {{{
""I make sure the working directory is set correctly.
"map <F2> :NERDTreeToggle<CR>

"Funtion to open and close NERDTreeAndTagbar
"function! ToggleNERDTreeAndTagbar()
    "let w:jumpbacktohere = 1

    "" Detect which plugins are open
    "if exists('t:NERDTreeBufName')
        "let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    "else
        "let nerdtree_open = 0
    "endif
    "let tagbar_open = bufwinnr('__Tagbar__') != -1

    "" Perform the appropriate action
    "if nerdtree_open && tagbar_open
        "NERDTreeClose
        "TagbarClose
    "elseif nerdtree_open
        "TagbarOpen
    "elseif tagbar_open
        "NERDTree
    "else
        "NERDTree
        "TagbarOpen
    "endif

    "" Jump back to the original window
    "for window in range(1, winnr('$'))
        "execute window . 'wincmd w'
        "if exists('w:jumpbacktohere')
            "unlet w:jumpbacktohere
            "break
        "endif
    "endfor
"endfunction
"nnoremap <F2> :call ToggleNERDTreeAndTagbar()<CR>

" }}}

" vim-nerdtree-tabs {{{
map <F2> :NERDTreeTabsToggle<CR>
" }}}

" Tagbar {{{
map <F3> :TagbarToggle<CR>
nnoremap <C-]> :tabnew %<CR>g<C-]>
vnoremap <C-]> <Esc>:tabnew %<CR>gvg<C-]>
" }}}

" ctags {{{
"Search and destroy using tags
"ctags -R --languages=C,C++ --c++-kinds=+p --fields=+iaS --extra=+q ./
map <C-F3> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>

" }}}

" Fugitive {{{
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
"}}}

" SingleCompile {{{
"nmap <F9> :SCCompile<cr>
"nmap <F10> :SCCompileRun<cr>
"end SingleCompile
" }}}

" ZoomWin {{{
nnoremap <silent> <leader>z :ZoomWin<CR>
" }}}

" minimap {{{
"https://github.com/koron/minimap-vim
nnoremap <leader>' :MinimapSync<cr>
" }}}

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
autocmd FileType sql nnoremap <F5> :DBExecRangeSQL <cr>
autocmd FileType sql nnoremap <A-F1> :DBDescribeTable <cr>

"remap <leader>sl+ to <leader>l+
autocmd FileType sql nnoremap <leader>lt :DBListTable <cr>
autocmd FileType sql nnoremap <leader>lp :DBListProcedure <cr>
autocmd FileType sql nnoremap <leader>lv :DBListView <cr>
autocmd FileType sql nnoremap <leader>lv :DBListView <cr>
autocmd FileType sql nnoremap <leader>lc :DBListColumn <cr>
" }}}

" sidewise {{{
"nnoremap <leader>sl :SidewaysLeft<cr>
"nnoremap <leader>sr :SidewaysRight<cr>
"}}}

" Syntastic {{{
nmap <silent> <leader>y :SyntasticCheck<cr>
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

"" Command-t {{{
"nnoremap <silent> <Leader>t :CommandT<CR>
"nnoremap <silent> <Leader>b :CommandTBuffer<CR>
"" }}}

"" HardMode {{{
"nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
"" }}}

"" YankRing stuff {{{
" let g:yankring_history_dir = $HOME.'/vimfiles/tmp'
" nnoremap <leader>r :YRShow<CR>
"" }}}

"" Numbers {{{
"https://github.com/myusuf3/numbers.vim
"nnoremap <leader>n :NumbersToggle<CR>
"nnoremap <leader>no :NumbersOnOff<CR>
"" }}}

"" Lusty Explorer {{{
"map <Leader>lf :LustyFilesystemExplorer<cr>
"map <Leader>lr :LustyFilesystemExplorerFromHere<cr>
"map <Leader>lb :LustyBufferExplorer<cr>
"map <Leader>lg :LustyBufferGrep<cr>
"" }}}

"" Toggle Taglist display {{{
"map <F3> :TlistToggle<CR>
""nnoremap <leader>T :Tlist<CR>
""nnoremap <leader>U :TlistUpdate<CR>
""nnoremap <leader>s :TlistSessionSave tlist<CR>
""nnoremap <leader>l :TlistSessionLoad tlist<CR>
"" }}}

" Omnisharp {{{
map <F5> :wa!<cr>:call OmniSharp#Build()<cr>
map gd :call OmniSharp#GotoDefinition()<cr>
nmap fi :call OmniSharp#FindImplementations()<cr>
nmap fu :call OmniSharp#FindUsages()<cr>
nmap <leader>tl :call OmniSharp#TypeLookup()<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
nmap <leader><space> :call OmniSharp#GetCodeActions()<cr>
" rename with dialog
nmap nm :call OmniSharp#Rename()<cr>
nmap <silent><S-F2> :call OmniSharp#Rename()<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" Force OmniSharp to reload the solution. Useful when switching branches etc.
nmap <leader>rl :call OmniSharp#ReloadSolution()<cr>
nmap <leader>cf :call OmniSharp#CodeFormat()<cr>
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" }}}

" GoldenView {{{
"" 1. split to tiled windows
"nmap <silent> <C-L>  <Plug>GoldenViewSplit
"" 2. quickly switch current window with the main pane
"" and toggle back
"nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
"nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle
"" 3. jump to next and previous window
"nmap <silent> <C-N>  <Plug>GoldenViewNext
"nmap <silent> <C-P>  <Plug>GoldenViewPrevious
" }}}

" Ack {{{
"if has('win32') || has('win64')
    "" Define <C-F> to a dummy value to see if it would set <C-f> as well.
    "map <C-F> :dummy
    "if maparg("<C-f>") == ":dummy"
    "" <leader>f on systems where <C-f> == <C-F>
        "map <leader-f> :Ack<space>
    "else
    "" <C-F> if we can still map <C-f> to <S-Down>
        "map <C-F> :Ack<space>
    "endif
    "map <C-f> <S-Down>
    "" CMD-Enter to enter new line, doesn't work in terminal
    "inoremap <C-Enter> <C-o>o
    "inoremap <C-S-Enter> <C-o>O
"endif

"" Ack for the word under cursor
""nnoremap <leader>a :Ack<Space>
"nnoremap <leader>a :Ack<Space><c-r><c-W>
" }}}

