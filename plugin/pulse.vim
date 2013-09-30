" Pulse the cursor line when repeating a search with "n" or "N".
" Based on code I found online. Assumes your status line bg color is normally
" "NONE", as mine is. Adjust the colors as needed.
" The colors in each array are played forward then backward.
" To use simply copy to ~/.vim/plugins/ or ~/vimfiles/plugins/.

nnoremap <silent>n nzv:call PulseCursorLine()<cr>
nnoremap <silent>N Nzv:call PulseCursorLine()<cr>

if has('gui_running')
    let g:PulseColorList = ['#C0C0C0', '#A9A9A9' ]
    let g:PulseColorattr = 'guibg'
else
    let g:PulseColorList = [ 'DarkGrey', 'DarkGrey', 'DarkGrey' ]
    let g:PulseColorattr = 'ctermbg'
endif

function! PulseCursorLine()
    for pulse in g:PulseColorList
        execute 'hi CursorLine ' . g:PulseColorattr . '=' . pulse
        redraw
        sleep 20m
    endfor
    for pulse in reverse(copy(g:PulseColorList))
        execute 'hi CursorLine ' . g:PulseColorattr . '=' . pulse
        redraw
        sleep 20m
    endfor
    "execute 'hi CursorLine ' . g:PulseColorattr . '=NONE'
    if &background=="light"
      execute 'hi CursorLine ' . g:PulseColorattr . '=#E6E6FA'
    else
      execute 'hi CursorLine ' . g:PulseColorattr . '=#000000'
    endif
endfunction
