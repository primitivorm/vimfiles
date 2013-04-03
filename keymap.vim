"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","

"Go to last edit location with ,.
"nnoremap ,. '.

" CMD-Enter to enter new line, doesn't work in terminal
inoremap <D-Enter> <C-o>o
inoremap <D-S-Enter> <C-o>O

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk
" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk
" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" buffer next/previous
nnoremap <silent> <leader>< :bp<CR>
nnoremap <silent> <leader>> :bn<CR>

" ctrl-opt- left/right for tab movement
nnoremap <silent> <D-A-Left> :tabp<cr>
inoremap <silent> <D-A-Left> <esc>:tabp<cr>
nnoremap <silent> <D-A-Right> :tabn<cr>
inoremap <silent> <D-A-Right> <esc>:tabn<cr>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Adjust viewports to the same size
nnoremap <Leader>= <C-w>=

" Resize windows with arrow keys
nnoremap <D-S-Up> <C-w>+
nnoremap <D-S-Down> <C-w>-
nnoremap <D-S-Left> <C-w><
nnoremap <D-S-Right>  <C-w>>

" Easy close windows with Q
nnoremap <silent> Q <C-w>c

nnoremap <leader>w :StripTrailingWhitespaces<CR>
" reindent complete file without losing position
nnoremap <leader>f mqHmwgg=G`wzt`q

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" cd to the directory containing the file in the buffer
map <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
map <silent> <leader>md :!mkdir -p %:p:h<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Fugitive
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>

" Ack
if has("gui_macvim") && has("gui_running")
  " Command-Shift-F on OSX
  map <D-F> :Ack<space>
else
  " Define <C-F> to a dummy value to see if it would set <C-f> as well.
  map <C-F> :dummy

  if maparg("<C-f>") == ":dummy"
    " <leader>f on systems where <C-f> == <C-F>
    map <leader-f> :Ack<space>
  else
    " <C-F> if we can still map <C-f> to <S-Down>
    map <C-F> :Ack<space>
  endif

  map <C-f> <S-Down>
endif

" Zoom Window to Full Size
nnoremap <silent> <leader>z :ZoomWin<CR>

" GUndo
nnoremap ,u :GundoToggle<CR>

" ctrlp

nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>

nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>

nnoremap <C-l> :CtrlPMRUFiles<CR>
inoremap <C-l> <esc>:CtrlPMRUFiles<CR>

nnoremap <C-t> :CtrlPBufTag<CR>
inoremap <C-t> <esc>:CtrlPBufTag<CR>

" Surround
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

" Tabular
"nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
"nnoremap <Leader>t: :Tabularize /:\zs<CR>
vnoremap <Leader>t: :Tabularize /:\zs<CR>
"nnoremap <Leader>t, :Tabularize /,\zs<CR>
vnoremap <Leader>t, :Tabularize /,\zs<CR>
nnoremap <Leader>t> :Tabularize /=>\zs<CR>
vnoremap <Leader>t> :Tabularize /=>\zs<CR>
nnoremap <Leader>t- :Tabularize /-<CR>
vnoremap <Leader>t- :Tabularize /-<CR>
nnoremap <Leader>t" :Tabularize /"<CR>
vnoremap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t3 :Tabularize /#<CR>
vmap <Leader>t' :Tabularize /'<CR>
vmap <Leader>t'' :Tabularize /"<CR>
vmap <Leader>t0 :Tabularize /)/r1c1l0<CR>
vmap <Leader>t== :Tabularize /=/r1c1l0<CR>

" Tagbar toggle
" o=outline
nnoremap <Leader>o :TagbarToggle<CR>

" neocomplcache activation
inoremap <expr><c-space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
inoremap <expr><c-CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

"--------------------------------------------
"proman
"--------------------------------------------
"nerdtree
""I make sure the working directory is set correctly.
nmap <leader>l :set list!<CR>
"I hit <leader>n to open NERDTree.
"nnoremap <leader>n :NERDTree .<CR>
"mapea las teclas Ctrl+n para abrir NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
"nmap <silent><Leader>nt :NERDTreeMirrorToggle<CR>

"ctrl-p
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>

"Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>

" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <C-F4> :TlistToggle<CR>
"Search and destroy using tags
"map <C-F12> :!C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"sql formatter
vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

"tagbar
nmap <silent><leader>T :TagbarToggle<CR>
"noremap <silent> <Leader>y :TagbarToggle       " Display panel with y (or ,y)

"Command-t
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

"Show ident lines
" map <F2> <leader>ig

"sidewise
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" This command will execute the file, for example, if this is an
" HTML file, it will run:
"     start c:\absolute\filename.html
" nnoremap <silent> <C-F6> :let old_reg=@"<CR>:let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>:silent!!cmd /cstart  <C-R><C-R>"<CR><CR>:let @"=old_reg<CR> 
command Preview :!"C:\Program Files\Mozilla Firefox\firefox.exe" %<CR>

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

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
nnoremap <leader>f :call FoldColumnToggle()<cr>

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

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Shortcut to make
nnoremap mk :make<CR>

" Quick yanking to the end of the line
nnoremap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" YankRing stuff
let g:yankring_history_dir = $HOME.'/vimfiles/tmp'
nnoremap <leader>r :YRShow<CR>

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

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

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Ack for the word under cursor
"nnoremap <leader>a :Ack<Space>
nnoremap <leader>a :Ack<Space><c-r><c-W>

" Creating folds for tags in HTML
"nnoremap <leader>ft Vatzf

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Gundo.vim
nnoremap <F5> :GundoToggle<CR>
" }}}

