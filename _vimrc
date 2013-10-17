"http://learnvimscriptthehardway.stevelosh.com/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source {{{
"https://github.com/tpope/tpope/blob/master/.vimrc
"configuration file like Windows editor
" source $HOME/vimfiles/mswin.vim
" Key mappings, functions, auto commands
source $HOME/vimfiles/keymap.vim
" Source the vimrc file after saving it
let $MYVIMRC=expand($HOME.'/vimfiles/_vimrc')
"if has("autocmd")
"autocmd bufwritepost _vimrc source $MYVIMC
"endif
" }}}

" Pathogen {{{
"------------------------------------------------------
"https://github.com/tpope/vim-pathogen
"------------------------------------------------------
"call pathogen#infect()
filetype off " required!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on
"------------------------------------------------------
" }}}

" Vundle {{{
"------------------------------------------------------
"https://github.com/gmarik/vundle
"------------------------------------------------------
"rtp
set runtimepath+=~/vimfiles/bundle/vundle/
set runtimepath+=~/vimfiles/bin/
set runtimepath+=~/vimfiles/bundle/
set runtimepath+=~/vimfiles
set nocompatible " be iMproved
"https://github.com/gmarik/vundle/issues/211
"let g:bundle_dir=expand($HOME.'/vimfiles/bundle/vundle')
"call vundle#rc()
call vundle#rc('~/vimfiles/bundle/vundle')
"" let Vundle manage Vundle
"" required!
Bundle 'gmarik/vundle'

" My Bundles set here:
"
" original repos on github
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-capslock'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mattn/gist-vim'
Bundle 'othree/html5.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'majutsushi/tagbar'
Bundle 'shemerey/vim-indexer'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/lisper-vim.git'
Bundle 'scrooloose/syntastic'
Bundle 'valloric/MatchTagAlways'
Bundle 'plasticboy/vim-markdown'
Bundle 'chrisbra/NrrwRgn'
Bundle 'itspriddle/vim-jquery'
Bundle 'mattn/zencoding-vim'
Bundle 'godlygeek/csapprox'
Bundle 'godlygeek/tabular'
Bundle 'powerman/vim-plugin-viewdoc'
Bundle 'xolox/vim-shell'
Bundle 'Shougo/vimshell'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'xolox/vim-session'
"Bundle 'bling/vim-airline'
 "{{{ powerline
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'stephenmckinney/vim-solarized-powerline'
"Bundle 'fromonesrc/monaco-powerline-vim'
"Bundle 'Lokaltog/powerline'
 "}}}
Bundle 'wavded/vim-stylus'
Bundle 'heaths/vim-msbuild'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'guns/xterm-color-table.vim'
Bundle 'leshill/vim-json'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'Css-Pretty'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'tsaleh/vim-matchit'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/vimtlib'
Bundle 'tomtom/tplugin_vim'
Bundle 'tomtom/stakeholders_vim'
Bundle 'tomtom/templator_vim'
Bundle 'tomtom/tskeleton_vim'
Bundle 'tomtom/tskeletons'
Bundle 'aperezdc/vim-template'
Bundle 'motemen/git-vim'
Bundle 'shemerey/vim-project'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'Raimondi/delimitMate'
Bundle 'biruh/vim-aspnet'
Bundle 'mklabs/vim-backbone'
Bundle 'oranget/vim-csharp.git'
Bundle 'sickill/coloration'
Bundle 'hokaccha/vim-html5validator'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bronson/vim-visual-star-search'
Bundle 'sukima/xmledit'
Bundle 'davidhalter/jedi-vim'
Bundle 'Chiel92/vim-autoformat'
Bundle 'jakobwesthoff/argumentrewrap'
Bundle 'xolox/vim-misc'
Bundle 'nosami/Omnisharp'
Bundle 'mileszs/ack.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'gcmt/taboo.vim'
Bundle 'nelstrom/vim-americanize'
Bundle 'rkulla/pydiction'
Bundle 'quentindecock/vim-cucumber-align-pipes'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'einars/js-beautify'
Bundle 'elzr/vim-json'
Bundle 'vim-scripts/ScrollColors'
Bundle 'junegunn/vim-easy-align'

"colors
Bundle 'primitivorm/vim-proman-theme'
Bundle 'sjl/badwolf'
Bundle 'sickill/vim-monokai'
Bundle 'sickill/vim-sunburst'
Bundle 'w0ng/vim-hybrid'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'Rykka/galaxy.vim'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'vim-scripts/Liquid-Carbon'
Bundle 'vim-scripts/PyChimp'
Bundle 'greyblake/vim-preview'
Bundle 'vim-scripts/pep8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'sontek/rope-vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'fs111/pydoc.vim.git'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-perl/vim-perl'
Bundle 'kablamo/VimDebug'

" vim-scripts repos
Bundle 'c.vim'
Bundle 'L9'
Bundle 'genutils'
Bundle 'CSApprox'
Bundle 'FuzzyFinder'
Bundle 'AutoComplPop'
Bundle 'dbext.vim'
Bundle 'DrawIt'
Bundle 'DfrankUtil'
Bundle 'ShowMarks'
Bundle 'IndexedSearch'
Bundle 'indenthtml.vim'
Bundle 'bash-support.vim'
Bundle 'SQLUtilities'
Bundle 'SQLComplete.vim'
Bundle 'sqlserver.vim'
Bundle 'quickfixsigns'
Bundle 'SearchComplete'
Bundle 'hexHighlight.vim'
Bundle 'grep.vim'
Bundle 'Decho'
Bundle 'refactor'
"issue: install pywin32-214.win32-py2.7.exe
"http://code.google.com/p/vim-visual-studio/issues/detail?id=2
"copy C:\Python27\Lib\site-packages\pywin32_system32 to C:\Python27
"http://sourceforge.net/projects/pywin32/files/pywin32/Build%20214/
Bundle 'visual_studio.vim'
Bundle 'Word-Fuzzy-Completion'
Bundle 'AutoAlign'
Bundle 'multiselect'
Bundle 'Thesaurus'
Bundle 'slimv.vim'
Bundle 'ccimpl.vim'
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
set nrformats+=alpha
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
"set wildoptions=auto
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
if exists("&wildignorecase")
    set wildignorecase
endif

" first full match
set visualbell " don't beep
set noerrorbells " don't beep
"set cmdheight=5    "especify the height of cmd
set noshowmode "show current mode
set showcmd " show (partial) command in the last line of the screen
" this also shows visual selection info
" set nomodeline " disable mode lines (security measure)
set modeline
"set ttyfast " always use a fast terminal
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
"establece el esquema de colores
if has('gui_running')
    "show tabs always = 2
    set showtabline=1
    "max num of tabs
    set tabpagemax=15
    hi CursorLine guibg=#e6e6fa
    hi CursorColumn guibg=#e6e6fa
    set guifont=Consolas_for_Powerline_FixedD:h10:cANSI
    "set guifont=Monaco:h9:cANSI
    "set guifont=Ubuntu_Mono_for_VimPowerline:h11:cANSI
    "set guifont=Menlo_for_Powerline:h10:cANSI
    "set guifont=Ubuntu_Mono_for_Powerline:h11:cANSI
    " switch syntax highlighting on, when the terminal has colors
    syntax on
    "syntax enable
else
    hi CursorLine guibg=Gray40
    hi CursorColumn guibg=Gray40
endif

"set colorscheme
"https://github.com/primitivorm/vim-proman-theme
set background=dark
colorscheme proman
"colorscheme distinguished
"colorscheme solarized

"habilita soporte para plugins
filetype plugin on
"muestra numeros de linea del archivo
set nu
"set rnu "relativenumber
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set nowrap
set linebreak "lbr
"if has('linebreak')
"let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
"endif
set showbreak=...
"set textwidth=69
set textwidth=125
set colorcolumn=125
"habilita sangrado inteligente
set smartindent
"sangrado automatico
"set ai
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
set scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
"change tabs to spaces
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
"set virtualedit=all "allow the cursor to go in to "invalid" places
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
set gdefault " search/replace "globally" (on a line) by default
"Resalta la { o ) que estamos cerrando (sm)
"set showmatch
"Mostrar la posicion del cursor en todo momento
set ruler
"mat
set matchtime=3
set matchpairs+=<:>     "specially for html

" }}}

" Folding rules {{{
set foldenable " enable folding
set foldcolumn=1 " add a fold column
"set foldmethod=marker " detect triple-{ style fold markers
set foldmethod=syntax
set foldnestmax=3
set foldlevel=3
set foldlevelstart=3 " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which commands trigger auto-unfold
""http://vim.wikia.com/wiki/Customize_text_for_closed_folds
"" Set a nicer foldtext function
"set foldtext=MyFoldText()
"function! MyFoldText()
    "let line = getline(v:foldstart)
    "if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
        "let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
        "let linenum = v:foldstart + 1
        "while linenum < v:foldend
            "let line = getline( linenum )
            "let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
            "if comment_content != ''
                "break
            "endif
            "let linenum = linenum + 1
        "endwhile
        "let sub = initial . ' ' . comment_content
    "else
        "let sub = line
        "let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
        "if startbrace == '{'
            "let line = getline(v:foldend)
            "let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
            "if endbrace == '}'
                "let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
            "endif
        "endif
    "endif
    "let n = v:foldend - v:foldstart + 1
    "let info = " " . n . " lines"
    "let sub = sub . "                                                          "
    "let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
    "let fold_w = getwinvar( 0, '&foldcolumn' )
    "let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
    "return sub . info
"endfunction
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
"set undofile " keep a persistent backup file

"au
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType c,cpp,h set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" convert tabs to spaces before writing file
autocmd! BufWritePre *.cs set expandtab | retab!

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
"remarcado de lineas speciales
"guifg=#F8F8FF
"Added to coloscheme proman
"highlight SpecialKey guifg=#E6E6FA ctermfg=192
"highlight NonText guifg=#E6E6FA ctermfg=192
"muestra los caracteres ocultos y los remplaza por los establecidos
set list
set listchars=tab:▸\-,trail:·,eol:¬,extends:→,precedes:←,nbsp:×
set mouse=a " enable using the mouse if terminal emulator
"set mousemodel=extend
set mousemodel=popup_setpos
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions+=b  "remove right-hand scroll bar
"tab style like terminal
"set guioptions-=e
"let g:gui_fonts = ['Monospace 10', 'Lucida Console 10', 'Courier New 10']
"let g:gui_colors = ['ego', 'corporation', 'github', 'satori', 'sienna']
"customize tab color
hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi Title ctermfg=LightBlue ctermbg=Magenta
" }}}

" Spell {{{
"habilita corrector ortografico
set nospell "active spell check
set spelllang=es_MX "Carga el diccionario en o los lenguajes que necesitemos
"limit the number of suggested words
set spellsuggest=best,10
set dictionary+=~/vimfiles/spell/es_MX.dic
set dictionary+=~/vimfiles/spell/en_US.dic
"set file for new words
set spellfile=~/vimfiles/spell/dict.add
"enable matchit plugin
"runtime macros/matchit.vim
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
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeQuitOnOpen        = 0
let g:NERDTreeMouseMode         = 2
let NERDTreeShowHidden=1
"let g:NERDTreeMapOpenInTab   = 't'
"let g:NERDTreeMapOpenInTab   = '<2-LeftMouse>'
"let g:NERDTreeMapOpenInTab='<2-LeftMouse>'
"let g:NERDTreeMapOpenInTabSilent = 'T'
"the working directory is always the one where the active buffer is located.
"let g:NERDTreeMapActivateNode = '<2-LeftMouse>'
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
"highlighting for flags of file
hi NERDTreeFlag guifg=#ff0000 ctermfg=160 guibg=#e3d2d2 ctermbg=7

"------------------------------------------------------
" }}}

" NERDTree-Tabs {{{
"------------------------------------------------------
"https://github.com/jistr/vim-nerdtree-tabs
"------------------------------------------------------
"let g:nerdtree_tabs_open_on_gui_startup    = 1 "default 1
let g:nerdtree_tabs_open_on_console_startup = 1 "default 0
"let g:nerdtree_tabs_no_startup_for_diff    = 1 "default 1
let g:nerdtree_tabs_smart_startup_focus     = 2  "default 1
"let g:nerdtree_tabs_open_on_new_tab        = 1   "default 1
"let g:nerdtree_tabs_meaningful_tab_names   = 1 "default 1
"let g:nerdtree_tabs_autoclose              = 1 "default 1
let g:nerdtree_tabs_synchronize_view        = 0     "default 1
"let g:nerdtree_tabs_synchronize_focus      = 1   "default 1
let g:nerdtree_tabs_focus_on_files          = 1      "default 0
"let g:nerdtree_tabs_startup_cd             = 1   "default 1
"------------------------------------------------------
" }}}

" Tagbar {{{
"---------------------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
"file to find tags
set tags=tags,./tags
"to specify one or more file extensions, which Vim will attempt to use when looking up a filename with the gf
set suffixesadd+=.cs
"set suffixesadd+=.aspx
"set suffixesadd+=.aspx.cs
"set suffixesadd+=.js
"set suffixesadd+=.htm
"set suffixesadd+=.sql

let g:tagbar_width     = 25    "default 40
let g:tagbar_compact   = 1     "default 0
let g:tagbar_foldlevel = 2    "default 99

"let g:tagbar_ctags_bin = $HOME . '\vimfiles\bin\ctags.exe'
let g:tagbar_ctags_bin = 'ctags'

"let g:tagbar_expand          = 1   "default 0
"let g:tagbar_sort            = 0  "default 1
"let g:tagbar_show_visibility = 1
"let g:tagbar_autoshowtag     = 1   "default 0
"let g:tagbar_autoclose       = 1   "default 0
"let g:tagbar_iconchars       = ['+', '-']    "default ['+', '-']
"let g:tagbar_singleclick     = 1   "default 0
"let g:tagbar_indent          = 1   "default 2
let g:tagbar_autofocus        = 1   "default 0

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
"" MiniBufExpl Colors
"hi MBEVisibleActive guifg=#000080 guibg=fg gui=bold cterm=bold
"hi MBEVisibleNormal guifg=#009999 guibg=fg gui=bold cterm=bold
"hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
"hi MBEVisibleChanged guifg=#F1266F guibg=fg
"hi MBEChanged guifg=#ff0000 guibg=fg
"hi MBENormal guifg=#696969 guibg=fg
"------------------------------------------------------
" }}}

"" CoffeScript {{{
""---------------------------------------------------------
""https://gist.github.com/2901844
""---------------------------------------------------------

"let g:tagbar_type_coffee = {
"\ 'ctagstype' : 'coffee',
"\ 'kinds'    : [
"\ 'c:classes',
"\ 'm:methods',
"\ 'f:functions',
"\ 'v:variables',
"\ 'f:fields',
"\ ]
"\ }

"" Posix regular expressions for matching interesting items. Since this will
"" be passed as an environment variable, no whitespace can exist in the options
"" so [:space:] is used instead of normal whitespaces.
"" Adapted from: https://gist.github.com/2901844
"let s:ctags_opts = '
"\ --langdef=coffee
"\ --langmap=coffee:.coffee
"\ --regex-coffee=/(^|=[[:space:]])*class[[:space:]]([A-Za-z]+\.)*([A-Za-z]+)([[:space:]]extends[[:space:]][A-Za-z.]+)?$/\3/c,class/
"\ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?@?([A-Za-z.]+):.*[-=]>.*$/\3/m,method/
"\ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?([A-Za-z.]+)[[:space:]]+=.*[-=]>.*$/\3/f,function/
"\ --regex-coffee=/^[[:space:]]*([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/v,variable/
"\ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/f,field/
"\ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+):[^->\n]*$/\1/f,staticField/
"\ --regex-coffee=/^[[:space:]]*([A-Za-z.]+):[^->\n]*$/\1/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@([A-Za-z.]+)/\2/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){0}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){1}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){2}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){3}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){4}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){5}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){6}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){7}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){8}/\3/f,field/
"\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){9}/\3/f,field/'

"let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')

""---------------------------------------------------------
"" }}}

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
  set undodir=~/tmp,/tmp
  let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
endif
"---------------------------------------------------------
" }}}

" Syntastic {{{
"--------------------------------------------------------
" https://github.com/scrooloose/syntastic
"--------------------------------------------------------
autocmd FileType *.cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m
autocmd FileType *.cs set makeprg=msbuild\ \"%\"\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ $*
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'php', 'cs', 'python', 'lisp', 'json', 'js', 'html', 'xhtml', 'xml'],
            \ 'passive_filetypes': ['puppet'] }

"let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='E'
let g:syntastic_style_error_symbol='S'
let g:syntastic_warning_symbol='W'
let g:syntastic_style_warning_symbol='S'
let g:syntastic_always_populate_loc_list=1
"configuring for cs files
"require mono mcs parser
"let g:syntastic_cs_checkers=['mcs']
"let g:syntastic_cs_exe="mcs.exe"
"let g:syntastic_cs_args="--parse"
"configuring for python files
let g:syntastic_python_checkers=['pylint']
if !&diff
    let g:syntastic_check_on_open=1
endif
"quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
"--------------------------------------------------------
"default signs
" syntastic_error_symbol - For syntax errors, defaults to '>>'
" syntastic_style_error_symbol - For style errors, defaults to 'S>'
" syntastic_warning_symbol - For syntax warnings, defaults to '>>'
" syntastic_style_warning_symbol - For style warnings, defaults to 'S>'
"et g:syntastic_error_symbol=''
"let g:syntastic_warning_symbol=''
"--------------------------------------------------------
" }}}

" Dbext {{{
"---------------------------------------------------------
"http://www.vim.org/scripts/script.php?script_id=356
"https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
"---------------------------------------------------------
"connect to sql server instance
let g:dbext_default_profile_sql_des = 'type=SQLSRV:srvname=10.48.68.8:dbname=amdes:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_desvw = 'type=SQLSRV:srvname=10.48.68.8\SQL2K8:dbname=amdesvw:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qa = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqavw:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qa40 = 'type=SQLSRV:srvname=10.48.95.40:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw40 = 'type=SQLSRV:srvname=10.48.95.40:dbname=amqavw:user=espejopruebas:passwd=12345678'

"let g:dbext_default_profile = 'sql_qavw'

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

" Powerline {{{
"---------------------------------------------------------
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
"for testing version
"set rtp+=~/vimfiles/bundle/powerline/powerline/bindings/vim
" set laststatus=2
"let g:Powerline_theme='long'
if &background=="light"
  let g:Powerline_colorscheme='solarized256_dark'
else
  let g:Powerline_colorscheme='solarized256_light'
endif
"---------------------------------------------------------
" }}}

" airline {{{
"https://github.com/bling/vim-airline
"let g:airline_powerline_fonts = 1
"}}}

" vim-session {{{
"---------------------------------------------------------
"https://github.com/xolox/vim-session
"---------------------------------------------------------
let g:session_command_aliases = 1
"let g:session_autosave='no'
"---------------------------------------------------------
" }}}

" Showmarks {{{
"---------------------------------------------------------
"http://www.vim.org/scripts/script.php?script_id=152
"https://github.com/vim-scripts/ShowMarks
"---------------------------------------------------------
let g:showmarks_enable=1
"---------------------------------------------------------
" }}}

" IndentGuides {{{
"---------------------------------------------------------
"https://github.com/nathanaelkane/vim-indent-guides
"---------------------------------------------------------
let g:indent_guides_start_level=1
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"setting custom indent colors
let g:indent_guides_auto_colors=1
"run at startup
let g:indent_guides_enable_on_vim_startup=1
" Indentation style color guides
"hi IndentGuidesOdd ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=black
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey
" Treat files ending in .thpl as Perl:
"au BufRead,BufNewFile *.thpl set filetype=perl
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
let g:tskelDir=$HOME . '/vimfiles/skeletons/'
let g:tskelUserName='Ing. Primitivo R. Montero'
let g:tskelUserEmail='cibercafe_montero@hotmail.com'
"autocmd BufNewFile /here/*.suffix TSkeletonSetup othertemplate.suffix
autocmd BufNewFile *.py TSkeletonSetup skeleton.py
autocmd BufNewFile *.cs TSkeletonSetup skeleton.cs
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
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=#ADFF2F
let g:mta_filetypes = {
            \ 'htm' : 1,
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'cs' : 1,
            \ 'aspx' : 1,
            \ 'sql' : 1,
            \}
"Highlighting braces parentheses
hi MatchParen cterm=none ctermfg=black ctermbg=lightgreen guifg=black guibg=#ADFF2F
"---------------------------------------------------------
" }}}

" Minimap {{{
"---------------------------------------------------------
"https://github.com/koron/minimap-vim
"---------------------------------------------------------
"let g:session_autoload = 'no'
let g:session_autoload = 'yes'
"---------------------------------------------------------
" }}}

" vimtlib {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/tomtom/vimtlib/blob/master/INSTALL.TXT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for template generator add
"runtime ~/bundle/vundle/tplugin_vim/macros/tplugin.vim
"run :TPluginScan!
set runtimepath+=~/vimfiles/bundle/vundle/vimtlib/
let g:tplugin_autoload=1
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
"let guifontpp_size_increment=1     "default 1
let guifontpp_smaller_font_map="<M-Down>"
let guifontpp_larger_font_map="<M-Up>"
let guifontpp_original_font_map="<M-=>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Tab line {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/mkitt/tabline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi TabLine   ctermfg=Black  ctermbg=Green   cterm=NONE
"hi TabLineFill ctermfg=Black  ctermbg=Green   cterm=NONE
"hi TabLineSel  ctermfg=White  ctermbg=DarkBlue  cterm=NONE
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
"let g:scMenuPlace      =40
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

"" vim-auto-save {{{
""https://github.com/907th/vim-auto-save
let g:auto_save = 1  " Disable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
"" }}}

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
"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview=0
"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
"don't autoselect first item in omnicomplete, show if only one item (for preview)
"set completeopt=longest,menuone,preview
set completeopt=menuone,menu,longest
let g:Omnisharp_highlight_user_types=1
"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
"setlocal omnifunc=OmniSharp#Complete
autocmd FileType cs set omnifunc=OmniSharp#Complete
"---------------------------------------------------------
" }}}

" SuperTab {{{
"---------------------------------------------------------
let g:SuperTabDefaultCompletionType='context'
"let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'
"let g:SuperTabDefaultCompletionTypeDiscovery=["&completefunc:<c-x><c-n>","&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletionTypeDiscovery=["&completefunc:<c-x><c-u>","&omnifunc:<c-x><c-o>"]
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
"let g:SuperTabLongestHighlight=1
"defaults
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
"let g:SuperTabMappingForward = '<C-x><C-n>'
"let g:SuperTabMappingBackward = '<C-x><C-p>'

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
"https://github.com/msanders/snipmate.vim
"------------------------------------------------------
let g:snipMate = {}
"especifica la ruta en donde se encuentran los snippets para el plugin snipMate
"let g:snipMate['snippet_dirs'] = funcref#Function('return ["~/vimfiles/snippets"]')
"let g:snipMateSources = {}
"let g:snipMateSources['default'] = funcref#Function('snipMate#DefaultPool')
"set runtimepath?
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['cs'] = 'cs'
let g:snipMate.scope_aliases['sql'] = 'sql'
"g:snippets_dir is deprecated
"let g:snippets_dir='~/.vim/bundle/vim-snippets/snippets/'
"let g:snippets_dir+='~/vimfiles/snippets/'
"my personal snippets
"set runtimepath+=~/vimfiles
"------------------------------------------------------
" }}}

"" Ultisnip {{{
""------------------------------------------------------
""https://github.com/vim-scripts/UltiSnips
""------------------------------------------------------
"let g:UltiSnips = {}

"let g:UltiSnips.snipmate_ft_filter = {
"\ 'default' : {'filetypes': ["FILETYPE"] },
"\ 'ruby'  : {'filetypes': ["ruby", "ruby-rails", "ruby-1.9"] }
"\ }
""------------------------------------------------------
"" }}}

" AutoComplPop {{{
let g:acp_behaviorKeywordLength = 1
let g:acp_completeOption        = '.,w,b,k,t,i'
"let g:acp_behaviorKeywordCommand = '\<C-x>\<C-o>'
"let g:acp_ignorecaseOption      = 1
" }}}

" vim-autoformat {{{
" https://github.com/Chiel92/vim-autoformat
"---------------------------------------------------------
let g:formatprg_cs = "astyle"
let g:formatprg_args_cs = "--mode=cs --style=ansi -pcHs4"
let g:formatprg_args_expr_cs = '"--mode=cs --style=ansi -pcHs".&shiftwidth'
set equalprg=astyle
autocmd BufWritePre *.cs :Autoformat
"autocmd BufWritePre *.html :Autoformat
"autocmd BufWritePre *.htm :Autoformat
"autocmd BufWritePre *.aspx :Autoformat
"autocmd BufWritePre *.xml :Autoformat
"autocmd BufWritePre *.sql :Autoformat
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

"slimv {{{
"https://github.com/vim-scripts/slimv.vim
"let g:slimv_lisp='C:\Program Files (x86)\clisp-2.49\clisp.exe'
let g:slimv_lisp='C:\lispbox-0.7\ccl-1.6-windowsx86\wx86cl64.exe'
let g:slimv_swank_cmd = '!start "C:\lispbox-0.7\ccl-1.6-windowsx86\wx86cl64.exe" -l "C:\lispbox-0.7\slime-20110205.092829\start-swank.lisp"'
"}}}

" pep8 {{{
"https://github.com/vim-scripts/pep8
let g:pep8_map='<F8>'
"}}}
