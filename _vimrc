set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
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
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"------------------------------------------------------
"pathogen plugin:
"https://github.com/tpope/vim-pathogen
"------------------------------------------------------
call pathogen#infect()
call pathogen#helptags()

 set nocompatible               " be iMproved
 filetype off                   " required!


"------------------------------------------------------
 "vundle 
 "https://github.com/gmarik/vundle
"------------------------------------------------------
" "
 "set rtp+=~/.vim/bundle/vundle/
 "call vundle#rc()

 "" let Vundle manage Vundle
 "" required! 
 "Bundle 'gmarik/vundle'

 "" My Bundles here:
 ""
 "" original repos on github
 "Bundle 'tpope/vim-fugitive'
 "Bundle 'Lokaltog/vim-easymotion'
 "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 "Bundle 'tpope/vim-rails.git'
 "" vim-scripts repos
 "Bundle 'L9'
 "Bundle 'FuzzyFinder'
 "" non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 "" ...

 "filetype plugin indent on     " required!
"------------------------------------------------------

"habilita esquema de colores para algunos lenguaje de programación
syntax on

"habilita funcionalidades a vim, para algunos plugins esta opción es requerida
set nocompatible
set nocp
"evita crear archivos de respaldo
set nobackup	
set nowritebackup
set noswapfile	
"guarda el archivo en cuanto se deja el buffer
set autowrite
set autoread
" use utf8 encoding for vim files and for default file encoding
set fenc=utf-8
set encoding=utf-8
set fileencoding=utf-8

"establece el esquema de colores
if has('gui_running')
    set background=light
else
    set background=dark
endif
syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
colorscheme Monokai-Refined
"colorscheme proman
"colorscheme mustang
"colorscheme wombat
"colorscheme github
"colorscheme smyck
"colorscheme railscasts
"colorscheme default

"habilita plugin para sangrado de lineas
filetype plugin indent on

"habilita soporte para plugins
filetype plugin on

"define tipo de encoding para archivo de texto plano
set encoding=utf-8

"muestra numeros de linea del archivo
set nu
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set wrap!

"habilita sangrado inteligente
set smartindent
"sangrado automatico
set ai
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=3
"Use Mark plugin to highlight selected word
set hlsearch
"Caso insesitivo para busquedas es decir no distingue mayusculas y minusculas
set ignorecase

"estable el modo de pliegue (folding)
set foldmethod=indent "fold based on indent
set foldnestmax=10	"deepest fold is 10 levels
set nofoldenable	"dont fold by default
set foldlevel=1	"this is just what i Use
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen 
" au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
au FileType c set omnifunc=ccomplete#Complete
au FileType java set omnifunc=javacomplete#Complete

"---------------------------------------------------------
"javascript-libraries-syntax.vim
"https://github.com/othree/javascript-libraries-syntax.vim
"---------------------------------------------------------
let g:used_javascript_libs = 'underscore,backbone'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0
"---------------------------------------------------------
"

"Asigna tecla <F4> para habilitar/deshabilitar remarcado de busqueda
""noremap <F4> :set hlsearch! hlsearch?<CR>
"noremap <F2> :set hlsearch! hlsearch?<CR>
""Mapea la tecla <*> al doble click para remarcado
"map <2-LeftMouse> *
""Mapea la tecla <*> al doble click para remarcado en modo insert
"imap <2-LeftMouse> <c-o>*

" Indentation style color guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"remarcado de lineas speciales
highlight SpecialKey guifg=#c0c0c0 ctermfg=192
nmap <leader>l :set list!<CR>
"muestra los caracteres ocultos y los remplaza por los establecidos
set list
set listchars=tab:\|-,trail:-,eol:¬
highlight NonText guifg=#4a4a59
if has('gui_running')
    "establecer fuente y tamaño
    "set guifont=Ubuntu_Mono:h11:cDEFAULT
    "set guifont=Ubuntu_Mono:h11:cANSI
    "set guifont=Consolas:h12:cDEFAULT
    "set guifont=Sansation_Light:h11:cDEFAULT
    "set guifont=Sansation:h11:cDEFAULT
    "set guifont=ProggyCleanTT:h13:cDEFAULT
    "set guifont=DejaVu_Sans_Mono:h10:cDEFAULT
    "set guifont=Monaco:h9:cDEFAULT
    "set guifont=Ubuntu_Mono_for_powerline:h14:cDEFAULT
    set guifont=Ubuntu_Mono_for_powerline:h10:cANSI
    set cursorline cursorcolumn
    "establece fondo a linea actual y columna actual
    if colors_name == 'proman'
        hi CursorLine guibg=#e6e6fa
        hi CursorColumn guibg=#e6e6fa
    else
        hi CursorLine guibg=Gray40 guifg=#ffffff
        hi CursorColumn guibg=Gray40 guifg=#ffffff
    endif
endif

" indentline
let g:indentLine_char = '|'

"------------------------------------------------------
"c compiler
"au FileType C set makeprg=gcc\ %
"au FileType Cpp set makeprg=g++\ %

"------------------------------------------------------
"snipMate plugin
"https://github.com/msanders/snipmate.vim
"------------------------------------------------------
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['cs'] = 'cs'
""especifica la ruta en donde se encuentran los snippets para el plugin snipMate
"let g:snippets_dir="$HOME\\vimfiles\\bundle\\snipmate\\snippets\\"
"------------------------------------------------------

"------------------------------------------------------
"NERDTree plugin
"https://github.com/scrooloose/nerdtree"
"------------------------------------------------------

"abre el plugin NERDTree al iniciar Vim
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"cerrar Vim si la unica ventana abierta es la de NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeBookmarksFile = expand($HOME.'_NERDTreeBookmarks')
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 45
let g:NERDTreeChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMouseMode=2
let g:NERDTreeIgnore=[
      \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0

"the working directory is always the one where the active buffer is located.
set autochdir
"I make sure the working directory is set correctly.
let g:NERDTreeChDirMode=0
"I hit <leader>n to open NERDTree.
"nnoremap <leader>n :NERDTree .<CR>

"mapea las teclas Ctrl+n para abrir NERDTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
"nmap <silent><Leader>nt :NERDTreeMirrorToggle<CR>
"let g:NERDTreeChDirMode = 1
"let g:NERDTreeWinPos = "right"
"------------------------------------------------------
"------------------------------------------------------
" NERDcommenter 
" https://github.com/scrooloose/nerdcommenter
"------------------------------------------------------
let NERDSpaceDelims=1
" map <Leader>/ <Plug>NERDCommenterToggle<CR>
" vmap <Leader>/ <Plug>NERDCommenterToggle<CR>
"------------------------------------------------------
"
"------------------------------------------------------
"mini buffer explorer
"https://github.com/fholgado/minibufexpl.vim
"------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" MiniBufExpl Colors
hi MBEVisibleActive guifg=#ff4500 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg
"------------------------------------------------------
"
"---------------------------------------------------------
"easymotion
"https://github.com/Lokaltog/vim-easymotion
"---------------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>e'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment
"---------------------------------------------------------
"
"---------------------------------------------------------
"ctrlp
"https://github.com/kien/ctrlp.vim
"---------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cache_dir = $HOME.'/ctrlp_cache'
let g:ctrlp_max_height = 15
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window_bottom = 0

nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"---------------------------------------------------------
"
"--------------------------------------------------------
" fugitive
" http://www.vim.org/scripts/script.php?script_id=2975        
" https://github.com/tpope/vim-fugitive
"--------------------------------------------------------
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
"--------------------------------------------------------
"
"--------------------------------------------------------
" rainbow parentheses
" https://github.com/vim-scripts/Rainbow-Parenthesis
"--------------------------------------------------------
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"
"--------------------------------------------------------
"
"--------------------------------------------------------
" syntastic 
" https://github.com/scrooloose/syntastic
"--------------------------------------------------------
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol=''
"let g:syntastic_warning_symbol=''
"--------------------------------------------------------
"
"--------------------------------------------------------
" tabular
" https://github.com/godlygeek/tabular
"--------------------------------------------------------
if exists(":Tabularize")
  vmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t3 :Tabularize /#<CR>
  vmap <Leader>t' :Tabularize /'<CR>
  vmap <Leader>t'' :Tabularize /"<CR>
  vmap <Leader>t0 :Tabularize /)/r1c1l0<CR>
  vmap <Leader>t== :Tabularize /=/r1c1l0<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
endif
"--------------------------------------------------------
"
"---------------------------------------------------------
"taglist
"http://www.vim.org/scripts/script.php?script_id=273
"http://ctags.sourceforge.net/
"http://vim.sourceforge.net/scripts/script.php?script_id=273
"http://sourceforge.net/projects/vim-taglist/files/
"http://ctags.sourceforge.net/ctags.html
"---------------------------------------------------------
" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <C-F4> :TlistToggle<CR>
"Search and destroy using tags
"map <C-F12> :!C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!C:\cygwin\bin\ctags.exe -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
":!which ctags -> tofindctalocation
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Ctags_Cmd = '"C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe"'
let Tlist_Ctags_Cmd = '"C:\cygwin\bin\ctags.exe"'
"---------------------------------------------------------
"
"---------------------------------------------------------
"easytags
"https://github.com/xolox/vim-easytags
"---------------------------------------------------------
"let g:easytags_cmd = '"C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe"'
let g:easytags_cmd = '"C:\cygwin\bin\ctags.exe"'
"let g:easytags_file = '"C:\cygwin\home\Proman02\vimfiles\ctags58\tags\tags"'
let g:easytags_file = '"C:\cygwin\home\Proman02\tags"'
"" search first in current directory then file directory for tag file
set tags=tags,./tags
let g:easytags_dynamic_files=1
let g:easytags_always_enabled=0
let g:easytags_on_cursorhold=0
let g:easytags_auto_highlight=0
"---------------------------------------------------------
"
"---------------------------------------------------------
"db ext plugin
"http://www.vim.org/scripts/script.php?script_id=356
"https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
"---------------------------------------------------------
"connect to sql server instance
let g:dbext_default_profile_sql_qa = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqavw:user=espejopruebas:passwd=12345678'
"---------------------------------------------------------
"
"---------------------------------------------------------
"sql formatter
"
"---------------------------------------------------------
vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>
"---------------------------------------------------------
"
"---------------------------------------------------------
"tagbar
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
let g:tagbar_ctags_bin='"C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe"'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide

"if g:OS#mac
""how to install ctag mac https://weblion.psu.edu/trac/weblion/wiki/MacVim
  "let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
"endif
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_expand = 0
nmap <silent><leader>T :TagbarToggle<CR>
"noremap <silent> <Leader>y :TagbarToggle       " Display panel with y (or ,y)
"---------------------------------------------------------
"
"---------------------------------------------------------
"powerline
"https://github.com/Lokaltog/vim-powerline.git           
"https://github.com/Lokaltog/powerline          
"https://powerline.readthedocs.org/en/latest/
"---------------------------------------------------------
"source ~/.vim/bundle/powerline/powerline/ext/vim/source_plugin.vim
if has("gui_running")
    let g:Powerline_symbols = 'fancy'
else
    let g:Powerline_symbols = 'compatible'
endif

" set laststatus=2
" let g:Powerline_theme='short'
" let g:Powerline_colorscheme='solarized256'
"---------------------------------------------------------
"
"---------------------------------------------------------
"Vim intellisence
"http://insenvim.sourceforge.net/
"https://github.com/tomtom/checksyntax_vim.git
"---------------------------------------------------------
"let $VIM_INTELLISENSE="$HOME\\vimfiles\\bundle\\Intellisense\\"
let $VIM_INTELLISENSE="C:\\Program Files\\Vim\\Intellisense\\"
"---------------------------------------------------------
let g:visual_studio_quickfix_errorformat='%.%#%*[0-9>]\ %#%f(%l)\ :\ %m' 


"---------------------------------------------------------
"Showmarks
"http://www.vim.org/scripts/script.php?script_id=152
"https://github.com/vim-scripts/ShowMarks
"---------------------------------------------------------
let g:showmarks_enable=0
"---------------------------------------------------------

"---------------------------------------------------------
" clang_complete configuration
" https://github.com/Rip-Rip/clang_complete
"---------------------------------------------------------
"let g:SuperTabDefaultCompletionType="context"
""let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"set completeopt=menuone,menu,longest
"set pumheight=15
"set conceallevel=2
"set concealcursor=vin
"set pumheight=20

""for clang library
"let g:clang_use_library=1
"let g:clang_snippets=1
"let g:clang_snippets_engine='snipmate'
""let g:clang_snippets_engine='ultisnips'
""let g:clang_snippets_engine='clang_complete'
"let g:clang_conceal_snippets=1
"let g:clang_periodic_quickfix=0
"let g:clang_hl_errors=1
"let g:clang_complete_auto=0
"let g:clang_complete_copen=1
"let g:clang_complete_patterns = 1
"let g:clang_auto_select = 1
""
"let g:clang_user_options='|| exit 0'
""let g:clang_user_options=""
"let g:clang_close_preview=1
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
"nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

""let g:clic_filename="/usr/bin/clang"
"nnoremap <Leader>r :call ClangGetReferences()<CR>
"nnoremap <Leader>d :call ClangGetDeclarations()<CR>
"nnoremap <Leader>s :call ClangGetSubclasses()<CR>


""for debugging option enable
""let g:clang_debug=1

""let g:clang_exec= "$HOME\\vimfiles\\bundle\\clang_complete\\bin\\cc_args.py"
""let g:clang_library_path="$HOME\\vimfiles\\bundle\\clang_complete\\plugin\\libclang.py"
"let g:clang_exec= '"C:\cygwin\bin\clang"'
"let g:clang_library_path='"C:\cygwin\lib"'
"---------------------------------------------------------

"---------------------------------------------------------
"neocompletecache
"https://github.com/osyo-manga/neocomplcache-clang_complete
"---------------------------------------------------------
" add clang_complete option
"let g:clang_complete_auto=1

"if !exists('g:neocomplcache_force_omni_patterns')
    "let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_overwrite_completefunc = 1
"let g:neocomplcache_force_omni_patterns.c =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objc =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objcpp =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"---------------------------------------------------------
"
"---------------------------------------------------------
"ultisnips
"https://github.com/SirVer/ultisnips
"---------------------------------------------------------
"let g:UltiSnipsExpandTrigger="<NL>"
"inoremap <silent> <tab> <C-R>=g::if expand("%") == ""|browse confirm w|else|confirm w|endif
"UltiSnips_Complete()<cr>
"snoremap <silent> <tab> <Esc>:call UltiSnips_ExpandSnippetOrJump()<cr>
"xnoremap <tab> :call UltiSnips_SaveLastVisualSelection()<cr>gv
"---------------------------------------------------------

"---------------------------------------------------------
"CheckSyntax
"http://www.vim.org/scripts/script.php?script_id=1431
"---------------------------------------------------------
"map <C-B> :!php -l %<CR>

"
"---------------------------------------------------------
" neocomplcache
" https://github.com/shougo/neocomplcache
"---------------------------------------------------------
"" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
"let g:acp_enableAtStartup=0
"" Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_at_startup=1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case=1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion=1
"" Use underscore completion.
"let g:neocomplcache_enable_underbar_completion=1
"" Sets minimum char length of syntax keyword.
"let g:neocomplcache_min_syntax_length=3
"" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Define file-type dependent dictionaries.
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
    "\ }

"" Define keyword, for minor languages
"if !exists('g:neocomplcache_keyword_patterns')
  "let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" R"ecommended key-mappings.
"" <CR>: close popup and save indent.
""inoremap <expr><CR>  neocomplcache#smart_close_popup()."\<CR>"
""https://github.com/tpope/vim-endwise/issues/5
"inoremap <silent><CR>  <C-R>=neocomplcache#smart_close_popup()<CR><CR>
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"


" E"nable heavy omni completion, which require computational power and may stall the vim. 
"if !exists('g:neocomplcache_omni_patterns')
  "let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.go = '\h\w*\%.'
"let g:neocomplcache_omni_patterns.less = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
"---------------------------------------------------------

"---------------------------------------------------------
"neosnippet
"https://github.com/Shougo/neosnippet
"---------------------------------------------------------
" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" For snippet_complete marker.
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif
"" Tell Neosnippet about the other snippets
""let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
"let g:neosnippet#snippets_directory='~/vimfiles/bundle/snipmate-snippets/snippets'
"---------------------------------------------------------
"
"---------------------------------------------------------
"vimtlib
"https://github.com/tomtom/vimtlib/blob/master/INSTALL.TXT
"---------------------------------------------------------
"runtime bundle/tplugin_vim/macros/tplugin.vim
"TPlugin! tlib_vim 02tlib
"---------------------------------------------------------
"

