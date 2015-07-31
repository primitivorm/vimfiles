"runtime bundle/tplugin_vim/macros/tplugin.vim
"TPluginScan!
"http://learnvimscriptthehardway.stevelosh.com/

"--------------------------------------------
" VIM CONFIGURATION
"--------------------------------------------

" Source the vimrc file after saving it {{{
let $MYVIMRC=expand($HOME.'/vimfiles/_vimrc')
let $VIMFILES=expand($HOME.'/vimfiles/')
"https://github.com/tpope/tpope/blob/master/.vimrc
" Key mappings, functions, auto commands
source $HOME/vimfiles/keymap.vim
"functions source
source $HOME/vimfiles/functions.vim
"256 colors name
source $HOME/vimfiles/xterm256colors.vim
"}}}

" Pathogen {{{
"https://github.com/tpope/vim-pathogen
call pathogen#infect()
filetype off " required!
filetype plugin off
filetype plugin indent off
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()
"}}}

" Vundle {{{
"https://github.com/gmarik/vundle
"rtp
set runtimepath+=~/vimfiles/
set runtimepath+=~/vimfiles/bin/
set runtimepath+=~/vimfiles/after/
set runtimepath+=~/vimfiles/bundle/
set runtimepath+=~/vimfiles/bundle/Vundle.vim/
set runtimepath+=~/vimfiles/bundle/vim-proman-theme/
set nocompatible " be iMproved
"https://github.com/gmarik/vundle/issues/211
call vundle#begin('~/vimfiles/bundle/')
"" let Vundle manage Vundle
"" required!
Plugin 'gmarik/Vundle.vim'
"bundles source
source $HOME/vimfiles/bundles.vim
"plugins config
source $HOME/vimfiles/plugins.vim
" All of your Plugins must be added before the following line
call vundle#end()
"}}}

" Backup {{{
"evita crear archivos de respaldo
set nobackup
set nowritebackup
set noswapfile
"guarda el archivo en cuanto se deja el buffer
set autowrite
set autoread
set diffexpr=

" store swap files in one of these directories
" (in case swapfile is ever turned on)
"set viminfo='20,\"80 " read/write a .viminfo file, don't store more
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
set vb t_vb= " Turn off visual bell, error flash
set noshowmode "show current mode
set showcmd " show (partial) command in the last line of the screen
" this also shows visual selection info
" set nomodeline " disable mode lines (security measure)
set modeline
"}}}

" Encoding {{{
" use utf8 encoding for vim files and for default file encoding
"scriptencoding utf-8
if has("multi_byte")
  if &termencoding == ""
  let &termencoding = &encoding
  endif
  set encoding=utf-8
  "set encoding=latin1
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,default,latin1,ucs-2le,utf-16le,cp1252,iso-8859-15
  if has("eval")
    let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
  endif
endif
"}}}

" Gui {{{
" switch syntax highlighting on, when the terminal has colors
syntax on
"syntax enable

"set background=dark
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

"colo summerfruit256
colo proman
"colo xoria256
"colo codeblocks-dark
"colo wombat
"colo codeschool
"colo mango
"colo mustang
"colo Tomorrow-Night
"colo zellner
"colo visualstudio
"colo zenburn
"colo Tomorrow
"colo molokai
"colo Monokai
"colo skittles_berry
"colo solarized
"colo Papercolor

"Disabling vim's startup message
"set shortmess=a

set cursorline "cursorcolumn "underline the current line, for quick orientation
"establece el esquema de colores
"max num of tabs
set tabpagemax=50
"setting a limit on the characters Vim will highlight per line at most
set synmaxcol=512
set fileformats=dos,unix
"▸»·↵→←×┊│¬
set listchars=tab:»\-,trail:·,eol:¬

set guifont=LettrGoth12_BT:h12,
            \Andale_Mono:h11,
            \Meslo_LG_M_for_Powerline:h11,
            \Consolas:h11,
            \Consolas_for_Powerline_FixedD:h11,
            \Ubuntu_Mono:h12,
            \Bitstream_Vera_Sans_Mono:h11,
            \Anonymous_Pro_for_Powerline:h11,
            \Anonymice_Powerline:h11,
            \Envy_Code_R_for_Powerline:h11,
            \Lucida_Console:h11,
            \DejaVu_Sans_Mono_for_Powerline:h11,
            \Inconsolata_for_Powerline:h11,
            \Consola_Mono:h11,
            \Monaco:h10,
            \Input:h11,
            \InputMonoNarrow:h11,
            \Sauce_Code_Powerline:h11,
            \Monaco:h11,
            \Fixedsys:h11,
            \Terminus:h12

"temporal directories
set directory=.,$TMP,$TEMP
set undodir=.,$TMP,$TEMP

"habilita soporte para plugins
filetype on
filetype plugin on
filetype plugin indent on " required!
"muestra numeros de linea del archivo
set nu
" Show relative line numbers.
"set rnu
"forza a que la linea no se salte a la siguiente cuando no cabe en la ventana actual
set nowrap
set nolinebreak "lbr
"http://www.bestofvim.com/tip/better-line-wraps/
"set showbreak=↪
set showbreak=..
set textwidth=79
set wrapmargin=0
"http://vim.wikia.com/wiki/VimTip30
set nrformats+=alpha,hex
"set display=uhex
set display=lastline
"set formatoptions=tcq "default
set formatoptions+=qrn1 " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
"if exists('+colorcolumn')
  "set colorcolumn=79
  ""let &colorcolumn="80,".join(range(100,999),",")
"endif
"habilita sangrado inteligente
set smartindent
"sangrado automatico
"define el numero espacios para la tecla <TAB>
"use 4 spaces for tabs set tabstop=4 softtabstop=4 shiftwidth=4 " display indentation guides
set tabstop=4
set shiftwidth=4
"change tabs to spaces
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set virtualedit=onemore "go to end of line on insert mode at press <up> <down> key
""set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backspace=2
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set scrolloff=5 " keep 5 lines off the edges of the screen when scrolling
"Use Mark plugin to highlight selected word
"hl
set hlsearch
"jumps to search word as you type (annoying but excellent)
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch " show search matches as you type
"Caso insesitivo para busquedas es decir no distingue mayusculas y minusculas
set ignorecase
"With this option set vi will complete the new word as 'thimble' instead of 'Thimble'
set infercase
"case-sensitive if search contains an uppercase character
set smartcase
set nogdefault " search/replace "globally" (on a line) by default
"Resalta la { o ) que estamos cerrando (sm)
set showmatch
"Mostrar la posicion del cursor en todo momento
set ruler
set matchtime=3 "mat
set matchpairs+=<:>
set matchpairs+=":"
set matchpairs+=':'
set matchpairs+=%:%
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
"}}}

" Folding rules {{{
set foldenable " enable folding
set foldcolumn=1 " add a fold column
set foldmethod=syntax
set foldnestmax=9
set foldlevel=99
set foldlevelstart=99 "start out with everything unfolded
" which commands trigger auto-unfold
"set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
"default
set foldopen=block,hor,insert,mark,percent,quickfix,search,tag,undo
"}}}

" Editor layout {{{
"set lazyredraw " don't update the display while executing macros
" tell VIM to always put a status line in, even
set laststatus=2
if has("statusline")
  set runtimepath+=~/vimfiles/cream/
  source $HOME/vimfiles/cream/genutils.vim
  source $HOME/vimfiles/cream/cream-lib.vim
  source $HOME/vimfiles/cream/cream-lib-os.vim
  source $HOME/vimfiles/cream/cream-statusline.vim

  " for cream statusline
  hi! User1  gui=NONE guifg=#999999 guibg=#073642 gui=bold
  hi! User2  gui=NONE guifg=#93a1a1 guibg=#073642 gui=NONE
  hi! User3  gui=NONE guifg=#bcc9db guibg=#073642 gui=bold
  hi! User4  gui=NONE guifg=#d7d7af guibg=#073642 gui=bold
  " Highlighting: Setup some nice colours to show the mark positions.
  "hi! FoldColumn guibg=bg guifg=fg ctermfg=fg ctermbg=bg gui=reverse cterm=reverse
endif
" if there is only one window
set cmdheight=1 " use a status bar that is 2 rows high
"}}}

" Vim behaviour {{{
set switchbuf=useopen " reveal already opened files from the
" quickfix window instead of opening new
" buffers
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
"char for split
"set fillchars=stl:-,stlnc:-,vert:\|
set fillchars=vert:\|
"piexel space between lines
set linespace=0
"muestra los caracteres ocultos y los remplaza por los establecidos
set nolist
set mouse=a " enable using the mouse if terminal emulator
set mousemodel=popup_setpos
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions+=b  "remove bootom-hand scroll bar
" use console dialogs instead of popups
set guioptions+=c
" allow pasting into other applications after visual selection
set guioptions+=a
" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'
"}}}

" Spell {{{
set nospell
"http://precheur.org/vim/create_spell_file_for_vim
set spelllang=es,en "Carga el diccionario en o los lenguajes que necesitemos
"limit the number of suggested words
set spellsuggest=best,10
set dictionary+=~/vimfiles/spell/es_MX.dic
set dictionary+=~/vimfiles/spell/en_US.dic
"set complete-=k complete+=k
set keymap=accents
set pumheight=10
"syntax completion
"http://vim.wikia.com/wiki/VimTip498
autocmd FileType * exe('setl dict+='.$HOME.'/vimfiles/syntax/'.&filetype.'.vim')
"dict for new words
set spellfile=~/vimfiles/spell/dict.add
"spellsuggest
"}}}

" autocmd {{{
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType c,cpp,h setlocal omnifunc=ccomplete#Complete
" ruby
"http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
"http://www.vim.org/scripts/script.php?script_id=1662
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" xmledit plugin
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
"For the most accurate but slowest result, set the syntax synchronization method to fromstart
autocmd BufEnter * :syntax sync fromstart
"suffixes added to command gf
set suffixes+=.c,.h,.cpp,.cs,.js,.css,.html,.htm,.xml,.rb,.h,.aspx,.aspx.vb,.aspx.cs,.java,.py,.lisp,.perl,.vim
set suffixesadd+=.c,.h,.cpp,.cs,.js,.css,.html,.htm,.xml,.rb,.h,.aspx,.aspx.vb,.aspx.cs,java,.py,.lisp,.perl,.vim
"vbnet highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"c compiler
autocmd FileType c,h set makeprg=gcc\ %
autocmd FileType cpp,h set makeprg=g++\ %
autocmd FileType cpp,c,h set errorformat=%f(%l)%m
"}}}
