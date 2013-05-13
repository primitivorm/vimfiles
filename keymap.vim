"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","
"Go to last edit location with ,.
nnoremap <silent> <expr> <2-LeftMouse> Highlighting()
nnoremap ,. '.

" Opening files located in the same directory as the current file {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" }}}

" Easy window navigation {{{
noremap <D-w> <C-w>w " cycle between the open windows
noremap <D-Left> <C-w>h " focus the window to the left
noremap <D-Down> <C-w>j " focus the window to the down
noremap <D-Up> <C-w>k " focus the window to the up
noremap <D-Right> <C-w>l " focus the window to the right
"}}}

" Create window splits easier. The default {{{
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent>vv <C-w>v
nnoremap <silent>ss <C-w>s
" }}}

" Adjust viewports to the same size {{{
nnoremap <Leader>= <C-w>=
nnoremap <Leader>_ <C-w>_
nnoremap <Leader><Bar> <C-w><Bar>
"}}}

" resize window {{{
"http://vim.usrsb.in/117060445
"can resize your windows using Alt plus an arrow key.
nnoremap <C-A-Right> :vertical res +1<cr>
nnoremap <C-A-Up> :res +1<cr>
nnoremap <C-A-Down> :res -1<cr>
nnoremap <C-A-Left> :vertical res -1<cr>
" }}}

" General {{{
" reindent complete file without losing position
nnoremap <leader>if mqHmwgg=G`wzt`q

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent><leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent><leader>cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" cd to the directory containing the file in the buffer
map <silent><leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
map <silent><leader>md :!mkdir -p %:p:h<CR>
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"list
nmap <leader>lc :set list!<CR>

" Edit the vimrc file
nnoremap <silent><leader>edv :e $MYVIMRC<CR>
nnoremap <silent><leader>sv :so $MYVIMRC<CR>
" nmap <leader>v :tabedit $MYVIMRC<CR>
" source $MYVIMRC

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

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
nnoremap <Tab> %
vnoremap <Tab> %

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

" }}}

" Disable arrow keys {{{
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
" }}}

" Easy Edit {{{
"select with shift
inoremap <silent><S-Home> <Esc>v^
inoremap <silent><S-End> <Esc>v$
nnoremap <silent><S-Home> <Esc>v^
nnoremap <silent><S-End> <Esc>v$
inoremap <silent><C-S-Left> <Esc>v
inoremap <silent><C-S-Right> <Esc>v
nnoremap <silent><C-S-Left> <Esc>v
nnoremap <silent><C-S-Right> <Esc>v

" backspace in Visual mode deletes selection
" backspace in Visual mode deletes selection
vnoremap <BS> d

" to the clipboard with ,y and ,p
cnoremap <leader>y "+y
cnoremap <leader>Y "+yy
cnoremap <leader>p "+gP
cnoremap <leader>P "+gP
cnoremap <leader>x "+x
vnoremap <leader>y "+y
vnoremap <leader>Y "+yy
vnoremap <leader>x "+x

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Tab maps
nnoremap <silent><C-Tab> :tabnext<cr>
nnoremap <silent><S-Tab> :tabprev<cr>
nnoremap <silent><C-F4> :tabclose<cr>

"insert automatically } and insert above {
inoremap {<CR> {<CR>}<Esc>O

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
    call cursor(l, c)
endfun
" command to strip white space from any file
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>
"auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
"}}}

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
"nnoremap <silent> <expr> <2-LeftMouse> Highlighting()
nnoremap <silent><2-LeftMouse> viw

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

nmap <silent> <leader>xm :%FormatXML<CR>
vmap <silent> <leader>xm :FormatXML<CR>
" }}}

"--------------------------------------------
"PLUGINS
"--------------------------------------------

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
"}}}

" GUndo {{{
nnoremap <c-u> :GundoToggle<CR>
"}}}

" Ctrlp {{{
nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>
nnoremap <C-l> :CtrlPMRUFiles<CR>
inoremap <C-l> <esc>:CtrlPMRUFiles<CR>
nnoremap <C-t> :CtrlPBufTag<CR>
inoremap <C-t> <esc>:CtrlPBufTag<CR>
"nmap <leader>b :CtrlPBuffer<CR>
"nmap <leader>m :CtrlPMRUFiles<CR>
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

" Tagbar {{{
" o=outline
"nmap <silent><leader>T :TagbarToggle<CR>
nmap <silent><F3> :TagbarToggle<CR>
"nnoremap <Leader>o :TagbarToggle<CR>
"noremap <silent> <Leader>y :TagbarToggle " Display panel with y (or ,y)
" }}}

" neocomplcache {{{
"inoremap <expr><c-space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
"inoremap <expr><c-CR> neocomplcache#smart_close_popup() . "\<CR>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"}}}

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

" nerdtree {{{
""I make sure the working directory is set correctly.
"nnoremap <leader>n :NERDTreeToggle<CR>
"map <Leader>n <plug>NERDTreeMirror<CR>
"map <F2> <plug>NERDTreeTabsToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
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
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
"end SingleCompile
" }}}

" ZoomWin {{{
nnoremap <silent> <leader>z :ZoomWin<CR>
" }}}

" minimap {{{
"https://github.com/koron/minimap-vim
nnoremap <leader>' :MinimapSync<cr>
" }}}

"" Toggle Taglist display {{{
"nnoremap <C-F3> :TlistToggle<CR>
""nnoremap <leader>T :Tlist<CR>
""nnoremap <leader>U :TlistUpdate<CR>
""nnoremap <leader>s :TlistSessionSave tlist<CR>
""nnoremap <leader>l :TlistSessionLoad tlist<CR>
"" }}}

" ctags {{{
"Search and destroy using tags
map <silent> <S-F3> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>
" }}}

" sql formatter {{{
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>
" }}}

" Command-t {{{
"nnoremap <silent> <Leader>t :CommandT<CR>
"nnoremap <silent> <Leader>b :CommandTBuffer<CR>
" }}}

" sidewise {{{
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
"}}}

" HardMode {{{
 "nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" }}}

"  YankRing stuff {{{
" let g:yankring_history_dir = $HOME.'/vimfiles/tmp'
" nnoremap <leader>r :YRShow<CR>
" }}}

"" Omnisharp {{{

"map <F5> :wa!<cr>:call OmniSharp#Build()<cr>
"map gd :call OmniSharp#GotoDefinition()<cr>
"nmap fi :call OmniSharp#FindImplementations()<cr>
"nmap fu :call OmniSharp#FindUsages()<cr>
"nmap <leader>tl :call OmniSharp#TypeLookup()<cr>
""I find contextual code actions so useful that I have it mapped to the spacebar
"nmap <leader><space> :call OmniSharp#GetCodeActions()<cr>

"" rename with dialog
"nmap nm :call OmniSharp#Rename()<cr>
"nmap <silent><S-F2> :call OmniSharp#Rename()<cr>
"" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"" Force OmniSharp to reload the solution. Useful when switching branches etc.
"nmap <leader>rl :call OmniSharp#ReloadSolution()<cr>
"nmap <leader>cf :call OmniSharp#CodeFormat()<cr>

"" }}}
""
