"--------------------------------------------
" PLUGINS config
"--------------------------------------------

" Thesaurus {{{
"http://www.vim.org/scripts/script.php?script_id=2528
"https://github.com/vim-scripts/Thesaurus
set thesaurus+=~/vimfiles/thesaurus/mthes10/mthesaur.txt
set thesaurus+=~/vimfiles/thesaurus/mthes10/roget13a.txt
set thesaurus+=~/vimfiles/thesaurus/ruby.txt
"}}}

" NERDTree {{{
"https://github.com/scrooloose/nerdtree"
"open the plugin NERDTree at startup Vim
if !&diff
  au vimenter * NERDTree
  au vimenter * if !argc() | NERDTree | endif
endif
"cerrar Vim si la única ventana abierta es la de NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"custom settings
let g:NERDTreeBookmarksFile     = expand($HOME.'/_NERDTreeBookmarks')
let g:NERDTreeShowBookmarks     = 1
let g:NERDTreeWinSize           = 25
let g:NERDTreeChristmasTree     = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeQuitOnOpen        = 1
let g:NERDTreeMouseMode         = 2
let NERDTreeShowHidden          = 0
"open in new tab with Ctrl-Enter
"let NERDTreeMapOpenInTab='<c-cr>'
"let NERDTreeMapOpenInTabSilent='<c-cr>'
"let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrows=0
"the working directory is always the one where the active buffer is located.
set autochdir
"I make sure the working directory is set correctly.
let g:NERDTreeChDirMode=2
"ignore some file types
let g:NERDTreeIgnore=[
    \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
    \'\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$',
    \'\.FxCop$','\.scc$','\.vssscc$','\.ini$', '\.pol$',
    \'\.user$', '\.cd$', '\.Cache$', '\.mdf$', '\.ldf$',
    \'\.tmp$', '^NTUSER.DAT*', '\.zip$', '\.pdb$', '\.dll$',
    \'tags', '\.suo$','\.vspscc$']

map <F2> :NERDTreeToggle<CR>
"}}}

" Tagbar {{{
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"file to find tags
set tags=tags,./tags
"to specify one or more file extensions, which Vim will attempt to use when looking up a filename with the gf
"set suffixes+=.cs,.py,.rb,.js
"toggle fold = o/za
"open fold=+
"close fold=-
"openall=*
let g:tagbar_width     = 25  "default 40
let g:tagbar_compact   = 1   "default 0
let g:tagbar_foldlevel   = 2  "default 99
let g:tagbar_ctags_bin   = 'ctags'
let g:tagbar_autofocus   = 1   "default 0
let g:tagbar_expand    = 0
"let g:tagbar_iconchars  = ['▸', '▾']
let g:tagbar_autoclose   = 0
let g:tagbar_singleclick = 1
"let g:tagbar_map_closeallfolds = ['_', 'zM',]

map <F3> :TagbarToggle<CR>
nmap <C-]> :tabnew %<CR>g<C-]>
vmap <C-]> <Esc>:tabnew %<CR>gvg<C-]>
""}}}

" ctags {{{
"Search and destroy using tags
map <C-F3> :!ctags -R --c++-kinds=+cmnp --fields=+ianmzS --extra=+fq --exclude="bin" *<CR>
" }}}

" CtrlP {{{
"https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/ctrlp_cache'
let g:ctrlp_max_height = 15
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_prompt_mappings='<S-F4>'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
"http://vim.wikia.com/wiki/Fix_errors_that_relate_to_reading_or_creating_files_in_the_temp_or_tmp_environment_on_an_MS_Windows_PC
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
nmap <C-p> :CtrlP<CR>
imap <C-p> <esc>:CtrlP<CR>
nmap <C-b> :CtrlPBuffer<CR>
imap <C-b> <esc>:CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<cr>
"}}}

" Syntastic {{{
" https://github.com/scrooloose/syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['ruby', 'php', 'cs', 'python', 'lisp', 'json', 'js', 'html', 'xhtml', 'xml'],
    \ 'passive_filetypes': ['puppet'] }
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='E'
let g:syntastic_style_error_symbol='S'
let g:syntastic_warning_symbol='W'
let g:syntastic_style_warning_symbol='S'
let g:syntastic_always_populate_loc_list=1
"configuring for cs files
"require mono mcs parser
"configuring for python files
let g:syntastic_python_checkers=['pylint']
if !&diff
  let g:syntastic_check_on_open=1
endif
"quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
nmap <silent> <leader>sc :SyntasticCheck<cr>
"}}}

" Dbext {{{
"http://www.vim.org/scripts/script.php?script_id=356
"https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
"connect to sql server instance
let g:dbext_default_profile_sql_qa40='type=SQLSRV:srvname=10.48.95.40:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw40='type=SQLSRV:srvname=10.48.95.40:dbname=amqavw:user=espejopruebas:passwd=12345678'

"add this comment at begin of file script to shebang
"// dbext:profile=sql_qavw
let g:dbext_default_history_file=$HOME . '/dbext_sql_history.txt'

" execute statement
autocmd FileType sql vmap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql nmap <F5> :DBExecVisualSQL <cr>
autocmd FileType sql map <A-F1> :DBDescribeTable <cr>
"remap <leader>sl+ to <leader>l+
autocmd FileType sql nmap <leader>lt :DBListTable <cr>
autocmd FileType sql nmap <leader>lp :DBListProcedure <cr>
autocmd FileType sql nmap <leader>lv :DBListView <cr>
autocmd FileType sql nmap <leader>lc :DBListColumn <cr>
"}}}

" argumentrewrap {{{
"https://github.com/jakobwesthoff/argumentrewrap
nmap <silent> <leader>ra :call argumentrewrap#RewrapArguments()<CR>
" }}}

" sqlserver {{{
"https://github.com/vim-scripts/sqlserver.vim
let g:sql_type_default = "sqlserver"
"}}}

" MRU {{{
let MRU_File = $HOME . '/_vim_mru_files'
"}}}

" MatchTagAlways {{{
"https://github.com/Valloric/MatchTagAlways
let g:mta_use_matchparen_group=1
let g:mta_set_default_matchtag_color=0
let g:mta_filetypes = {
    \ 'htm' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'cs' : 1,
    \ 'aspx' : 1,
    \ 'sql' : 1,
    \ 'py' : 1,
    \ 'rb' : 1,
    \ 'js' : 1,
    \ 'vim' : 1,
    \}
"}}}

" guifont++ {{{
"http://www.vim.org/scripts/script.php?script_id=593
"source $HOME/vimfiles/plugin/guifont++.vim
let guifontpp_smaller_font_map="<M-Down>"
let guifontpp_larger_font_map="<M-Up>"
let guifontpp_original_font_map="<M-=>"
"}}}

" csctrl {{{
"http://vim.sourceforge.net/scripts/script.php?script_id=770
"ss path
let g:ssExecutable = 'C:\Program Files (x86)\Microsoft Visual SourceSafe\ss.exe'
let g:scMenuPath   ='SourceSafe'   "menu name
let g:scUserName   = $SSUSER . ',' . $SSPWD
let g:scDiffVertical   =1
let g:scHistVertical   =1
let g:scSetRuler   =1
let g:scMaintainStatus =1
let g:scShowAllLocks   =1
let g:scShowExtra  =1
"ADD environment variables
"SSUSER
"SSPWD
"Add to path: 'C:\Program Files (x86)\Microsoft Visual SourceSafe\ss.exe'
"}}}

" multiple-cursors {{{
"https://github.com/terryma/vim-multiple-cursors
let  g:multi_cursor_exit_from_visual_mode=0   "default 1
let  g:multi_cursor_exit_from_insert_mode=0   "default 1
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

"https://github.com/terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'   "like SublimeText 3 use <c-d>
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"go to end of word in insert mode
imap <C-e> <esc>ea
"}}}

" Omnisharp {{{
"https://github.com/nosami/Omnisharp
"start Omnisharp when open a file .cs
let g:Omnisharp_start_server = 1
"end Omnisharp when close a file .cs
let g:Omnisharp_stop_server = 1
"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"
let g:OmniSharp_typeLookupInPreview=0
"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
"don't autoselect first item in omnicomplete, show if only one item (for preview)
"set completeopt=menuone,menu,longest
set completeopt=menuone,menu
let g:Omnisharp_highlight_user_types=1
"mappings
"autocmd FileType cs nmap <F5> :wa!<cr> :call OmniSharp#Build()<cr>
autocmd FileType cs nmap <F5> :call OmniSharp#Build()<cr>
autocmd FileType cs nmap gd :call OmniSharp#GotoDefinition()<cr>
autocmd FileType cs nmap <leader>fi :call OmniSharp#FindImplementations()<cr>
autocmd FileType cs nmap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nmap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nmap <leader>fu :call OmniSharp#FindUsages()<cr>
autocmd FileType cs nmap <leader>fm :OmniSharpFindMembersInBuffer<cr>
autocmd FileType cs nmap <leader>tl :call OmniSharp#TypeLookup()<cr>
"I find contextual code actions so useful that I have it mapped to the spacebar
autocmd FileType cs nmap <C-Space> :call OmniSharp#GetCodeActions()<cr>
" rename with dialog
autocmd FileType cs nmap <leader>r :call OmniSharp#Rename()<cr>
" Force OmniSharp to reload the solution. Useful when switching branches etc.
autocmd FileType cs nmap <leader>rs :call OmniSharp#ReloadSolution()<cr>
autocmd FileType cs nmap <leader>cf :call OmniSharp#CodeFormat()<cr>
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
autocmd FileType cs nmap <leader>ss :OmniSharpStartServer<cr>
autocmd FileType cs nmap <leader>sp :OmniSharpStopServer<cr>
autocmd FileType cs nmap <leader>ht :OmniSharpHighlightTypes<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
"move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
set splitbelow
"}}}

" AutoComplPop {{{
" Remove dictionary lookup from the Vim keyword completion.  It did always
" complete the first match for me.  If you edit files with tags you might
" want to add those.
let g:acp_completeOption = '.,w,b,u,t,i'
"let g:acp_completeOption = '.,w,b,u'
"length to trigger AutoComplPop
"let g:acp_behaviorFileLength = 3
"let g:acp_behaviorKeywordLength = 3
"let g:acp_behaviorXmlOmniLength = 3
"let g:acp_behaviorHtmlOmniLength = 3
"let g:acp_behaviorPythonOmniLength = 3
"let g:acp_behaviorCssOmniValueLength = 3
"let g:acp_behaviorRubyOmniSymbolLength = 3
"let g:acp_behaviorCssOmniPropertyLength = 3
"let g:acp_behaviorSnipmateLength=3
"let g:acp_behaviorRubyOmniMethodLength=3

"}}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'
let g:SuperTabDefaultCompletionTypeDiscovery=["&completefunc:<c-x><c-o>","&omnifunc:<c-x><c-u>", "&omnifunc:<c-x><c-k>"]
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabNoCompleteAfter=['^', ',', '\s']
"let g:SuperTabLongestHighlight=1
let g:SuperTabLongestHighlight=0
"defaults
let g:SuperTabMappingForward='<tab>'
let g:SuperTabMappingBackward='<s-tab>'
"let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestEnhanced=0
"}}}

" Ultisnip {{{
"https://github.com/vim-scripts/UltiSnips
"defaults
set runtimepath+=~/vimfiles/snippets/
let g:UltiSnipsDoHash                = 0
let g:UltiSnipsExpandTrigger         = '<tab>'
let g:UltiSnipsListSnippets          = '<c-space>'
let g:UltiSnipsJumpForwardTrigger    = '<tab>'
let g:UltiSnipsJumpBackwardTrigger   = '<s-tab>'
let g:UltiSnipsSnippetsDir           = "~/vimfiles/snippets/"
let g:UltiSnipsSnippetDirectories    = ["UltiSnips", "snippets"]
let g:UltiSnipsDontReverseSearchPath = "1"
"}}}

" vim-autoformat {{{
" https://github.com/Chiel92/vim-autoformat
let g:formatprg_cs = "astyle"
let g:formatprg_args_cs = "--mode=cs --style=ansi -pcHs4"
let g:formatprg_args_expr_cs = '"--mode=cs --style=ansi -pcHs".&shiftwidth'
let g:formatprg_c = "astyle"
let g:formatprg_args_c = "--style=kr -C -N -m0 -M40 -w -xw -Y -c -p -H -U -xe -k3 -s4"
let g:formatprg_args_expr_c = '"--style=kr -C -N -m0 -M40 -w -xw -Y -c -p -H -U -xe -k3 -s".&shiftwidth'
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp =  "--style=kr -C -N -m0 -M40 -w -xw -Y -c -p -H -U -xe -k3 -s4"
let g:formatprg_args_expr_cpp = '"--style=kr -C -N -m0 -M40 -w -xw -Y -c -p -H -U -xe -k3 -s".&shiftwidth'
set equalprg=astyle
"}}}

" vim-jsbeautify {{{
" https://github.com/maksimr/vim-jsbeautify
" http://editorconfig.org/
" require: http://nodejs.org/
"for javascript
autocmd FileType javascript noremap <buffer>  <leader>f :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <leader>f :call RangeJsBeautify()<cr>
" for html
autocmd FileType html,xhtml noremap <buffer> <leader>f :call HtmlBeautify()<cr>
autocmd FileType html,xhtml vnoremap <buffer> <leader>f :call RangeHtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>f :call RangeCSSBeautify()<cr>
"}}}

" Bundle {{{
nmap <leader>bi :PluginInstall<cr>
" }}}

" GUndo {{{
nmap <silent><S-U> :GundoToggle<CR>
" }}}

"indentLine {{{
"https://github.com/Yggdroot/indentLine
let g:indentLine_indentLevel = 20
let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_char = "┊"
"let g:indentLine_first_char = "┊"
"let g:indentLine_color_gui="#204a87"
"let g:indentLine_char = "│"
"let g:indentLine_first_char = "│"
let g:indentLine_color_gui="#b2b2b2"
"}}}

" Fugitive {{{
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
"auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :GitPush<CR>
nmap <silent> <leader>gu :GitPull<CR>
"}}}

"vim-predictive {{{
let g:predictive#dict_path        = expand($HOME . '/quick_references/predictive_dict.txt')
let g:predictive#file_types = ['*', 'text', 'vim', 'python', 'cs', 'sql', 'java', 'ruby', 'html', 'xml', 'javascript']
let g:predictive#keyword_patterns = '^[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$'
let g:predictive#debug=0
"}}}

" YouCompleteMe {{{
"https://github.com/Valloric/YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = "~/vimfiles/bundle/vim-ycm/third_party/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'java' : 1,
      \ 'help' : 1,
      \ 'vim' : 1,
      \ 'sql' : 1
      \}

      "\ 'python' : 1,
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}
