"runtime bundle/tplugin_vim/macros/tplugin.vim
"http://learnvimscriptthehardway.stevelosh.com/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source {{{
"https://github.com/tpope/tpope/blob/master/.vimrc
" Key mappings, functions, auto commands
source $HOME/vimfiles/keymap.vim
" Source the vimrc file after saving it
let $MYVIMRC=expand($HOME.'/vimfiles/_vimrc')
" }}}

" Pathogen {{{
"------------------------------------------------------
"https://github.com/tpope/vim-pathogen
"------------------------------------------------------
"call pathogen#infect()
filetype off " required!
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()
filetype on
"------------------------------------------------------
" }}}

" Vundle {{{
"------------------------------------------------------
"https://github.com/gmarik/vundle
"------------------------------------------------------
"rtp
set runtimepath+=~/vimfiles/
set runtimepath+=~/vimfiles/bin/
set runtimepath+=~/vimfiles/bundle/
set runtimepath+=~/vimfiles/bundle/vundle/
set nocompatible " be iMproved
"https://github.com/gmarik/vundle/issues/211
"call vundle#rc()
call vundle#rc('~/vimfiles/bundle/')
"" let Vundle manage Vundle
"" required!
Bundle 'gmarik/vundle'

" generic {{{
Bundle 'tpope/vim-repeat'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
" }}}

" utils {{{
Bundle 'L9'
Bundle 'genutils'
Bundle 'DfrankUtil'
Bundle 'xolox/vim-misc'
Bundle 'tomtom/vimtlib'
Bundle 'tomtom/tlib_vim'
Bundle 'xolox/vim-shell'
Bundle 'Shougo/vimshell'
Bundle 'mattn/webapi-vim'
Bundle 'bash-support.vim'
Bundle 'tomtom/tplugin_vim'
Bundle 'tpope/vim-dispatch'
Bundle 'MarcWeber/vim-addon-mw-utils'
" }}}

" gui {{{
Bundle 'sjl/gundo.vim'
Bundle 'quickfixsigns'
Bundle 'gcmt/taboo.vim'
Bundle 'xolox/vim-session'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'shemerey/vim-project'
Bundle 'greyblake/vim-preview'
Bundle 'tpope/vim-characterize'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'nathanaelkane/vim-indent-guides'
" }}}

" formatting {{{
Bundle 'AutoAlign'
Bundle 'tpope/vim-ragtag'
"autoclose endfunction, endif, etc...
Bundle 'tpope/vim-endwise'
Bundle 'godlygeek/tabular'
"autoclose {[(
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'Chiel92/vim-autoformat'
"highlighting tags
Bundle 'valloric/MatchTagAlways'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'junegunn/vim-easy-align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jakobwesthoff/argumentrewrap'
Bundle 'quentindecock/vim-cucumber-align-pipes'
" }}}

" source control{{{
Bundle 'mattn/gist-vim'
Bundle 'motemen/git-vim'
Bundle 'tpope/vim-fugitive'
" }}}

" templating {{{
Bundle 'ccimpl.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tskeletons'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'mklabs/vim-backbone'
Bundle 'tomtom/templator_vim'
Bundle 'tomtom/tskeleton_vim'
Bundle 'aperezdc/vim-template'
Bundle 'tomtom/stakeholders_vim'
" }}}

" debuging {{{
Bundle 'Decho'
Bundle 'kablamo/VimDebug'
" }}}

" search/complete tools {{{
Bundle 'grep.vim'
Bundle 'Thesaurus'
Bundle 'FuzzyFinder'
Bundle 'IndexedSearch'
Bundle 'kien/ctrlp.vim'
"Bundle 'SearchComplete'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-abolish'
Bundle 'shemerey/vim-indexer'
"for python
Bundle 'sontek/rope-vim'
Bundle 'nvie/vim-flake8'
Bundle 'rygwdn/rope-omni'
Bundle 'davidhalter/jedi-vim'
Bundle 'Word-Fuzzy-Completion'
Bundle 'bronson/vim-visual-star-search'
"deprecated
Bundle 'AutoComplPop'
"Bundle 'dirkwallenstein/vim-autocomplpop'
Bundle 'dirkwallenstein/vim-localcomplete'
"}}}

 " html {{{
Bundle 'indenthtml.vim'
Bundle 'othree/html5.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'hokaccha/vim-html5validator'
if has('win32') || has('win64')
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
else
    Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
endif
" }}}

" javascript {{{
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'michalliu/jsruntime.vim'
" }}}

" json {{{
Bundle 'elzr/vim-json'
Bundle 'michalliu/jsoncodecs.vim'
" }}}

" lisp {{{
Bundle 'mattn/lisper-vim.git'
Bundle 'slimv.vim'
" }}}

" jquery {{{
Bundle 'itspriddle/vim-jquery'
" }}}

" css {{{
Bundle 'Css-Pretty'
Bundle 'wavded/vim-stylus'
Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'mutewinter/vim-css3-syntax'
" }}}

" asp {{{
Bundle 'biruh/vim-aspnet'
" }}}

" csharp{{{
"issue: install pywin32-214.win32-py2.7.exe
"http://code.google.com/p/vim-visual-studio/issues/detail?id=2
"copy C:\Python27\Lib\site-packages\pywin32_system32 to C:\Python27
"http://sourceforge.net/projects/pywin32/files/pywin32/Build%20214/
Bundle 'visual_studio.vim'
Bundle 'nosami/Omnisharp'
Bundle 'heaths/vim-msbuild'
" }}}

" c++ {{{
Bundle 'c.vim'
Bundle 'refactor'
" }}}

" sql {{{
Bundle 'dbext.vim'
Bundle 'SQLUtilities'
Bundle 'sqlserver.vim'
Bundle 'SQLComplete.vim'
" }}}

"xml {{{
"install
"https://github.com/sukima/xmledit
Bundle 'sukima/xmledit'
"}}}

" python {{{
Bundle 'rkulla/pydiction'
Bundle 'fs111/pydoc.vim.git'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mitechie/pyflakes-pathogen'
" }}}

" perl {{{
Bundle 'vim-perl/vim-perl'
" }}}

"colorscheme
Bundle 'sjl/badwolf'
Bundle 'w0ng/vim-hybrid'
Bundle 'Rykka/galaxy.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'vim-scripts/PyChimp'
Bundle 'tpope/vim-classpath'
Bundle 'sickill/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'sickill/vim-sunburst'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/Liquid-Carbon'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'primitivorm/vim-proman-theme'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'altercation/vim-colors-solarized'
"color tools
Bundle 'CSApprox'
Bundle 'Rykka/colorv.vim'
Bundle 'hexHighlight.vim'
Bundle 'sickill/coloration'
Bundle 'guns/xterm-color-table.vim'
"}}}
"------------------------------------------------

filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"------------------------------------------------------
" }}}

" Formatting {{{
"http://vim.wikia.com/wiki/VimTip30
set nrformats+=alpha,octal,hex
set fileformats="unix,dos,mac"
set formatoptions=tcq "fo
set formatoptions+=qrn1 " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
" }}}

" Backup {{{
set nocp
"evita crear archivos de respaldo
set nobackup
set nowritebackup
set noswapfile
"guarda el archivo en cuanto se deja el buffer
set autowrite
autocmd focuslost * :wa
set autoread
" store swap files in one of these directories
" (in case swapfile is ever turned on)
set viminfo='20,\"80 " read/write a .viminfo file, don't store more
" than 80 lines of registers
set wildmenu " make tab completion for files/buffers act like bash
"http://blog.sanctum.geek.nz/lazier-tab-completion/
set wildmode=list:longest,full " show a list when pressing tab and complete
set wildignore+=.cache,.gem,.ivy2,.extras.bash,.themes
set wildignore+=.subversion,.subversion_IDEA
set wildignore+=.Trash
set wildignore+=Desktop,Documents,Downloads
set wildignore+=Library,Movies,Pictures
set wildignore+=spf13vim2
set wildignore+=.CFUserTextEncoding,.DS_Store
set wildignore+=.bash_history,.extra.bash,.irb-history
set wildignore+=.lesshst,.mysql_history,.pry_history
set wildignore+=.reviewboard-cache,.rnd,.sbt.cache.lock
set wildignore+=.scala_history,.sqlite_history,.viminfo
set wildignore+=*.o,*.obj,.git,vendor/rails/**,vendor/gems/**
set wildignore+=*.swp
if exists("+wildignorecase")
    set wildignorecase
endif

" first full match
set visualbell " don't beep
set noerrorbells " don't beep
"disable blink
autocmd GUIEnter * set visualbell t_vb=
set noshowmode "show current mode
set showcmd " show (partial) command in the last line of the screen
" this also shows visual selection info
" set nomodeline " disable mode lines (security measure)
set modeline
" }}}

" Encoding {{{
" use utf8 encoding for vim files and for default file encoding
"scriptencoding utf-8
set fenc=utf-8
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
  au BufEnter * if &fileencoding == "" | set fileencoding=latin2 | endif
endif
" }}}

" Gui {{{
set cursorline "cursorcolumn "underline the current line, for quick orientation
" make the splitters between windows be blank
"set fillchars=vert:\ ,stl:\ ,stlnc:\
set fillchars=vert:\│
"piexel space between lines
set linespace=0
"establece el esquema de colores
"max num of tabs
set tabpagemax=15
if has('win32') || has('win64')
  set guifont=Consolas_for_Powerline_FixedD:h10
  "set guifont=Envy_Code_R_for_Powerline:h10
  "set guifont=DejaVu_Sans_Mono_for_Powerline:h9
else
  set guifont=Consolas\ for\ Powerline\ 10
  "set guifont=Envy\ Code\ R\ for\ Powerline\ 10
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
endif
" switch syntax highlighting on, when the terminal has colors
syntax on
"syntax enable

"https://github.com/primitivorm/vim-proman-theme
set background=dark
colorscheme proman

"habilita soporte para plugins
filetype plugin on
"muestra numeros de linea del archivo
set nu
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set nowrap
set linebreak "lbr
set showbreak=...
set textwidth=125
if exists('+colorcolumn')
  set colorcolumn=125
endif
"habilita sangrado inteligente
set smartindent
"sangrado automatico
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
set scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
"change tabs to spaces
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set virtualedit=onemore "go to end of line on insert mode at press <up> <down> key
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
"Use Mark plugin to highlight selected word
"hl
set hlsearch
"jumps to search word as you type (annoying but excellent)
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch " show search matches as you type
"Caso insesitivo para busquedas es decir no distingue mayusculas y minusculas
set ignorecase
"case-sensitive if search contains an uppercase character
set smartcase
set nogdefault " search/replace "globally" (on a line) by default
"Resalta la { o ) que estamos cerrando (sm)
"Mostrar la posicion del cursor en todo momento
set ruler
"mat
set matchtime=3
set matchpairs+=<:>,(:),[:]

" }}}

" Folding rules {{{
set foldenable " enable folding
set foldcolumn=0 " add a fold column
set foldmethod=syntax
set foldnestmax=3
set foldlevel=3
set foldlevelstart=0 " start out with everything folded
" which commands trigger auto-unfold
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" }}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw " don't update the display while executing macros
set laststatus=2 " tell VIM to always put a status line in, even
" if there is only one window
set cmdheight=2 " use a status bar that is 2 rows high
" }}}

" Vim behaviour {{{
set switchbuf=useopen " reveal already opened files from the
" quickfix window instead of opening new
" buffers
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
autocmd FileType c,cpp,h setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" ruby {{{
"http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
"http://www.vim.org/scripts/script.php?script_id=1662
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" }}}

" xmledit plugin {{{
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
" }}}

"For the most accurate but slowest result, set the syntax synchronization method to fromstart
autocmd BufEnter * :syntax sync fromstart
"suffixes added to command gf
set suffixesadd+=.c,.cpp,.cs,.js,.css,.html,.htm,.xml,.rb,.h,.aspx,.java,.py,.lisp,.perl
"vbnet highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"muestra los caracteres ocultos y los remplaza por los establecidos
set list
set listchars=tab:▸\-,trail:·,eol:¬,extends:→,precedes:←,nbsp:×
set vb t_vb= " Turn off visual bell, error flash
set mouse=a " enable using the mouse if terminal emulator
set mousemodel=popup_setpos
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions+=b  "remove right-hand scroll bar
" use console dialogs instead of popups
set guioptions+=c
" allow pasting into other applications after visual selection
set guioptions+=a
" }}}

" Spell {{{
"habilita corrector ortografico
set nospell "active spell check
set spelllang=es_mx "Carga el diccionario en o los lenguajes que necesitemos
"limit the number of suggested words
set spellsuggest=best,10
set dictionary+=~/vimfiles/spell/es_MX.dic
set dictionary+=~/vimfiles/spell/en_US.dic
"syntax completion
"http://vim.wikia.com/wiki/VimTip498
au FileType * exe('setl dict+='.$HOME.'/vimfiles/syntax/'.&filetype.'.vim')

"dict for new words
set spellfile=~/vimfiles/spell/dict.add
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Thesaurus {{{
"------------------------------------------------------
"http://www.vim.org/scripts/script.php?script_id=2528
"https://github.com/vim-scripts/Thesaurus
"------------------------------------------------------
set thesaurus+=~/vimfiles/thesaurus/mthes10/mthesaur.txt
set thesaurus+=~/vimfiles/thesaurus/mthes10/roget13a.txt
set thesaurus+=~/vimfiles/thesaurus/ruby.txt
"------------------------------------------------------
" }}}

" Ragtag {{{
"------------------------------------------------------
"https://github.com/tpope/vim-ragtag
"http://www.vim.org/scripts/script.php?script_id=1896
"------------------------------------------------------
let g:ragtag_global_maps = 1
"------------------------------------------------------
" }}}

" NERDTree {{{
"------------------------------------------------------
"https://github.com/scrooloose/nerdtree"
"------------------------------------------------------
"open the plugin NERDTree at startup Vim
if (&diff==0)
    autocmd vimenter * NERDTree
    autocmd vimenter * if !argc() | NERDTree | endif
endif
"cerrar Vim si la unica ventana abierta es la de NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"custom settings
let g:NERDTreeBookmarksFile     = expand($HOME.'/_NERDTreeBookmarks')
let g:NERDTreeShowBookmarks     = 1
let g:NERDTreeWinSize           = 40
let g:NERDTreeChristmasTree     = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen        = 1
let g:NERDTreeMouseMode         = 2
let NERDTreeShowHidden=1
"let NERDTreeMapOpenInTab='<ENTER>'
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
"------------------------------------------------------
" }}}

"" NERDTree-Tabs {{{
""------------------------------------------------------
""https://github.com/jistr/vim-nerdtree-tabs
""------------------------------------------------------
"let g:nerdtree_tabs_open_on_console_startup = 1 "default 0
""let g:nerdtree_tabs_autoclose               = 0 "default 1
""let g:nerdtree_tabs_synchronize_focus       = 0 "default 1
""let g:nerdtree_tabs_smart_startup_focus     = 2 "default 1
""let g:nerdtree_tabs_synchronize_view        = 0  "default 1
""------------------------------------------------------
"" }}}

" Tagbar {{{
"---------------------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
"file to find tags
set tags=tags,./tags
"to specify one or more file extensions, which Vim will attempt to use when looking up a filename with the gf
set suffixesadd+=.cs
set suffixesadd+=.py
set suffixesadd+=.rb
set suffixesadd+=.js
"toggle fold = o/za
let g:tagbar_width       = 25    "default 40
let g:tagbar_compact     = 1     "default 0
let g:tagbar_foldlevel   = 2    "default 99
let g:tagbar_ctags_bin   = 'ctags'
let g:tagbar_autofocus   = 0   "default 0
let g:tagbar_expand      = 0
"let g:tagbar_iconchars  = ['▸', '▾']
let g:tagbar_autoclose   = 0
let g:tagbar_singleclick = 1
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"multitabs
"If you use multiple tabs and want Tagbar to also open in the current tab when
"you switch to an already loaded, supported buffer
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" uncomment this section for open new buffers in a tab always
"always show tabs
set showtabline=2
if !&hidden
  set hidden " hide buffers instead of closing them this
  " means that the current buffer can be put
  " to background without being written; and
  " that marks and undo history are preserved
endif
if (&diff==0)
    "Open files always in new tabs
    autocmd BufReadPost * OpenInTab
endif
function! DoOpenInTab()
if(&modifiable && !&readonly )
  tab ball
  tabn
endif
endfunction
command! -nargs=0 OpenInTab call DoOpenInTab()
""~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
""---------------------------------------------------------
"" }}}

"MiniBufExpl {{{
"------------------------------------------------------
"https://github.com/fholgado/minibufexpl.vim
"------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"------------------------------------------------------
" }}}

" CtrlP {{{
"---------------------------------------------------------
"https://github.com/kien/ctrlp.vim
"---------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/ctrlp_cache'
let g:ctrlp_max_height = 15
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window_bottom = 0
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
if has('win32') || has('win64')
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
  "http://vim.wikia.com/wiki/Fix_errors_that_relate_to_reading_or_creating_files_in_the_temp_or_tmp_environment_on_an_MS_Windows_PC
  set directory=.,$TMP,$TEMP
  set undodir=.,$TMP,$TEMP
  if &diff
    set shell=bash
  endif
else
  set directory=~/tmp,/tmp
  if exists('+undodir')
  set undodir=~/tmp,/tmp
  endif
  let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
endif
"---------------------------------------------------------
" }}}

" Syntastic {{{
"--------------------------------------------------------
" https://github.com/scrooloose/syntastic
"--------------------------------------------------------
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
" }}}

" Dbext {{{
"---------------------------------------------------------
"http://www.vim.org/scripts/script.php?script_id=356
"https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
"---------------------------------------------------------
"connect to sql server instance
let g:dbext_default_profile_sql_des='type=SQLSRV:srvname=10.48.68.8:dbname=amdes:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_desvw='type=SQLSRV:srvname=10.48.68.8\SQL2K8:dbname=amdesvw:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qa='type=SQLSRV:srvname=10.48.68.8:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw='type=SQLSRV:srvname=10.48.68.8:dbname=amqavw:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qa40='type=SQLSRV:srvname=10.48.95.40:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw40='type=SQLSRV:srvname=10.48.95.40:dbname=amqavw:user=espejopruebas:passwd=12345678'


"command to change Connection
function! FnChangeDB()
    :DBPromptForBufferParameters
endfunction
command! -nargs=0 ChangeDB :call FnChangeDB()

"add this comment at begin of file script to shebang
"// dbext:profile=sql_qavw
let g:dbext_default_history_file=$HOME . '/dbext_sql_history.txt'
"---------------------------------------------------------
" }}}

" SQLComplete {{{
"---------------------------------------------------------
"https://github.com/vim-scripts/SQLComplete.vim
"---------------------------------------------------------
let g:ftplugin_sql_omni_key = '<C-C>'
let g:ftplugin_sql_omni_key_right = '<c-right>'
let g:ftplugin_sql_omni_key_left = '<c-left>'
autocmd FileType sql set omnifunc=sqlcomplete#Complete
"---------------------------------------------------------
" }}}

" sqlserver {{{
"---------------------------------------------------------
"https://github.com/vim-scripts/sqlserver.vim
"---------------------------------------------------------
let g:sql_type_default = "sqlserver"
"---------------------------------------------------------
" }}}

"airline {{{
if &background=='light'
    let g:airline_theme = 'wombat'
else
    let g:airline_theme = 'light'
endif
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_powerline_fonts = 1
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:airline#extensions#tabline#enabled = 1
"}}}

" vim-session {{{
"---------------------------------------------------------
"https://github.com/xolox/vim-session
"---------------------------------------------------------
let g:session_command_aliases = 1
"---------------------------------------------------------
" }}}

" Showmarks {{{
"---------------------------------------------------------
"http://www.vim.org/scripts/script.php?script_id=152
"https://github.com/vim-scripts/ShowMarks
"---------------------------------------------------------
let g:showmarks_enable=0
"---------------------------------------------------------
" }}}

" IndentGuides {{{
"---------------------------------------------------------
"https://github.com/nathanaelkane/vim-indent-guides
"---------------------------------------------------------
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=1
"run at startup
let g:indent_guides_enable_on_vim_startup=1
"<Leader>ig   ->show guides
"---------------------------------------------------------
" }}}

" javascript-libraries-syntax {{{
"---------------------------------------------------------
"https://github.com/othree/javascript-libraries-syntax.vim
"---------------------------------------------------------
let g:used_javascript_libs = 'underscore,backbone'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0
"---------------------------------------------------------
" }}}

" zencoding {{{
"---------------------------------------------------------
"https://github.com/mattn/zencoding-vim
"http://mattn.github.com/zencoding-vim/
"http://coding.smashingmagazine.com/2009/11/21/zen-coding-a-new-way-to-write-html-code/
"---------------------------------------------------------
let g:user_zen_mode='n' "only enable normal mode functions.
let g:user_zen_mode='inv' "enable all functions, which is equal t
let g:user_zen_mode='a' "enable all function in all mode.
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
"---------------------------------------------------------
" }}}

" badwolf {{{
"---------------------------------------------------------
"https://github.com/sjl/badwolf
"---------------------------------------------------------
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line darker than the background.
let g:badwolf_tabline = 0
" Make the tab line the same color as the background.
let g:badwolf_tabline = 1
" Make the tab line lighter than the background.
let g:badwolf_tabline = 2
" Make the tab line much lighter than the background.
let g:badwolf_tabline = 3
" Turn off HTML link underlining
let g:badwolf_html_link_underline = 0
" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1
"---------------------------------------------------------
" }}}

" tskeleton_vim {{{
"---------------------------------------------------------
"https://github.com/tomtom/tskeleton_vim
"---------------------------------------------------------
"my skeletons
"avoid generate error at processing vundle\cache\tskel_menu\help
set runtimepath+=~/vimfiles/bundle/vundle/tskeleton_vim/
let g:tskelMenuCache = ''
let g:tskelDir=$HOME . '/vimfiles/bundle/tskeletons/'
let g:tskelUserName='Ing. Primitivo R. Montero'
let g:tskelUserEmail='cibercafe_montero@hotmail.com'
"autocmd BufNewFile /here/*.suffix TSkeletonSetup othertemplate.suffix
autocmd BufNewFile *.py TSkeletonSetup skeleton.py
autocmd BufNewFile *.htm TSkeletonSetup skeleton.htm
autocmd BufNewFile *.html TSkeletonSetup skeleton.htm
autocmd BufNewFile *.project TSkeletonSetup skeleton.project
autocmd BufNewFile *.sln TSkeletonSetup skeleton.sln
autocmd BufNewFile *.config TSkeletonSetup skeleton.config
autocmd BufNewFile *.css TSkeletonSetup skeleton.css
autocmd BufNewFile *.xml TSkeletonSetup skeleton.xml
autocmd BufNewFile *.php TSkeletonSetup skeleton.php
"---------------------------------------------------------
" }}}

" MRU {{{
"---------------------------------------------------------
let MRU_File = $HOME . '/_vim_mru_files'
"---------------------------------------------------------
" }}}

" MatchTagAlways {{{
"---------------------------------------------------------
"https://github.com/Valloric/MatchTagAlways
"---------------------------------------------------------
let g:mta_use_matchparen_group=0
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
            \}
"---------------------------------------------------------
" }}}

" vimtlib {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/tomtom/vimtlib/blob/master/INSTALL.TXT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for template generator add
"runtime bundle/tplugin_vim/macros/tplugin.vim
"run :TPluginScan!
set runtimepath+=~/vimfiles/bundle/vimtlib/
"let g:tplugin_autoload=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" vim template {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/aperezdc/vim-template
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:templates_plugin_loaded = 1 "to skip loading of this plugin.
let g:templates_no_autocmd = 1 "to disable automatic insertion of template in new files.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" templator {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/tomtom/templator_vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"\vimfiles\bundle\vimtlib\templator
let b:templator_root_dir='~/vimfiles/templator/'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" guifont++ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"http://www.vim.org/scripts/script.php?script_id=593
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $HOME/vimfiles/plugin/guifont++.vim
let guifontpp_smaller_font_map="<M-Down>"
let guifontpp_larger_font_map="<M-Up>"
let guifontpp_original_font_map="<M-=>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" csctrl {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"http://vim.sourceforge.net/scripts/script.php?script_id=770
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ss path
let g:ssExecutable = 'C:\Program Files (x86)\Microsoft Visual SourceSafe\ss.exe'
let g:scMenuPath       ='SourceSafe'   "menu name
let g:scUserName       = 'proman,12345678'
let g:scDiffVertical   =1
let g:scHistVertical   =1
let g:scSetRuler       =1
let g:scMaintainStatus =1
let g:scShowAllLocks   =1
let g:scShowExtra      =1
"ADD environment variables
"SSUSER
"SSPWD
"Add to path: 'C:\Program Files (x86)\Microsoft Visual SourceSafe\ss.exe'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" multiple-cursors {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/terryma/vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let  g:multi_cursor_exit_from_visual_mode=0   "default 1
let  g:multi_cursor_exit_from_insert_mode=0   "default 1
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" vim-auto-save {{{
"https://github.com/907th/vim-auto-save
let g:auto_save = 1  "Enable/Disable AutoSave on Vim startup
" }}}

" Omnisharp {{{
"---------------------------------------------------------
"https://github.com/nosami/Omnisharp
"---------------------------------------------------------
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
"---------------------------------------------------------
" }}}

" AutoComplPop {{{
"---------------------------------------------------------
" Remove dictionary lookup from the Vim keyword completion.  It did always
" complete the first match for me.  If you edit files with tags you might
" want to add those.
"---------------------------------------------------------
"let g:acp_completeOption              = '.,w,b'
let g:acp_completeOption             = '.,w,b,k,t,i'
let g:acp_behaviorKeywordLength       = 1
let g:acp_behaviorSnipmateLength      = 1
" How keyword completion is triggered.  Usually you want variables before
" the current line.  ... Unless you write a file bottom up, that is.
let g:acp_behaviorKeywordCommand      = "\<C-P>"
let g:acp_behaviorUserDefinedMeets    = 'acp#meetsForKeyword'
let g:acp_autoselectFirstCompletion   = 1
let g:acp_behaviorUserDefinedFunction = 'localcomplete#localMatches'
"http://vertuxeltes.blogspot.com/2013/05/powerful-insert-mode-completion.html
let g:localcomplete#LocalMinPrefixLength = 1
let g:localcomplete#AllBuffersMinPrefixLength = 1
let g:localcomplete#DictMinPrefixLength = 3
let g:acp_refeed_checkpoints = [
            \ g:localcomplete#LocalMinPrefixLength,
            \ g:localcomplete#AllBuffersMinPrefixLength,
            \ g:localcomplete#DictMinPrefixLength]
" Beware. Probably expensive (flickering)
let g:acp_refeed_after_every_char = 0
let g:localcomplete#AdditionalKeywordChars = '-'
let g:acp_keyword_chars_for_checkpoint =
            \ g:localcomplete#AdditionalKeywordChars
let b:LocalCompleteLinesAboveToSearchCount = 15
let b:LocalCompleteLinesBelowToSearchCount = 10
"for python
function! g:localFirstPythonCombiner(findstart, keyword_base)
    let l:before_rope = [
                \ 'localcomplete#localMatches',
                \ ]
    let l:after_rope = [
                \ 'localcomplete#allBufferMatches',
                \ ]
    return combinerEXP#ropeCombiner(
                \ a:findstart,
                \ a:keyword_base,
                \ l:before_rope,
                \ l:after_rope,
                \ 0)
endfunction
" Minimum leading word lengths
let b:LocalCompleteLocalMinPrefixLength = 1
let b:LocalCompleteAllBuffersMinPrefixLength = 3

" Restart omni completion after these word lengths.
let b:acp_refeed_checkpoints = [
            \ b:LocalCompleteLocalMinPrefixLength,
            \ b:LocalCompleteAllBuffersMinPrefixLength,
            \ ]

" Preemptively override global values
let b:acp_refeed_after_every_char = 0
let b:LocalCompleteAdditionalKeywordChars = '-'
let b:acp_keyword_chars_for_checkpoint =
            \ b:LocalCompleteAdditionalKeywordChars
if ! exists("g:acp_behavior")
    let g:acp_behavior={}
endif
let g:acp_behavior['python'] = [
        \     {
        \       'command': "\<C-X>\<C-U>",
        \       'completefunc': 'g:localFirstPythonCombiner',
        \       'meets': 'acp#meetsForPythonOmni',
        \       'repeat': 1,
        \     },]
let g:acp_behaviorPythonOmniLength = 1
" }}}

" SuperTab {{{
"---------------------------------------------------------
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'
let g:SuperTabDefaultCompletionTypeDiscovery=["&completefunc:<c-x><c-u>","&omnifunc:<c-x><c-o>"]
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
"defaults
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
"---------------------------------------------------------
" }}}

"------------------------------------------------------
"c compiler
autocmd FileType *.c,*.h set makeprg=gcc\ %
autocmd FileType *.cpp,*.h set makeprg=g++\ %
autocmd FileType *.cpp,*.c,*.h set errorformat=%f(%l)%m
"------------------------------------------------------

" SnipMate {{{
"------------------------------------------------------
"snipMate plugin
"https://github.com/garbas/vim-snipMate
"------------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['cs'] = 'cs'
let g:snipMate.scope_aliases['sql'] = 'sql'
"g:snippets_dir is deprecated add my personal snippets by runtimepath
"------------------------------------------------------
" }}}

" Ultisnip {{{
"------------------------------------------------------
"https://github.com/vim-scripts/UltiSnips
"------------------------------------------------------
let g:UltiSnipsExpandTrigger               = '<c-space>'
let g:UltiSnipsListSnippets                = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger          = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger         = '<c-k>'
"------------------------------------------------------
" }}}

" vim-autoformat {{{
" https://github.com/Chiel92/vim-autoformat
"---------------------------------------------------------
let g:formatprg_cs = "astyle"
let g:formatprg_args_cs = "--mode=cs --style=ansi -pcHs4"
let g:formatprg_args_expr_cs = '"--mode=cs --style=ansi -pcHs".&shiftwidth'
set equalprg=astyle
"---------------------------------------------------------
" }}}

" Conque {{{
"http://code.google.com/p/conque/
"http://code.google.com/p/conque/wiki/Usage
let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_ToggleKey = '<F8>'
let g:ConqueTerm_PyExe = 'C:/Python27/python.exe'
let g:ConqueTerm_CodePage = 1
let g:ConqueTerm_ColorMode = 'conceal'
let g:ConqueTerm_SessionSupport = 1
let g:ConqueTerm_CloseOnEnd = 1
" }}}

"Word-Fuzzy-Completion {{{
"https://github.com/vim-scripts/Word-Fuzzy-Completion
let g:fuzzywordcompletion_disable_keybinding=1
"}}}


" pydiction {{{
"https://github.com/rkulla/pydiction
let g:pydiction_location = $HOME . '/vimfiles/bundle/pydiction/complete-dict'
" }}}

"slimv {{{
"https://github.com/vim-scripts/slimv.vim
let g:slimv_lisp='C:\lispbox-0.7\ccl-1.6-windowsx86\wx86cl64.exe'
let g:slimv_swank_cmd = '!start "C:\lispbox-0.7\ccl-1.6-windowsx86\wx86cl64.exe" -l "C:\lispbox-0.7\slime-20110205.092829\start-swank.lisp"'
"}}}
