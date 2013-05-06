"https://github.com/code2k/dot_vim/blob/master/keymap.vim
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"mapea leader a coma
let mapleader=","
"Go to last edit location with ,.
nnoremap ,. '.

"opening files located in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" Map the arrow keys to be based on display lines, not physical lines
"map <Down> gj
"map <Up> gk
" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk
" Easy window navigation
noremap <C-w> <C-w>w " cycle between the open windows

noremap <C-Left> <C-w>h " focus the window to the left
noremap <C-Down> <C-w>j " focus the window to the down
noremap <C-Up> <C-w>k " focus the window to the up
noremap <C-Right> <C-w>l " focus the window to the right
nnoremap <leader>w <C-w>v<C-w>l

" buffer next/previous
"nnoremap <silent> <leader>< :bp<CR>
"nnoremap <silent> <leader>> :bn<CR>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent>vv <C-w>v
nnoremap <silent>ss <C-w>s

" Adjust viewports to the same size
nnoremap <Leader>= <C-w>=
nnoremap <Leader>_ <C-w>_
nnoremap <Leader><Bar> <C-w><Bar>

"tab map
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit<cr>

nnoremap <silent><C-Tab> :tabnext<cr>
nnoremap <silent><S-Tab> :tabprev<cr>


" Easy close windows with Q
nnoremap <silent> Q <C-w>c

" taken from: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()

" command to strip white space from any file
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>

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

" Ack
if has('win32') || has('win64')
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
	" CMD-Enter to enter new line, doesn't work in terminal
    inoremap <C-Enter> <C-o>o
    inoremap <C-S-Enter> <C-o>O
endif

"SingleCompile
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
"end SingleCompile

"vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"end vim-multiple-cursors
" Zoom Window to Full Size
nnoremap <silent> <leader>z :ZoomWin<CR>

" GUndo
nnoremap <c-u> :GundoToggle<CR>

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
	vmap <Leader>t'' :Tabularize /"<CR>
	vmap <Leader>t0 :Tabularize /)/r1c1l0<CR>
	vmap <Leader>t== :Tabularize /=/r1c1l0<CR>
endif
" Tagbar toggle
" o=outline
nnoremap <Leader>o :TagbarToggle<CR>

" neocomplcache activation
inoremap <expr><c-space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
inoremap <expr><c-CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

"GoldenView
" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit
" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle
" 3. jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious
"end GoldenView
"--------------------------------------------
"proman
"--------------------------------------------
"nerdtree
""I make sure the working directory is set correctly.
nmap <leader>lc :set list!<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

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
"nnoremap <leader>T :Tlist<CR>
"nnoremap <leader>U :TlistUpdate<CR>
"nnoremap <leader>s :TlistSessionSave tlist<CR>
"nnoremap <leader>l :TlistSessionLoad tlist<CR>

"Search and destroy using tags
map <C-F12> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"sql formatter
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>

"tagbar
nmap <silent><leader>T :TagbarToggle<CR>
"noremap <silent> <Leader>y :TagbarToggle " Display panel with y (or ,y)

"Command-t
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
"sidewise
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" This command will execute the file, for example, if this is an
" HTML file, it will run:
" start c:\absolute\filename.html
" nnoremap <silent> <C-F6> :let old_reg=@"<CR>:let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>
""" command Preview :!"C:\Program Files\Mozilla Firefox\firefox.exe" %<CR>

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
nnoremap <leader>x "+x
nnoremap <leader>x "+x

 " " YankRing stuff
" let g:yankring_history_dir = $HOME.'/vimfiles/tmp'
" nnoremap <leader>r :YRShow<CR>

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

" Ack for the word under cursor
"nnoremap <leader>a :Ack<Space>
nnoremap <leader>a :Ack<Space><c-r><c-W>

" Creating folds for tags in HTML
"nnoremap <leader>ft Vatzf

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
"end CamelCaseMotion

"http://vim.usrsb.in/117060445
"can resize your windows using Alt plus an arrow key.
nnoremap <C-A-Right> :vertical res +1<cr>
nnoremap <C-A-Up> :res +1<cr>
nnoremap <C-A-Down> :res -1<cr>
nnoremap <C-A-Left> :vertical res -1<cr>

"highlight all words when press <CR>
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
nnoremap <silent> <expr> <2-LeftMouse> Highlighting()

"insert automatically } and insert above {
inoremap {<CR> {<CR>}<Esc>O

"vim-complete
"nnoremap <Leader>ke :call Complete('e')<CR>
"nnoremap <Leader>kb :call Complete('b')<CR>
"" for use with fuzzee (http://github.com/mattsacks/vim-fuzzee)
"nnoremap <Leader>kf :call Complete('F')<CR>
"nnoremap <Leader>kj :call Complete('F app/javascripts*')<CR>

"buftabs
"nnoremap <C-left> :bprev<CR>
"nnoremap <C-right> :bnext<CR>

"Omnisharp
" map <F5> :wa!<cr>:call OmniSharp#Build()<cr>
" map <F12> :call OmniSharp#GotoDefinition()<cr>
" map gd :call OmniSharp#GotoDefinition()<cr>
" nmap fi :call OmniSharp#FindImplementations()<cr>
" nmap fu :call OmniSharp#FindUsages()<cr>
" " nmap <leader>tt :call OmniSharp#TypeLookup()<cr>
" nmap <leader>ot :call OmniSharp#TypeLookup()<cr>
" "I find contextual code actions so useful that I have it mapped to the spacebar
" nmap <space> :call OmniSharp#GetCodeActions()<cr>

" " rename with dialog
" nmap nm :call OmniSharp#Rename()<cr>
" nmap <F2> :call OmniSharp#Rename()<cr>
" " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" " Force OmniSharp to reload the solution. Useful when switching branches etc.
" nmap <leader>rl :call OmniSharp#ReloadSolution()<cr>

" "neocomplcache

" " SuperTab like snippets behavior.
" "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" inoremap <expr>.  neocomplcache#close_popup() . "."
" inoremap <expr>(  neocomplcache#close_popup() . "("
" inoremap <expr>)  neocomplcache#close_popup() . ")"
" inoremap <expr><space>  neocomplcache#close_popup() . " "
" inoremap <expr>;  neocomplcache#close_popup() . ";"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" inoremap <expr><ESC> pumvisible() ? neocomplcache#cancel_popup() : "\<esc>"
" " AutoComplPop like behavior.
" let g:neocomplcache_enable_auto_select = 1
" " Shell like behavior(not recommended).
" set completeopt+=longest
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
" "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " Enable heavy omni completion, which require computational power and may stall the vim.
" if !exists('g:neocomplcache_omni_patterns')
  " let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.cs = '.*'
" "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'

"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"minimap
"https://github.com/koron/minimap-vim
"nnoremap <leader>' :MinimapSync<cr>
