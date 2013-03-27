"archivos de configuracion auxiliares para windows
source $HOME/vimfiles/vimrc_example.vim
source $HOME/vimfiles/mswin.vim
source $HOME/vimfiles/keymap.vim
" Key mappings, functions, autocommands


set digraph

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
" set nocompatible
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

" Indentation style color guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"remarcado de lineas speciales
highlight SpecialKey guifg=#c0c0c0 ctermfg=192
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
let g:NERDTreeChDirMode=0
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
"http://www.vim.org/scripts/script.php?script_id=492
"https://github.com/vim-scripts/SQLUtilities
"---------------------------------------------------------
"---------------------------------------------------------
"
"---------------------------------------------------------
"tagbar
" http://www.vim.org/scripts/script.php?script_id=3465
" https://github.com/majutsushi/tagbar
"---------------------------------------------------------
let g:tagbar_ctags_bin='"C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe"'  " Proper Ctags locations
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

