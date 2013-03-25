Prerequisitos
===============
1.  Instalar cygwin de http://www.cygwin.com/

Opcionalmente:
---------------
1.  Instalar Ruby desde http://rubyinstaller.org/downloads/
2.  Instalar devkit como indica https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
3.  Instalar Perl desde http://www.perl.org/get.html
4.  Instalar Python desde http://www.python.org/getit/
5.  Instalar CTAGS http://ctags.sourceforge.net/
6.  Remplazar el archivo ctags.exe en C:\cygwin\bin (respaldar previamente el anterior)


Instalacion
===============
1.  Descargar los archivos contenidos en este repositorio

$git clone git clone https://github.com/primitivorm/vimfiles-proman.git

2.  Mover el contenido del vimfiles-proman en $HOME/vimfiles/
3.  Mover el archivo _vimrc en $VIM
4.  Establecer las siguientes variables de entorno:

* CLASSPATH=C:\Program Files\Java\jre7\lib\
* INCLUDE=C:\cygwin\lib\
* JAVA_DOCPATH=C:\Program Files\Java\api
* JAVA_HOME=C:\jruby16\jre\;C:\Program Files\Java\jre1.5.0_07\bin\client\;C:\Program Files\Java\jre7\bin\client\;
* LC_ALL=es_MX.utf-8
* LIB=C:\cygwin\lib
* LIBRARY_PATH=C:\cygwin\lib
* LISPBOX_HOME=C:\cygwin\home\<nombre_de_usuario>\src\CLISP\lispbox-0.7\
* HOME=C:\cygwin\home\<nombre_de_usuario>\
* PATH=C:\jruby16\bin;
C:\WINDOWS\Microsoft.NET\Framework\v3.5\;
C:\cygwin\bin;C:\Ruby187\bin;
C:\Ruby193\bin;
C:\cygwin\bin;
C:\Windows\Microsoft.NET\Framework\v2.0.50727\;
C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin;
C:\cygwin\home\Proman02\vimfiles\bundle\perlomni.vim\bin;
C:\cygwin\home\Proman02\vimfiles\ctags58;
C:\cygwin\home\Proman02\bin

* TEMP=%USERPROFILE%\Local Settings\Temp
* TMP=%USERPROFILE%\Local Settings\Temp
* TMPDIR=%USERPROFILE%\Local Settings\Temp
* VIM_INTELLISENSE=C:\Program Files\Vim\Intellisense

5.  Cambiar las siguientes rutas en caso de ser necesarios en el archivo de configuracion de _vimrc
* let Tlist_Ctags_Cmd = '"C:\cygwin\bin\ctags.exe"'
* let g:easytags_cmd = '"C:\cygwin\bin\ctags.exe"'
* let g:easytags_file = '"C:\cygwin\home\Proman02\tags"'
* let g:tagbar_ctags_bin='"C:\cygwin\home\Proman02\vimfiles\ctags58\ctags.exe"'


Plugins Instalados
===============
NOMBRE             URL
---------------
* taglist         http://www.vim.org/scripts/script.php?script_id=273         http://ctags.sourceforge.net/
* NerdTree        http://www.vim.org/scripts/script.php?script_id=1658        https://github.com/scrooloose/nerdtree
* vim-surround    https://github.com/tpope/vim-surround
* vim-repeat      http://www.vim.org/scripts/script.php?script_id=2136        https://github.com/tpope/vim-repeat
* ctrlp.vim       https://github.com/kien/ctrlp.vim
* project.vim     http://www.vim.org/scripts/script.php?script_id=69
* xptemplate      http://www.vim.org/scripts/script.php?script_id=2611        https://github.com/drmingdrmer/xptemplate
* visual_studio   http://www.vim.org/scripts/script.php?script_id=864         http://www.plan10.com/vim/visual-studio/doc/1.2/
* genutils        http://www.vim.org/scripts/script.php?script_id=197        https://github.com/vim-scripts/genutils
* CRefVim         http://www.vim.org/scripts/script.php?script_id=614
* matchit         http://www.vim.org/scripts/script.php?script_id=39
* vcscommand      http://www.vim.org/scripts/script.php?script_id=90          http://code.google.com/p/vcscommand/        http://repo.or.cz/w/vcscommand.git
* command-t       https://github.com/wincent/Command-T
* SQLUtilities    http://www.vim.org/scripts/script.php?script_id=492
* supertab        http://www.vim.org/scripts/script.php?script_id=1643        https://github.com/ervandew/supertab
* easy-motion     https://github.com/Lokaltog/vim-easymotion
* vim-scmdiff     https://github.com/ghewgill/vim-scmdiff
* clang_complete  http://www.vim.org/scripts/script.php?script_id=3302        https://github.com/Rip-Rip/clang_complete
* webapi-vim      http://www.vim.org/scripts/script.php?script_id=4019        https://github.com/mattn/webapi-vim
* gist            http://www.vim.org/scripts/script.php?script_id=2423        https://github.com/mattn/gist-vim
* perlomni        http://www.vim.org/scripts/script.php?script_id=2852        https://github.com/c9s/perlomni.vim
* perl-support.vim        https://github.com/vim-scripts/perl-support.vim
* neosnippet https://github.com/Shougo/neosnippet
* FuzzyFinder     https://github.com/vim-scripts/FuzzyFinder
* lisper          http://www.vim.org/scripts/script.php?script_id=3819       https://github.com/mattn/lisper-vim.git
* ShowMarks       http://www.vim.org/scripts/script.php?script_id=152        https://github.com/vim-scripts/ShowMarks
* SaveSigns      https://github.com/chrisbra/SaveSigns.vim
* syntastic       https://github.com/scrooloose/syntastic
* csapprox        https://github.com/godlygeek/csapprox
* fugitive        http://www.vim.org/scripts/script.php?script_id=2975        https://github.com/tpope/vim-fugitive
* html5           https://github.com/othree/html5.vim
* tabular         https://github.com/godlygeek/tabular
* dbext           http://www.vim.org/scripts/script.php?script_id=356         https://github.com/vim-scripts/dbext.vim
* c-vim           https://github.com/vim-scripts/c.vim
* L9              https://github.com/vim-scripts/L9
* icomplete       https://github.com/vim-scripts/IComplete
* javascript-libraries-syntax         https://github.com/othree/javascript-libraries-syntax.vim
* piv             https://github.com/spf13/PIV
* pyflakes        https://github.com/kevinw/pyflakes-vim
* quickfixsigns_vim      http://www.vim.org/scripts/script.php?script_id=2584        https://github.com/tomtom/quickfixsigns_vim
* vim-addon-mw-utils     https://github.com/MarcWeber/vim-addon-mw-utils
* vimpdb         https://github.com/gotcha/vimpdb
* vim-perl       https://github.com/vim-perl/vim-perl
* vimproc        https://github.com/Shougo/vimproc
* vim-session    https://github.com/xolox/vim-session
* YankRing.vim   https://github.com/vim-scripts/YankRing.vim
* Powerline      https://github.com/Lokaltog/vim-powerline.git           https://github.com/Lokaltog/powerline          https://powerline.readthedocs.org/en/latest/
* python_match    https://github.com/vim-scripts/python_match.vim
* pydoc           https://github.com/fs111/pydoc.vim
* QuickBuf        https://github.com/vim-scripts/QuickBuf
* ack    https://github.com/mileszs/ack.vim
* SearchComplete     https://github.com/vim-scripts/SearchComplete
* vim-stylus         https://github.com/wavded/vim-stylus
* AutoTag            https://github.com/vim-scripts/AutoTag
