"gui tab tooltip {{{
function! InfoGuiTooltip()
  "get window count
  let wincount = tabpagewinnr(tabpagenr(),'$')
  let bufferlist=''
  "get name of active buffers in windows
  "for i in tabpagebuflist()
    "let bufferlist .= '['.fnamemodify(bufname(i),':t').'] '
  "endfor
  "return bufname($) . ' windows: ' . wincount. ' ' . bufferlist . ' '
  return bufname($)
endfunction
set guitabtooltip=%!InfoGuiTooltip()
"}}}

"gui tab label {{{
set guitablabel=%!TabooGuiLabel()
"show guitab tabs
autocmd BufRead,BufNewFile * set guioptions+=e
"}}}

"fold spell {{{
function! FoldSpellBalloon()
  let foldStart = foldclosed(v:beval_lnum )
  let foldEnd = foldclosedend(v:beval_lnum)
  let lines = []
  " Detect if we are in a fold
  if foldStart < 0
    " Detect if we are on a misspelled word
    let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
  else
    " we are in a fold
    let numLines = foldEnd - foldStart + 1
    " if we have too many lines in fold, show only the first 14
    " and the last 14 lines
    if ( numLines > 31 )
      let lines = getline( foldStart, foldStart + 14 )
      let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
      let lines += getline( foldEnd - 14, foldEnd )
    else
      "less than 30 lines, lets show all of them
      let lines = getline( foldStart, foldEnd )
    endif
  endif
  " return result
  return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
if !exists('b:tlib_balloons')
  let b:tlib_balloons=[]
endif
call add(b:tlib_balloons, 'FoldSpellBalloon()')

autocmd BufRead,BufNewFile * set balloonexpr=FoldSpellBalloon()
set ballooneval
"}}}

