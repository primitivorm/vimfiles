function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

function! s:swap_visual_up()
  let b = line("'<") - 1
  if (b + 1) == 1
    return
  endif
  let e = line("'>")
  exec b . "m" . e
  exec "normal! gv"
endfunction

function! s:swap_visual_down()
  let b = line("'>") + 1
  let e = line("'<") - 1
  if (b - 1) == line('$')
    return
  endif
  exec b . "m" . e
  exec "normal! gv"
endfunction

nnoremap <silent> <c-s-up> :call <SID>swap_up()<CR>
nnoremap <silent> <c-s-down> :call <SID>swap_down()<CR>
vnoremap <silent> <c-s-up> <esc>:call <SID>swap_visual_up()<CR>
vnoremap <silent> <c-s-down> <esc>:call <SID>swap_visual_down()<CR>
