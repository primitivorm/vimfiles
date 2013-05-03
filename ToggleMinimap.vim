 "https://gist.github.com/brennen/1471147
function! ToggleMinimap()

if ex"ists("s:isMini") && s:isMini == 0
let s:isMini = 1
else
let s:isMini = 0
end

if (s:isMini == 0)

" save current visible lines
let s:firstLine = line("w0")
let s:lastLine = line("w$")

" don't change window size
let c = &columns * 12
let l = &lines * 12
exe "set columns=" . c
exe "set lines=" . l

" make font small
set guifont=ProggyTinyTT:h2
exe 'normal zR'

" highlight lines which were visible
let s:lines = ""
for i in range(s:firstLine, s:lastLine)
let s:lines = s:lines . "\\%" . i . "l"
if i < s:lastLine
let s:lines = s:lines . "\\|"
endif
endfor

exe 'match Visible /' . s:lines . '/'
hi Visible guifg=#ffffff guibg=#2b3c43
set cursorline

no h 10j
no t 10k

nmap <space> :ToggleMinimap<CR>

else

set guifont=Anonymous\ Pro:h14
hi clear Visible
set nocursorline

no h j
no t k

nmap <space> a<space><ESC>

endif

endfunction

command! ToggleMinimap call ToggleMinimap()

nmap <d-space> :ToggleMinimap<CR>
