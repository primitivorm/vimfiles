four essential freedoms:
 (0) to run the program,
 (1) to study and change the program in source code form,
 (2) to redistribute exact copies, and
 (3) to distribute modified versions.

InEnglish -> 55 56 87 32 12

"autocmd VimEnter * tab all
	"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

" opens a file in a new tab
" KeepWindowOpen - dont close the window even if NERDTreeQuitOnOpen is set
" stayCurrentTab: if 1 then vim will stay in the current tab, if 0 then vim
" will go to the tab where the new file is opened
function! s:openInTabAndCurrent(keepWindowOpen, stayCurrentTab)
    if getline(".") ==# s:tree_up_dir_line
        return s:upDir(0)
    endif

    let currentNode = s:TreeFileNode.GetSelected()
    if currentNode != {}
        let startToCur = strpart(getline(line(".")), 0, col("."))

        if currentNode.path.isDirectory
            call currentNode.activate(a:keepWindowOpen)
            return
		else
            call s:openInNewTab(a:stayCurrentTab)
            return
		endif
    endif
endfunction

""autocmd tabenter * QuitIfOnlyTab
function! DoQuitIfOnlyTab()
	if (&modifiable)
		tab ball
		tabn
	endif
endfunction
command! -nargs=0 QuitIfOnlyTab call DoQuitIfOnlyTab()

" move tabs to the end for new, single buffers (exclude splits)
"autocmd BufNew * if winnr('$') == 1 | tabmove 99 | endif

nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F0> 10gt
" opens a file in a new tab
" KeepWindowOpen - dont close the window even if NERDTreeQuitOnOpen is set
" stayCurrentTab: if 1 then vim will stay in the current tab, if 0 then vim
" will go to the tab where the new file is opened
function! s:openInTabAndCurrent(keepWindowOpen, stayCurrentTab)
    if getline(".") ==# s:tree_up_dir_line
        return s:upDir(0)
    endif

    let currentNode = s:TreeFileNode.GetSelected()
    if currentNode != {}
        let startToCur = strpart(getline(line(".")), 0, col("."))

        if currentNode.path.isDirectory
            call currentNode.activate(a:keepWindowOpen)
            return
        else
            call s:openInNewTab(a:stayCurrentTab)
            return
        endif
    endif
endfunction


"let tagbar_open = bufwinnr('__Tagbar__') != -1
"if (&diff==0)
	":autocmd BufReadPost * tab ball
	":autocmd BufReadPost * tab ball | QuitIfOnlyTab
	"
	":autocmd BufReadPost * tab sball | tabclose 1
"	:autocmd BufReadPost * tab sb
"endif

"augroup HelpInTabs
    "au!
    "au BufEnter *.txt call HelpInNewTab()

    "function! HelpInNewTab()
        "if &buftype == 'help'
            "execute "normal \<C-W>T"
        "endif
    "endfunction
"augroup END

"autocmd tabenter tagbar TagbarClose
"autocmd tabenter * TagbarClose
"autocmd FileType tagbar :QuitIfOnlyWindow
"autocmd BufEnter	__Tagbar__ nested call s:QuitIfOnlyWindow()
" s:QuitIfOnlyWindow() {{{2
"function! DoQuitIfOnlyTab()
	"for i in range(1, winnr('$'))
		"echo "tab" . i
		"let buf = winbufnr(i)

		"echo "buf" . buf
		"let num_buf = len(filter(range(1, bufnr(buf)), 'buflisted(v:val)'))

		"echo "num_buf" . num_buf
		"let buf_name = bufname(winbufnr(buf))
		"echo "buf_name" . buf_name
		"if (num_buf == 1)
			"if(buf_name == '__Tagbar__')
				"echo "Closing __Tagbar__" . i
				"":tabclose
				"":BufClose buf_name
			   "":q
""			   :tabclose i
""			   execute "tabclose" i
			   "continue
			"endif
			""if getbufvar(buf, '&buftype') == 'tagbar'
				""tabclose buf
				""echo "closing tab..."				  "
				""continue
			""else
				""echo "No find tagbar"
			""endif
		"endif
	"endfor
"endfunction
"command! -nargs=0 QuitIfOnlyTab call DoQuitIfOnlyTab()

"autocmd BufReadPost tagbar | tabclose | endif
"if(&filetype=='tagbar')
"	:call TagbarClose
"endif
"autocmd BufReadPost tagbar if winbufnr(2) == 1 | q | endif
"autocmd vimenter * nested :TagbarOpen


