"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source {{{
"https://github.com/tpope/tpope/blob/master/.vimrc
"archivos de configuracion auxiliares para windows
" source $HOME/vimfiles/mswin.vim
" Key mappings, functions, autocommands
source $HOME/vimfiles/keymap.vim
" Source the vimrc file after saving it
let $MYVIMRC=expand($HOME.'/vimfiles/_vimrc')
"if has("autocmd")
  "autocmd bufwritepost _vimrc source $MYVIMRC
"endif
"}}}

" Pathogen {{{
"------------------------------------------------------
"pathogen plugin:
"https://github.com/tpope/vim-pathogen
"------------------------------------------------------
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"------------------------------------------------------
" }}}

" Bundle {{{
"------------------------------------------------------
"vundle
"https://github.com/gmarik/vundle
"------------------------------------------------------
set nocompatible " be iMproved
"filetype off " required!

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()
"" let Vundle manage Vundle
"" required!
Bundle 'gmarik/vundle'

" My Bundles here:
 "
" original repos on github
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mattn/gist-vim'
Bundle 'othree/html5.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
"Bundle 'tobyS/skeletons.vim'
Bundle 'majutsushi/tagbar'
Bundle 'shemerey/vim-indexer'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'mattn/webapi-vim'
Bundle 'Townk/vim-autoclose'
"Bundle 'Shougo/neosnippet'
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
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Shougo/vimproc'
Bundle 'xolox/vim-session'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'Lokaltog/powerline-fonts.git'
Bundle 'wavded/vim-stylus'
Bundle 'heaths/vim-msbuild'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rykka/colorv.vim'
Bundle 'AndrewRadev/sideways.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'leshill/vim-json'
Bundle 'rking/ag.vim'
Bundle 'mutewinter/vim-css3-syntax'
"Bundle 'jwu/exvim'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'tsaleh/vim-matchit'
Bundle 'honza/vim-snippets'
"alow template files
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tplugin_vim'
Bundle 'tomtom/stakeholders_vim'
Bundle 'tomtom/templator_vim'
"
Bundle 'motemen/git-vim'
Bundle 'shemerey/vim-project'
Bundle 'ghewgill/vim-scmdiff'
Bundle 'garbas/vim-snipmate'
Bundle 'kana/vim-textobj-user'
Bundle 'Raimondi/delimitMate'
Bundle 'biruh/vim-aspnet'
Bundle 'mklabs/vim-backbone'
Bundle 'oranget/vim-csharp.git'
Bundle 'sickill/coloration'
Bundle 'wikitopian/hardmode'
"Bundle 'bkad/CamelCaseMotion'
Bundle 'koron/minimap-vim'
Bundle 'sjl/splice.vim'
Bundle 'hokaccha/vim-html5validator'
Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'zhaocai/GoldenView.Vim'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Twinside/vim-codeoverview'

"colors
Bundle 'sjl/badwolf'
Bundle 'sickill/vim-monokai'
Bundle 'sickill/vim-sunburst'
Bundle 'w0ng/vim-hybrid'
Bundle 'stephenmckinney/vim-solarized-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'xuhdev/SingleCompile'
Bundle 'nelstrom/vim-mac-classic-theme'

"Bundle 'icsharpcode/NRefactory'
"Bundle 'tomtom/quickfixsigns_vim'
"Bundle 'jeetsukumaran/vim-buffergator'
"Bundle 'spf13/PIV'
"Bundle 'me-vlad/python-syntax.vim'
"Bundle 'chrisbra/SaveSigns.vim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'c9s/perlomni.vim'
"Bundle 'Rip-Rip/clang_complete'
"Bundle 'esukram/autocomplpop.vim'
"Bundle 'tobyS/pdv'
"Bundle 'mileszs/ack.vim'
"Bundle 'drmingdrmer/xptemplate'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-abolish'
"Bundle 'tpope/vim-commentary'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-bundler'
"Bundle 'tpope/gem-ctags'
"Bundle 'bryanthankins/vim-aspnetide'
"Bundle 'skalnik/vim-vroom'
"Bundle 'mattsacks/vim-symbols'
"Bundle 'vim-ruby/vim-ruby'
"Bundle 'greyblake/vim-preview'
"Bundle 'jeetsukumaran/vim-buffergator'
"Bundle 'benizi/perl-support.vim'
"Bundle 'nosami/Omnisharp'
"Bundle 'alfredodeza/pytest.vim'
"Bundle 'xolox/vim-lua-ftplugin'
"Bundle 'mutewinter/tomdoc.vim'
"Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'gotcha/vimpdb'
"Bundle 'mattsacks/vim-complete'
"Bundle 'vim-perl/vim-perl'
"Bundle 'jc00ke/vim-tomdoc'
"Bundle 'davidoc/taskpaper.vim'
"Bundle 'xolox/vim-lua-inspect'
"Bundle 'kablamo/VimDebug'
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'kevinw/pyflakes-vim'
"Bundle 'klen/python-mode'
"Bundle 'rorymckinley/vim-symbols-strings'
"Bundle 'goldfeld/vim-seek'
"Bundle 'tek/vim-quickbuf'

" vim-scripts repos
Bundle 'c.vim'
Bundle 'L9'
Bundle 'genutils'
Bundle 'CSApprox'
Bundle 'FuzzyFinder'
Bundle 'AutoComplPop'
Bundle 'dbext.vim'
Bundle 'DrawIt'
Bundle 'IComplete'
Bundle 'DfrankUtil'
Bundle 'ShowMarks'
Bundle 'ZoomWin'
Bundle 'IndexedSearch'
Bundle 'Rainbow-Parenthesis'
"Bundle 'keepcase.vim'
Bundle 'scratch.vim'
Bundle 'indenthtml.vim'
Bundle 'bash-support.vim'
"Bundle 'taglist.vim'
Bundle 'SQLUtilities'
Bundle 'quickfixsigns'
Bundle 'vcscommand.vim'
Bundle 'SearchComplete'
Bundle 'hexHighlight.vim'
Bundle 'multiselect'
Bundle 'netrw.vim'
Bundle 'ftpsync'
Bundle 'grep.vim'
Bundle 'Decho'

"Bundle 'YankRing.vim'
"Bundle 'QuickBuf'
"Bundle 'VB.NET-Syntax'
"Bundle 'VimClojure'
"Bundle 'pydoc.vim'
"Bundle 'AutoTag'
"Bundle 'visual_studio.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
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

" Highlighting {{{
if &t_Co > 2 || has('gui_running')
	" switch syntax highlighting on, when the terminal has colors
	syntax on
endif
" }}}

" Formatting {{{
"http://vim.wikia.com/wiki/VimTip30
set nrformats+=alpha
set fileformats="unix,dos,mac"
set formatoptions=tcq	"fo
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
set autoread
set directory=~/vimfiles/tmp,~/tmp,/tmp
" store swap files in one of these directories
" (in case swapfile is ever turned on)
set viminfo='20,\"80 " read/write a .viminfo file, don't store more
" than 80 lines of registers
set wildmenu " make tab completion for files/buffers act like bash
set wildmode=list:full " show a list when pressing tab and complete
" first full match
set visualbell " don't beep
set noerrorbells " don't beep
set cmdheight=5		"especify the height of cmd
set noshowmode
set showcmd " show (partial) command in the last line of the screen
" this also shows visual selection info
" set nomodeline " disable mode lines (security measure)
set modeline
"set ttyfast " always use a fast terminal
" }}}

" Encoding {{{
" use utf8 encoding for vim files and for default file encoding
set fenc=utf-8
set encoding=utf-8
setglobal fileencoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,iso-8859-15,ucs-bom
" }}}

" Gui {{{

syntax enable

set cursorline "cursorcolumn "underline the current line, for quick orientation
"establece el esquema de colores
if has('gui_running')
	set background=light
	hi CursorLine guibg=#e6e6fa
	hi CursorColumn guibg=#e6e6fa
	set guifont=Consolas_for_Powerline_FixedD:h10:cANSI
else
	set background=dark
	hi CursorLine guibg=Gray40 guifg=#ffffff
	hi CursorColumn guibg=Gray40 guifg=#ffffff
endif

"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
colorscheme proman
"colorscheme Monokai
"colorscheme eclipse
"colorscheme badwolf
"colorscheme mustang
"colorscheme wombat
"colorscheme github
"colorscheme smyck
"colorscheme railscasts
"colorscheme bandit "like visual studio
"colorscheme blackboard "like visual studio
"colorscheme Sunburst
"colorscheme default

"habilita plugin para sangrado de lineas
filetype plugin indent on
"habilita soporte para plugins
filetype plugin on
"muestra numeros de linea del archivo
set nu
"set rnu "relativenumber
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set wrap
set linebreak	"lbr
"if has('linebreak')
	"let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
"endif
set showbreak=...
"set textwidth=79
set textwidth=85
set colorcolumn=100
"habilita sangrado inteligente
set smartindent
"sangrado automatico
set ai
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
set scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
set noexpandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set virtualedit=all " allow the cursor to go in to "invalid" places
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
"Use Mark plugin to highlight selected word
set hlsearch
"jumps to search word as you type (annoying but excellent)
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch " show search matches as you type
"Caso insesitivo para busquedas es decir no distingue mayusculas y minusculas
set ignorecase
"case-sensitive if search contains an uppercase character
set smartcase
set gdefault " search/replace "globally" (on a line) by default
set showmatch
set mat=5
"estable el modo de pliegue (folding)
"set foldmethod=indent "fold based on indent
set foldmethod=syntax "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
"set nofoldenable "dont fold by default
set foldlevel=1 "this is just what i Use
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen
" au FileType cs set omnifunc=syntaxcomplete#Complete

"if has("gui_running")
  "" GUI is running or is about to start.
  "" Maximize gvim window.
  "set lines=999 columns=999
"else
  "" This is console Vim.
  "if exists("+lines")
    "set lines=50
  "endif
  "if exists("+columns")
    "set columns=100
  "endif
"endif

" }}}

" Folding rules {{{
set foldenable " enable folding
set foldcolumn=2 " add a fold column
set foldmethod=marker " detect triple-{ style fold markers
set foldlevelstart=99 " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which commands trigger auto-unfold
"http://vim.wikia.com/wiki/Customize_text_for_closed_folds
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
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
set hidden " hide buffers instead of closing them this
" means that the current buffer can be put
" to background without being written; and
" that marks and undo history are preserved
set switchbuf=useopen " reveal already opened files from the
" quickfix window instead of opening new
" buffers
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
if v:version >= 730
	set undofile " keep a persistent backup file
	set undodir=~/vimfiles/tmp,~/tmp,/tmp
endif

if (&diff==0)
	:autocmd BufReadPost * tab ball
endif
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
au FileType c,cpp,h set omnifunc=ccomplete#Complete
au FileType java set omnifunc=javacomplete#Complete
"For the most accurate but slowest result, set the syntax synchronization method to fromstart
autocmd BufEnter * :syntax sync fromstart
"suffixes added to command gf
set suffixesadd+=.c,.cpp,.cs,.js,.css,.html,.xml,.rb,.h,.aspx,.java,.py,.lisp,.perl
"vbnet highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"remarcado de lineas speciales
"guifg=#F8F8FF
highlight SpecialKey guifg=#E6E6FA ctermfg=192
highlight NonText guifg=#E6E6FA ctermfg=192
"muestra los caracteres ocultos y los remplaza por los establecidos
set list
"set listchars=tab:▸\-,trail:·,eol:¬,extends:→,precedes:←,nbsp:×
set listchars=tab:\|-,trail:-,eol:¬,extends:→,precedes:←,nbsp:×
set mouse=a " enable using the mouse if terminal emulator
"set guioptions-=m	"remove menu bar
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions+=b  "remove right-hand scroll bar
"let g:gui_fonts = ['Monospace 10', 'Lucida Console 10', 'Courier New 10']
"let g:gui_colors = ['ego', 'corporation', 'github', 'satori', 'sienna']
" indentline
let g:indentLine_char = '|'
"customize tab color
hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi Title ctermfg=LightBlue ctermbg=Magenta
" }}}

" Spell {{{
"habilita corrector ortografico
"set spell 	"active spell check
set spelllang=en "Carga el diccionario en o los lenguajes que necesitemos
	"set spell "Activa el corrector ortogr�fico en tiempo real :set nospell desactiva
	"will add dictionary scanning
set complete+=k
set dictionary+=~/spell/en.ascii.spl
set dictionary+=~/spell/en.ascii.sug
set dictionary+=~/spell/en.latin1.spl
set dictionary+=~/spell/en.latin1.sug
set dictionary+=~/spell/en.utf-8.spl
set dictionary+=~/spell/en.utf-8.sug
"enable matchit plugin
"runtime macros/matchit.vim
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Thesaurus {{{
"------------------------------------------------------
"thesaurus plugin
"http://www.vim.org/scripts/script.php?script_id=2528
"https://github.com/vim-scripts/Thesaurus
"------------------------------------------------------
set thesaurus+=~\bundle\mthes10\mthesaur.txt
set thesaurus+=~\bundle\mthes10\roget13a.txt
"------------------------------------------------------
"}}}

" Ragtag {{{
"------------------------------------------------------
"ragtag
"https://github.com/tpope/vim-ragtag
"http://www.vim.org/scripts/script.php?script_id=1896
"------------------------------------------------------
 let g:ragtag_global_maps = 1
"------------------------------------------------------
"}}}

" SnipMate {{{
"------------------------------------------------------
"c compiler
" au FileType C set makeprg=gcc\ %
" au FileType Cpp set makeprg=g++\ %
"------------------------------------------------------
"snipMate plugin
"https://github.com/msanders/snipmate.vim
"------------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['cs'] = 'cs'
"especifica la ruta en donde se encuentran los snippets para el plugin snipMate
let g:snippets_dir="$HOME\\vimfiles\\bundle\\snipmate\\snippets\\"
"------------------------------------------------------
" }}}

" Ultisnip {{{
"------------------------------------------------------
"Ultisnip
"https://github.com/vim-scripts/UltiSnips
"------------------------------------------------------
let g:UltiSnips = {}

let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE"] },
            \ 'ruby'    : {'filetypes': ["ruby", "ruby-rails", "ruby-1.9"] }
			\ }
"------------------------------------------------------
" }}}

" NERDTree {{{
"------------------------------------------------------
"NERDTree plugin
"https://github.com/scrooloose/nerdtree"
"------------------------------------------------------
"abre el plugin NERDTree al iniciar Vim
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"cerrar Vim si la unica ventana abierta es la de NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"custom settings
let g:NERDTreeBookmarksFile = expand($HOME.'/vimfiles/_NERDTreeBookmarks')
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMouseMode=2
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
	  \'tags', 'bin', 'obj','\.suo$','\.vspscc$']
"------------------------------------------------------
" }}}

" NERDTree-Tabs {{{
"------------------------------------------------------
"nerdtree-tabs
"https://github.com/jistr/vim-nerdtree-tabs
"------------------------------------------------------
"let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1 	"default 0"
"let g:nerdtree_tabs_no_startup_for_diff=1
let g:nerdtree_tabs_smart_startup_focus=2"		"default 1"
"let g:nerdtree_tabs_open_on_new_tab = 1
"let g:nerdtree_tabs_meaningful_tab_names = 1
"let g:nerdtree_tabs_autoclose = 1
"let g:nerdtree_tabs_synchronize_view = 1
"let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 1 		"default 0"
"let g:nerdtree_tabs_startup_cd = 1
let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'
"------------------------------------------------------
" }}}

" NERDcommenter {{{
"------------------------------------------------------
" NERDcommenter
" https://github.com/scrooloose/nerdcommenter
"------------------------------------------------------
" let NERDSpaceDelims=1
" map <Leader>/ <Plug>NERDCommenterToggle<CR>
" vmap <Leader>/ <Plug>NERDCommenterToggle<CR>
"------------------------------------------------------
" }}}

" MiniBufExpl {{{
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
" }}}

" EasyMotion {{{
"---------------------------------------------------------
"easymotion
"https://github.com/Lokaltog/vim-easymotion
"---------------------------------------------------------
"let g:EasyMotion_leader_key = '<Leader>e'
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade Comment
"---------------------------------------------------------
" }}}

" CtrlP {{{
"---------------------------------------------------------
"ctrlp
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
else
	let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
endif
"---------------------------------------------------------
" }}}

" Fugitive {{{
"--------------------------------------------------------
" fugitive
" http://www.vim.org/scripts/script.php?script_id=2975
" https://github.com/tpope/vim-fugitive
"--------------------------------------------------------
" }}}

" RainbowParentheses {{{
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
" }}}

" Syntastic {{{
"--------------------------------------------------------
" syntastic
" https://github.com/scrooloose/syntastic
"--------------------------------------------------------
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
\ 'active_filetypes': ['ruby', 'php'],
\ 'passive_filetypes': ['puppet'] }
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

"Tabular {{{
"--------------------------------------------------------
" tabular
" https://github.com/godlygeek/tabular
"--------------------------------------------------------
"--------------------------------------------------------
" }}}

"" Taglist {{{
""---------------------------------------------------------
""taglist
""http://www.vim.org/scripts/script.php?script_id=273
""http://ctags.sourceforge.net/
""http://vim.sourceforge.net/scripts/script.php?script_id=273
""http://sourceforge.net/projects/vim-taglist/files/
""http://ctags.sourceforge.net/ctags.html
""---------------------------------------------------------
"" Taglist variables
"" Display function name in status bar:
"let g:ctags_statusline=1
"" Automatically start script
"let generate_tags=1
"" Displays taglist results in a vertical window:
"let Tlist_Use_Horiz_Window=0
"":!which ctags -> tofindctalocation
"" Various Taglist diplay config:
"let Tlist_Use_Right_Window = 1
"let Tlist_Compact_Format = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_Ctags_Cmd = '"C:\cygwin\bin\ctags.exe"'
"let Tlist_Auto_Open = 1
""---------------------------------------------------------
"" }}}

"" Easytag {{{
""---------------------------------------------------------
""easytags
""https://github.com/xolox/vim-easytags
""---------------------------------------------------------
"let g:easytags_cmd = '"C:\cygwin\bin\ctags.exe"'
""let g:easytags_file = '"C:\Users\Proman02\vimfiles\tags"'
"let g:easytags_file = $HOME . '/vimfiles/tags'

"" let g:easytags_file = $HOME . '/tags'
""" search first in current directory then file directory for tag file
"set tags=tags,./tags
"let g:easytags_dynamic_files=1
"let g:easytags_always_enabled=0
"let g:easytags_on_cursorhold=0
"let g:easytags_auto_highlight=0
""---------------------------------------------------------
"" }}}

" Dbext {{{
"---------------------------------------------------------
"db ext plugin
"http://www.vim.org/scripts/script.php?script_id=356
"https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
"---------------------------------------------------------
"connect to sql server instance
let g:dbext_default_profile_sql_qa = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqa:user=espejopruebas:passwd=12345678'
let g:dbext_default_profile_sql_qavw = 'type=SQLSRV:srvname=10.48.68.8:dbname=amqavw:user=espejopruebas:passwd=12345678'
"---------------------------------------------------------
" }}}

" SQLUtilities {{{
"---------------------------------------------------------
"sql formatter
"http://www.vim.org/scripts/script.php?script_id=492
"https://github.com/vim-scripts/SQLUtilities
"---------------------------------------------------------
" }}}

" Tagbar {{{
"---------------------------------------------------------
"tagbar
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
autocmd VimEnter * nested :TagbarOpen
"let g:tagbar_ctags_bin= '"C:\cygwin\bin\ctags.exe"'
let g:tagbar_ctags_bin= '~\vimfiles\ctags58\ctags.exe'
let g:tagbar_width =30 		"default 40
"let g:tagbar_autoclose = 0
"let g:tagbar_autofocus = 0
let g:tagbar_compact = 1 		"default 0
let g:tagbar_expand = 0
let g:tagbar_sort = 0 	"default 1
let g:tagbar_indent = 1 	"default 2
"let g:tagbar_show_visibility = 1

	" CoffeScript {{{

	let g:tagbar_type_coffee = {
		\ 'ctagstype' : 'coffee',
		\ 'kinds'     : [
			\ 'c:classes',
			\ 'm:methods',
			\ 'f:functions',
			\ 'v:variables',
			\ 'f:fields',
		\ ]
	\ }

	" Posix regular expressions for matching interesting items. Since this will
	" be passed as an environment variable, no whitespace can exist in the options
	" so [:space:] is used instead of normal whitespaces.
	" Adapted from: https://gist.github.com/2901844
	let s:ctags_opts = '
	\ --langdef=coffee
	\ --langmap=coffee:.coffee
	\ --regex-coffee=/(^|=[[:space:]])*class[[:space:]]([A-Za-z]+\.)*([A-Za-z]+)([[:space:]]extends[[:space:]][A-Za-z.]+)?$/\3/c,class/
	\ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?@?([A-Za-z.]+):.*[-=]>.*$/\3/m,method/
	\ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?([A-Za-z.]+)[[:space:]]+=.*[-=]>.*$/\3/f,function/
	\ --regex-coffee=/^[[:space:]]*([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/v,variable/
	\ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/f,field/
	\ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+):[^->\n]*$/\1/f,staticField/
	\ --regex-coffee=/^[[:space:]]*([A-Za-z.]+):[^->\n]*$/\1/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@([A-Za-z.]+)/\2/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){0}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){1}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){2}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){3}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){4}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){5}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){6}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){7}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){8}/\3/f,field/
	\ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){9}/\3/f,field/'

	let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')
	" }}}
"---------------------------------------------------------
" }}}

" Powerline {{{
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
"let $VIM_INTELLISENSE="C:\\Program Files (x86)\\Vim\\Intellisense\\"
"let $VIM_INTELLISENSE="C:\\Program Files\\Vim\\Intellisense"
"let g:visual_studio_quickfix_errorformat='%.%#%*[0-9>]\ %#%f(%l)\ :\ %m'
"---------------------------------------------------------
" }}}

" Showmarks {{{
"---------------------------------------------------------
"Showmarks
"http://www.vim.org/scripts/script.php?script_id=152
"https://github.com/vim-scripts/ShowMarks
"---------------------------------------------------------
let g:showmarks_enable=1
"---------------------------------------------------------
" }}}

" IndentGuides {{{
"---------------------------------------------------------
"vim-indent-guides
"https://github.com/nathanaelkane/vim-indent-guides
"---------------------------------------------------------
"let g:indent_guides_start_level=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
"setting custom indent colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" Indentation style color guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey
"<Leader>ig 	->show guides
"---------------------------------------------------------
"
"---------------------------------------------------------
"vim-session
"https://github.com/xolox/vim-session
"---------------------------------------------------------
let g:session_command_aliases = 1
"---------------------------------------------------------
"
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
" }}}

"zencoding {{{
"---------------------------------------------------------
"zencoding
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
"badwolf
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

"skeletons {{{
"---------------------------------------------------------
"https://github.com/tobyS/skeletons.vim
"---------------------------------------------------------
"let g:skeletons_dir=$HOME . '/vimfiles/bundle/skeletons.vim/skeletons/'
"au BufNewFile * silent! 0r ~/vimfiles/bundle/skeletons.vim/skeletons/skeleton.%:e
"---------------------------------------------------------
"pdv
"https://github.com/tobyS/pdv
"---------------------------------------------------------
" }}}

" Pdv {{{
"---------------------------------------------------------
"let g:pdv_template_dir = $HOME ."/vimfiles/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
"---------------------------------------------------------
" }}}

" MRU {{{
"---------------------------------------------------------
"mru
"---------------------------------------------------------
let MRU_File = $HOME . '/vimfiles/_vim_mru_files'
"---------------------------------------------------------
"MatchTagAlways
"https://github.com/Valloric/MatchTagAlways
"---------------------------------------------------------
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=#ADFF2F
"highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=#1E90FF
let g:mta_filetypes = {
	\ 'html' : 1,
	\ 'xhtml' : 1,
	\ 'xml' : 1,
	\ 'jinja' : 1,
	\ 'cs' : 1,
	\}
"Highlighting braces parentheses
hi MatchParen cterm=none ctermfg=black ctermbg=lightgreen guifg=black guibg=#ADFF2F
"---------------------------------------------------------
" }}}

" Omn"isharp {{{
""---------------------------------------------------------
""Omnisharp
""https://github.com/nosami/Omnisharp
""---------------------------------------------------------
""This is the default value, setting it isn't actually necessary
"let g:OmniSharp_host = "http://localhost:80"
""Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1
""---------------------------------------------------------
"" }}}

" neocomplcache {{{
"---------------------------------------------------------
"neocomplcache
"https://github.com/Shougo/neocomplcache
"---------------------------------------------------------
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" " Use underscore completion.
" let g:neocomplcache_enable_underbar_completion = 1
" " Sets minimum char length of syntax keyword.
" let g:neocomplcache_min_syntax_length = 0
" " buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
" "let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" let g:neocomplcache_enable_auto_close_preview = 0
" " Define keyword, for minor languages
" if !exists('g:neocomplcache_keyword_patterns')
  " let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"---------------------------------------------------------
" }}}

" Minimap {{{
"---------------------------------------------------------
"Minimap
"https://github.com/koron/minimap-vim
"---------------------------------------------------------
 let g:session_autoload = 'no'
"---------------------------------------------------------
" }}}

" CodeOverview {{{
"---------------------------------------------------------
" CodeOverview
"http://www.vim.org/scripts/script.php?script_id=2888
"https://github.com/Twinside/vim-codeoverview
"---------------------------------------------------------
"let g:code_overview_autostart = 1
"let g:codeoverview_autoupdate = 1
"let g:codeOverviewMaxLineCount = 10000
"---------------------------------------------------------
" }}}

" HardMode {{{
"---------------------------------------------------------
"HardMode
"https://github.com/wikitopian/hardmode
"---------------------------------------------------------
 "autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
"---------------------------------------------------------
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtelib
"https://github.com/tomtom/vimtlib/blob/master/INSTALL.TXT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime ~/bundle/tplugin_vim/macros/tplugin.vim
set rtp+=~/bundle/tplugin_vim/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
