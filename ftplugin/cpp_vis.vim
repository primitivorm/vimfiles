" FTPlugin for cpp.
" Author : Ravi Shankar & Madan
" Version : $Name: RELEASE_1_4_1 $ , $Revision: 1.4 $
" Date : $Date: 2005/07/28 03:45:35 $
"
" Look for latest version at http://insenvim.freeservers.com
" You are free to change this file, provided you leave this header intact.
"
" This file should reside in one of the following :
"     $VIMRUNTIME\ftplugin, $VIM\vimfiles\ftplugin or $HOME\vimfiles\ftplugin
"
if exists("b:cpp_vis")
  finish
endif
let b:cpp_vis = 1

" some constants
let s:DEBUG_LOG_FILE = $TEMP . "/insen_cppft.log"
let s:VIM_HELPER = $TEMP . "/VimHelper.txt"
let s:VIM_HELPER_PARAM = $TEMP . "/VimHelperParam.txt"
let s:ECTAGS = $TEMP . "/InsenVimAllTags.tags"

" conigure $INCLUDE via &path from vim
let s:usevimpathasinclude = 1

" show public access types only
let s:showpublicaccessorsonly = 1

let s:perlfound = "false"

" Private functions {{{

function! s:CheckPerl()

    " Verify perl is in the user path. 
    if strlen(globpath(substitute($PATH, ';', ',', 'g'), 'perl.exe')) == 0
        call IN_ErrorMsg("Perl (perl.exe) not found in your path")
        return
    endif

    let s:perlfound = "true"

endfunction

function! s:ConfigureFtPluginLocation()

    let s:cppft_plugin = g:intellisense_vimfiles . "/ftplugin/cpp_vis.vim"

    if filereadable(s:cppft_plugin) != 1
        let s:cppft_plugin = g:intellisense_vimfiles . "/ftplugin/cpp/cpp_vis.vim"
        if filereadable(s:cppft_plugin) != 1
            let s:cppft_plugin = "<UNKNOWN>/ftplugin/cpp_vis.vim"
        endif
    endif

endfunction

" }}}

" menu system {{{
function! s:CheckFileExists(msg, file)

    if (filereadable(a:file) == 1)
        let msg = a:msg. "exists\n"
    else
        let msg = a:msg . "not found\n"
    endif

    return msg

endfunction

function! s:ShowConfiguration()

	let conf = "Intellisense Version : " . g:intellisense_version . "\n"
	let conf = conf . "-----------------------------------------------------\n"
	let conf = conf . " Environment\n"
	let conf = conf . "   INCLUDE : " . expand('$INCLUDE') . "\n"
	let conf = conf . "   vimpath : " . &path . "\n"
    let conf = conf . "   using " . s:cppft_plugin . "\n"

    " this should be in the cppft.vim file not here
    if (expand('$INSENVIM_CPPFT_INFO_LOG') == 1)
        let conf = conf . "   CPP FT Logging Enabled\n"
    else
        let conf = conf . "   CPP FT Logging Disabled\n"
    endif

    let conf = conf . "   PERL found in path : " . s:perlfound . "\n"

	let conf = conf . " ----------------------------------------------------------\n"
	let conf = conf . " DEFAULTS\n"

	let conf = conf . "  append vim path to INCLUDE : "
    if (s:usevimpathasinclude == 1)
        let conf = conf . "enabled\n"
    else
        let conf = conf . "disabled\n"
    endif
	let conf = conf . "  show public accessors only : "
    if (s:showpublicaccessorsonly == 1)
        let conf = conf . "enabled\n"
    else
        let conf = conf . "disabled\n"
    endif

	let conf = conf . "-----------------------------------------------------\n"

    let conf = conf . "Generated Files Status\n"
    let conf = conf . <SID>CheckFileExists("   Debug Log File : ", s:DEBUG_LOG_FILE)
    let conf = conf . <SID>CheckFileExists("   VimHelperParam File : ", s:VIM_HELPER_PARAM)
    let conf = conf . <SID>CheckFileExists("   VimHelper File : ", s:VIM_HELPER)
    let conf = conf . <SID>CheckFileExists("   E-CTAGS File : ", s:ECTAGS)

	let conf = conf . "-----------------------------------------------------\n"

	call confirm(conf, "&OK", 1, "Info")
endfunction

function! s:TogglePerlLogging()
    if (expand('$INSENVIM_CPPFT_INFO_LOG') == 1)
        let $INSENVIM_CPPFT_INFO_LOG=""
        let l:msg = "CPPFT Backend Logging Disabled\n"
    else
        let $INSENVIM_CPPFT_INFO_LOG=1
        let l:msg = "CPPFT Backend Logging Enabled\n"
    endif

    call confirm(l:msg, "&OK", 1, "Info")
endfunction

function! s:ToggleDisplayPublicAccessors()
    if (expand('$INSENVIM_CPPFT_SHOW_PUBLIC_ONLY') == 1)
        let $INSENVIM_CPPFT_SHOW_PUBLIC_ONLY=""
        let l:msg = "C++ Intellisense will show all accessors\n"
    else
        let $INSENVIM_CPPFT_SHOW_PUBLIC_ONLY=1
        let l:msg = "C++ Intellisense will show only public accessors\n"
    endif

    call confirm(l:msg, "&OK", 1, "Info")
endfunction

function! s:OpenFile(filename)
    if filereadable(a:filename)
        " couldn't work out how to use a local variable so i've used an
        " envioronment variable, yuk
        let $OPEN_FILE = a:filename
        :e $OPEN_FILE
        let $OPEN_FILE = ""
    endif
endfunction

function! s:OpenDebugLogFile()
    call <SID>OpenFile(s:DEBUG_LOG_FILE)
endfunction

function! s:OpenHelperFile()
    call <SID>OpenFile(s:VIM_HELPER)
endfunction

function! s:OpenHelperParamFile()
    call <SID>OpenFile(s:VIM_HELPER_PARAM)
endfunction

function! s:OpenEctagsFile()
    call <SID>OpenFile(s:ECTAGS)
endfunction

" INCLUDE is used in the back end to help find include files found in the
" source code.  INCLUDE contains windows PATHS seperates by a ;,
" eg. (INCLUDE=c:\\inc;c:\\inc2)
" the vim path variable can contain windows or unix paths, but they are 
" comma seperated[we won't support spaces], 
" eg. (path=c:\\inc,c:\\inc2 or path=c:/inc,c:/inc2)
function! s:ConfigureInclude()

    " unfortunately this will fail if path contains only one element
    if (match(&path, ",") == -1)
        call IN_WarningMsg("Vim path variable may not be set correctly")
    endif

	let $INCLUDE = $INCLUDE . ";" . substitute(&path, ',', ';', 'g')

endfunction

" build the gui menu
"
" not sure how to use s:variables in menus so I used explicit private 
" functions instead
if has("gui_running")

	amenu &Intellisense.Show\ C++\ Configuration :call <SID>ShowConfiguration()<CR>
	tmenu &Intellisense.Show\ C++\ Configuration Show the current values of the C++ Intellisense Enironment
	amenu &Intellisense.Configure\ Include : call <SID>ConfigureInclude()<CR>
	tmenu &Intellisense.Configure\ Include Assign vim path to the environment variable INCLUDE
	amenu &Intellisense.Enable/Disable\ Perl\ Logging :call <SID>TogglePerlLogging()<CR>
	amenu &Intellisense.Enable/Disable\ Display\ Public\ Accessors\ Only :call <SID>ToggleDisplayPublicAccessors()<CR>
	amenu &Intellisense.-C++\ Open\ Debug\ Files-  : <NOP>
	amenu &Intellisense.Open\ Debug\ Log\ File : w!<CR>:call <SID>OpenDebugLogFile()<CR>
	amenu &Intellisense.Open\ VimHelper\.txt\ File : w!<CR>:call <SID>OpenHelperFile()<CR>
	amenu &Intellisense.Open\ VimHelperParam\.txt\ File : w!<CR>:call <SID>OpenHelperParamFile()<CR>
	amenu &Intellisense.Open\ InsenVimAllTags\.tags\ File : w!<CR>:call <SID>OpenEctagsFile()<CR>

endif

" }}}

" place main last because one of the maps upsets the syntax highlighting which
" upsets me:)
" Main main {{{
if !exists("g:loaded_intellisence")
    call IN_ErrorMsg( "Intellisense.vim has not been loaded, " .
                   \ "installation problem!")
    finish
endif

call s:CheckPerl()

call s:ConfigureFtPluginLocation()

if IN_StartIntelliSense() == -1
    call IN_ErrorMsg( "Failed to start Intellisense")
    finish
endif

let b:ignorekeys      = "_"
let b:dochelpdelay    = "2000"
let b:delimiterkey    = "("
let b:tooltipclosekey = ")"
let b:helpwindowsize  = "0x0"
"0 is no ignore case
let b:ignorecase = 0 
imap <silent><buffer> . .<C-R>=IN_ShowVISDialog("showMethodList")<CR>
imap <silent><buffer> > ><C-R>=IN_ShowVISDialog("showMethodList")<CR>
imap <silent><buffer> : :<C-R>=IN_ShowVISDialog("showMethodList")<CR>
imap <silent><buffer> <C-Space> <C-R>=IN_ShowVISDialog("showGenList")<CR>
imap <silent><buffer> ( (<C-R>=IN_ShowVISDialog("showTooltip")<CR>
imap <silent><buffer> <C-S-Space> <C-R>=IN_ShowVISDialog("showTooltip")<CR>

if (s:usevimpathasinclude == 1)
    call s:ConfigureInclude()
endif

if (s:showpublicaccessorsonly == 1)
    let $INSENVIM_CPPFT_SHOW_PUBLIC_ONLY=1
endif

" }}}

