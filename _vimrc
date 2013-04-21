"https://github.com/tpope/tpope/blob/master/.vimrc
"archivos de configuracion auxiliares para windows
source $HOME/vimfiles/mswin.vim
" Key mappings, functions, autocommands
source $HOME/vimfiles/keymap.vim
set digraph

"pathogen plugin:
"https://github.com/tpope/vim-pathogen
"------------------------------------------------------
call pathogen#infect()
call pathogen#helptags()

"------------------------------------------------------
 "vundle 
 "https://github.com/gmarik/vundle
"------------------------------------------------------
set nocompatible " be iMproved
"filetype off " required!

set rtp+=~/vimfiles/bundle/vundle/
"let g:bundle_dir=$HOME.'/vimfiles/bundle/vundle/'
" let g:bundle_dir='/cygdrive/c/Users/Proman02/vimfiles/bundle/'
call vundle#rc()
 "" let Vundle manage Vundle
 "" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
 "
 " original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'drmingdrmer/xptemplate'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/gem-ctags'
Bundle 'mattn/gist-vim'
Bundle 'othree/html5.vim'
Bundle 'mattsacks/vim-complete'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
Bundle 'tobyS/skeletons.vim'
Bundle 'kana/vim-skeleton'
Bundle 'tobyS/pdv'
Bundle 'majutsushi/tagbar'
Bundle 'shemerey/vim-indexer'
Bundle 'esukram/autocomplpop.vim'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'Rip-Rip/clang_complete'
Bundle 'mattn/webapi-vim'
Bundle 'c9s/perlomni.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'Shougo/neosnippet'
Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/lisper-vim.git'
Bundle 'chrisbra/SaveSigns.vim'
Bundle 'scrooloose/syntastic'
Bundle 'valloric/MatchTagAlways'
Bundle 'plasticboy/vim-markdown'
Bundle 'chrisbra/NrrwRgn'
Bundle 'itspriddle/vim-jquery'
Bundle 'mattn/zencoding-vim'
Bundle 'godlygeek/csapprox'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar.git'
Bundle 'SirVer/ultisnips'
Bundle 'me-vlad/python-syntax.vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/DrawIt'
Bundle 'powerman/vim-plugin-viewdoc'
Bundle 'xolox/vim-shell'
Bundle 'Shougo/vimshell'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'spf13/PIV'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'gotcha/vimpdb'
Bundle 'vim-perl/vim-perl'
Bundle 'Shougo/vimproc'
Bundle 'xolox/vim-session'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'stephenmckinney/vim-solarized-powerline'
Bundle 'Lokaltog/powerline-fonts.git'
Bundle 'vim-scripts/QuickBuf'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'wavded/vim-stylus'
Bundle 'heaths/vim-msbuild'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rykka/colorv.vim'
Bundle 'AndrewRadev/sideways.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'leshill/vim-json'
Bundle 'rking/ag.vim'
Bundle 'mutewinter/tomdoc.vim'
Bundle 'jc00ke/vim-tomdoc'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'jwu/exvim'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-lua-inspect'
Bundle 'kablamo/VimDebug'
Bundle 'sjl/badwolf'
Bundle 'alfredodeza/pytest.vim'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'nosami/Omnisharp'
Bundle 'mattsacks/vim-complete'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'icsharpcode/NRefactory'
Bundle 'benizi/perl-support.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'klen/python-mode'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'motemen/git-vim'
Bundle 'greyblake/vim-preview'
Bundle 'shemerey/vim-project'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ghewgill/vim-scmdiff'
Bundle 'garbas/vim-snipmate'
Bundle 'mattsacks/vim-symbols'
Bundle 'rorymckinley/vim-symbols-strings'
Bundle 'kana/vim-textobj-user'
Bundle 'skalnik/vim-vroom'
Bundle 'Shougo/vimproc'
Bundle 'goldfeld/vim-seek'
Bundle 'Raimondi/delimitMate'

" vim-scripts repos
Bundle 'c.vim'
Bundle 'L9'
Bundle 'genutils'
Bundle 'CSApprox'
Bundle 'FuzzyFinder'
Bundle 'AutoComplPop'
Bundle 'CSApprox'
Bundle 'dbext.vim'
Bundle 'genutils'
Bundle 'IComplete'
Bundle 'DfrankUtil'
Bundle 'YankRing.vim'
Bundle 'ShowMarks'
Bundle 'ZoomWin'
Bundle 'IndexedSearch'
Bundle 'YankRing.vim'
Bundle 'SearchComplete'
Bundle 'AutoTag'
Bundle 'Rainbow-Parenthesis'
Bundle 'keepcase.vim'
Bundle 'scratch.vim'
Bundle 'indenthtml.vim'
Bundle 'bash-support.vim'
Bundle 'taglist.vim'
Bundle 'SQLUtilities'
Bundle 'VimClojure'
Bundle 'pydoc.vim'
Bundle 'quickfixsigns'
Bundle 'vcscommand.vim'
Bundle 'visual_studio.vim'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

"couse problems
"Bundle 'tomtom/quickfixsigns_vim'
"Bundle 'jeetsukumaran/vim-buffergator'
"Bundle 'VB.NET-Syntax'

"------------------------------------------------
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 
"------------------------------------------------------     

" Highlighting {{{
if &t_Co > 2 || has('gui_running')
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif
" }}}

"Increasing or decreasing numbers add the alpha option.
"http://vim.wikia.com/wiki/VimTip30
set nrformats+=alpha
set fileformats="unix,dos,mac"
set formatoptions+=1 " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)

set nocp
"evita crear archivos de respaldo
set nobackup	
set nowritebackup
set noswapfile	
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
set showcmd " show (partial) command in the last line of the screen
" this also shows visual selection info
" set nomodeline " disable mode lines (security measure)
set modeline " disable mode lines (security measure)
"set ttyfast " always use a fast terminal
set cursorline " underline the current line, for quick orientation
" }}}

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
    hi CursorLine guibg=#e6e6fa
    hi CursorColumn guibg=#e6e6fa
else
    set background=dark
    hi CursorLine guibg=Gray40 guifg=#ffffff
    hi CursorColumn guibg=Gray40 guifg=#ffffff
endif
syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme proman
"colorscheme Monokai
colorscheme eclipse
" colorscheme badwolf
"colorscheme mustang
"colorscheme wombat
"colorscheme github
"colorscheme smyck
"colorscheme railscasts
"colorscheme bandit     "like visual studio
"colorscheme blackboard     "like visual studio
"colorscheme default

"habilita plugin para sangrado de lineas
filetype plugin indent on

"habilita soporte para plugins
filetype plugin on

"muestra numeros de linea del archivo
set nu
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set wrap!
"set textwidth=79
set textwidth=85
set formatoptions=qrn1
set colorcolumn=100

"habilita sangrado inteligente
set smartindent
"sangrado automatico
set ai
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set scrolloff=4     " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
"Use Mark plugin to highlight selected word
set hlsearch
"jumps to search word as you type (annoying but excellent)
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch   " show search matches as you type
"Caso insesitivo para busquedas es decir no distingue mayusculas y minusculas
set ignorecase
"case-sensitive if search contains an uppercase character
set smartcase
set gdefault                    " search/replace "globally" (on a line) by default
set showmatch
"estable el modo de pliegue (folding)
set foldmethod=indent "fold based on indent
set foldnestmax=10	"deepest fold is 10 levels
"set nofoldenable	"dont fold by default
set foldlevel=1	"this is just what i Use
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen 
" au FileType cs set omnifunc=syntaxcomplete#Complete

" Folding rules {{{
set foldenable " enable folding
set foldcolumn=2 " add a fold column
set foldmethod=marker " detect triple-{ style fold markers
set foldlevelstart=99 " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

" expand tabs into spaces
    let onetab = strpart(' ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' �' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
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

"vbnet highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet

"remarcado de lineas speciales
highlight SpecialKey guifg=#c0c0c0 ctermfg=192
"muestra los caracteres ocultos y los remplaza por los establecidos
" set list
set listchars=tab:\|-,trail:-,eol:�
set mouse=a " enable using the mouse if terminal emulator

highlight NonText guifg=#4a4a59
if has('gui_running')
    "establecer fuente y tama�o
    "set guifont=Ubuntu_Mono:h11:cDEFAULT
    "set guifont=Ubuntu_Mono:h11:cANSI
    "set guifont=Consolas:h12:cDEFAULT
    "set guifont=Sansation_Light:h11:cDEFAULT
    "set guifont=Sansation:h11:cDEFAULT
    "set guifont=ProggyCleanTT:h13:cDEFAULT
    "set guifont=DejaVu_Sans_Mono:h10:cDEFAULT
    "set guifont=Monaco:h9:cDEFAULT
    "set guifont=Ubuntu_Mono_for_powerline:h14:cDEFAULT
    set guifont=Ubuntu_Mono_for_powerline:h11:cANSI
    set cursorline cursorcolumn
endif

" indentline
let g:indentLine_char = '|'

"habilita corrector ortografico
"set spell spelllang=es_mx
set spelllang=es_mx,en "Carga el diccionario en o los lenguajes que necesitemos
"set spell "Activa el corrector ortogr�fico en tiempo real :set nospell desactiva 

"------------------------------------------------------
"c compiler
" au FileType C set makeprg=gcc\ %
" au FileType Cpp set makeprg=g++\ %

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
                                   '
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0

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

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
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
"
"--------------------------------------------------------
" tabular
" https://github.com/godlygeek/tabular
"--------------------------------------------------------
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
":!which ctags -> tofindctalocation
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Ctags_Cmd = '"C:\cygwin\bin\ctags.exe"'
"---------------------------------------------------------
"
"---------------------------------------------------------
"easytags
"https://github.com/xolox/vim-easytags
"---------------------------------------------------------
let g:easytags_cmd = '"C:\cygwin\bin\ctags.exe"'
let g:easytags_file = '"C:\Users\Proman02\vimfiles\tags"'
" let g:easytags_file = $HOME . '/tags'
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
"http://www.vim.org/scripts/script.php?script_id=492
"https://github.com/vim-scripts/SQLUtilities
"---------------------------------------------------------
"
"---------------------------------------------------------
"tagbar
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
let g:tagbar_ctags_bin='"C:\Users\Proman02\vimfiles\ctags58\ctags.exe"'  " Proper Ctags locations
" let g:tagbar_ctags_bin= $HOME .'/vimfiles/ctags58/ctags.exe'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_expand = 0
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
let $VIM_INTELLISENSE="C:\\Program Files (x86)\\Vim\\Intellisense\\"
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
"vim-indent-guides
"https://github.com/nathanaelkane/vim-indent-guides
"---------------------------------------------------------
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
"let g:indent_guides_start_level=2
"
"setting custom indent colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" Indentation style color guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
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

"---------------------------------------------------------
"zencoding
"https://github.com/mattn/zencoding-vim
"http://mattn.github.com/zencoding-vim/
"http://coding.smashingmagazine.com/2009/11/21/zen-coding-a-new-way-to-write-html-code/
"---------------------------------------------------------
let g:user_zen_mode='n'    "only enable normal mode functions.
let g:user_zen_mode='inv'  "enable all functions, which is equal t
let g:user_zen_mode='a'    "enable all function in all mode.
let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1
"---------------------------------------------------------

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
"
"---------------------------------------------------------
"https://github.com/tobyS/skeletons.vim
"---------------------------------------------------------
let g:skeletons_dir=$HOME . '/vimfiles/bundle/skeletons.vim/skeletons/'
au BufNewFile * silent! 0r  ~/vimfiles/bundle/skeleton.vim/skeletons/skeleton.%:e
"---------------------------------------------------------
"pdv
"https://github.com/tobyS/pdv
"---------------------------------------------------------
"---------------------------------------------------------
let g:pdv_template_dir = $HOME ."/vimfiles/bundle/pdv/templates_snip"
" nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
"---------------------------------------------------------

