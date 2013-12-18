"--------------------------------------------
"Bundles list
"--------------------------------------------

" generic {{{
Bundle 'tpope/vim-repeat'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
"}}}

" utils {{{
Bundle 'genutils'
Bundle 'DfrankUtil'
Bundle 'xolox/vim-misc'
Bundle 'tomtom/vimtlib'
Bundle 'tomtom/tlib_vim'
Bundle 'mattn/webapi-vim'
Bundle 'tomtom/tplugin_vim'
"used for Omnisharp
Bundle 'tpope/vim-dispatch'
Bundle 'vim-scripts/cecutil'
Bundle 'MarcWeber/vim-addon-mw-utils'
"}}}

" gui {{{
Bundle 'sjl/gundo.vim'
Bundle 'quickfixsigns'
Bundle 'gcmt/taboo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdtree'
Bundle 'primitivorm/QuickBuf'
Bundle 'greyblake/vim-preview'
Bundle 'tpope/vim-characterize'
"Bundle 'primitivorm/minimap-vim'
Bundle 'Lokaltog/powerline-fonts'
"}}}

" formatting {{{
Bundle 'AutoAlign'
"autoclose endfunction, endif, etc...
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/Align'
Bundle 'godlygeek/tabular'
"autoclose
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'Chiel92/vim-autoformat'
"highlighting tags
"required for easy-align
Bundle 'visualrepeat'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'junegunn/vim-easy-align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'primitivorm/MatchTagAlways'
Bundle 'primitivorm/vim-swap-lines'
Bundle 'jakobwesthoff/argumentrewrap'
Bundle 'quentindecock/vim-cucumber-align-pipes'
"}}}

" source control {{{
Bundle 'mattn/gist-vim'
Bundle 'motemen/git-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'primitivorm/Source-Control'
"}}}

" templating {{{
"for c
Bundle 'ccimpl.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tskeletons'
Bundle 'mklabs/vim-backbone'
Bundle 'tomtom/templator_vim'
Bundle 'tomtom/tskeleton_vim'
Bundle 'aperezdc/vim-template'
Bundle 'tomtom/stakeholders_vim'
"}}}

" debuging {{{
Bundle 'Decho'
Bundle 'kablamo/VimDebug'
"}}}

" search/complete tools {{{
Bundle 'Thesaurus'
Bundle 'AutoComplPop'
Bundle 'IndexedSearch'
"used for Omnisharp
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-abolish'
Bundle 'shemerey/vim-indexer'
Bundle 'Word-Fuzzy-Completion'
Bundle 'primitivorm/vim-localcomplete'
Bundle 'bronson/vim-visual-star-search'
"for python
Bundle 'nvie/vim-flake8'
Bundle 'sontek/rope-vim'
Bundle 'rygwdn/rope-omni'
Bundle 'primitivorm/jedi-vim'
Bundle 'alfredodeza/pytest.vim'
"}}}

 " html {{{
Bundle 'indenthtml.vim'
Bundle 'othree/html5.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'hokaccha/vim-html5validator'
if has('win32') || has('win64')
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
else
  Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
endif
"}}}

" javascript {{{
Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'michalliu/jsruntime.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
"}}}

" coffe-script{{{
Bundle 'kchmck/vim-coffee-script'
"}}}

" json {{{
Bundle 'elzr/vim-json'
Bundle 'michalliu/jsoncodecs.vim'
"}}}

" lisp {{{
Bundle 'slimv.vim'
Bundle 'mattn/lisper-vim.git'
"}}}

"clojure {{{
Bundle 'tpope/vim-fireplace'
"}}}

" jquery {{{
Bundle 'itspriddle/vim-jquery'
"}}}

" css {{{
Bundle 'Css-Pretty'
Bundle 'wavded/vim-stylus'
Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'mutewinter/vim-css3-syntax'
"}}}

" asp {{{
Bundle 'biruh/vim-aspnet'
"}}}

" csharp {{{
"issue: install pywin32-214.win32-py2.7.exe
"http://code.google.com/p/vim-visual-studio/issues/detail?id=2
"copy C:\Python27\Lib\site-packages\pywin32_system32 to C:\Python27
"http://sourceforge.net/projects/pywin32/files/pywin32/Build%20214/
Bundle 'visual_studio.vim'
Bundle 'primitivorm/Omnisharp'
"}}}

"java {{{
Bundle 'tpope/vim-classpath'
"}}}
" c++ {{{
Bundle 'c.vim'
Bundle 'primitivorm/refactor'
"}}}

" sql {{{
Bundle 'dbext.vim'
Bundle 'sqlserver.vim'
Bundle 'SQLComplete.vim'
"}}}

"xml {{{
"install
"https://github.com/sukima/xmledit
Bundle 'sukima/xmledit'
"}}}

" python {{{
Bundle 'fs111/pydoc.vim.git'
Bundle 'primitivorm/pydiction'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mitechie/pyflakes-pathogen'
"}}}

" perl {{{
Bundle 'vim-perl/vim-perl'
"}}}

"colorscheme {{{
Bundle 'sjl/badwolf'
Bundle 'zeis/vim-kolor'
Bundle 'w0ng/vim-hybrid'
Bundle 'morhetz/gruvbox'
Bundle 'Rykka/galaxy.vim'
Bundle 'vim-scripts/PyChimp'
Bundle 'sickill/vim-monokai'
Bundle 'sickill/vim-sunburst'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/Liquid-Carbon'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'primitivorm/vim-proman-theme'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'altercation/vim-colors-solarized'
"aditional colors in vimfiles/color
"bandit
"blackboard
"candy
"codeschool
"default
"eclipse
"github
"guardian
"mickeysoft
"molokai
"molokai-transparent
"monokai
"mustang
"railscasts
"smyck
"twilight
"wombat
"color tools
Bundle 'Rykka/colorv.vim'
Bundle 'hexHighlight.vim'
Bundle 'sickill/coloration'
Bundle 'guns/xterm-color-table.vim'
"}}}

" Bundle blacklist {{{
"Bundle 'L9'
"Bundle 'grep.vim'
"Bundle 'CSApprox'
"Bundle 'SQLUtilities'
"Bundle 'mattn/emmet-vim'
"Bundle 'tpope/vim-ragtag'
"Bundle 'tyru/DumbBuf.vim'
"Bundle 'bash-support.vim'
"Bundle 'xolox/vim-session'
"sustituted for Omnisharp
"Bundle 'heaths/vim-msbuild'
"Bundle 'Lokaltog/powerline'
"Bundle 'honza/vim-snippets'
"Bundle '907th/vim-auto-save'
"Bundle 'garbas/vim-snipmate'
"Bundle 'mattn/zencoding-vim'
"Bundle 'shemerey/vim-project'
"Bundle 'airblade/vim-rooter'
"Bundle 'tpope/vim-vividchalk'
"Bundle 'vim-scripts/TaskList.vim'
"Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"}}}

" end Bundle {{{
filetype plugin indent on " required!
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"}}}
