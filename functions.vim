"--------------------------------------------
"FUNCTIONS
"--------------------------------------------

" StripTrailingWhitespaces {{{
" taken from: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun
" command to strip white space from any file
nmap <leader>s :call <SID>StripTrailingWhitespaces()<cr>
"auto-strip trailing white space for ruby files
"autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
" for al File Types
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Highlight all words when press <CR> {{{
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\<'.expand('<cword>').'\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<' . expand('<cword>') . '\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
"TODO: Uncoment this
nmap <silent> <expr> <CR> Highlighting()
"nmap <silent> <expr> <2-LeftMouse> Highlighting()

"http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type <leader>/ to toggle highlighting on/off.
nmap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=500
    return 0
  else
    augroup auto_highlight
      au!
    let curr = getline('.')[col('.')-1]
    if curr !~ '\W'
      au CursorHold * let @/ = expand('<cword>')
    endif
    augroup end
    setl updatetime=500
    return 1
  endif
endfunction
""call at startup
"call AutoHighlightToggle()
" }}}

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
"nmap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Theme Rotating {{{
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      "http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/
      "#solarized#tomorrow-night#
      let colorstring = "#xoria256#codeschool#Monokai#mustang#wombat#github#eclipse#"
                        \ . "summerfruit256#proman#codeblocks-dark#visualstudio#Tomorrow"
      let x = match(colorstring,"#",g:themeindex)
      let y = match(colorstring,"#",x + 1)
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring,x + 1,y - x - 1)
         return ":colorscheme " . themestring
      endif
   endwhile
endfunction
" Rotate Color Scheme <F12>
nmap <silent><F12> :exe RotateColorTheme()<bar>:exe "hi! CursorColumn guibg=#e0e0e0"<CR>

"change background
function! ChangeBackground()
    if &background=="light"
        set background=dark
    else
        set background=light
    endif
endfunction
nmap <silent><C-F12> :execute ChangeBackground()<CR>
" }}}

" Increment visual selection {{{
" http://vim.wikia.com/wiki/Making_a_list_of_numbers
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>
" }}}
