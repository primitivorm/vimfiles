"eclim configuration
"let g:EclimCompletionMethod = 'omnifunc'
"let g:acp_behaviorJavaEclimLength = 3
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

"function MeetsForJavaEclim(context)
  "return g:acp_behaviorJavaEclimLength >= 0 &&
        "\ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
"endfunction

"let g:acp_behavior = {
    "\ 'java': [{
      "\ 'command': "\<c-x>\<c-u>",
      "\ 'completefunc' : 'eclim#java#complete#CodeComplete',
      "\ 'meets'        : 'MeetsForJavaEclim',
    "\ }]
  "\ }

""to trace error set
""let g:EclimLogLevel = 'trace'
"set guioptions-=m " turn off menu bar
"set guioptions-=T " turn off toolbar
"set guioptions-=L " turn off left scrollbar
"set guioptions-=l
"" maps Ctrl-F6 to eclipse's Ctrl-F6 key binding (switch editors)
"nmap <silent> <c-f6> :call eclim#vimplugin#FeedKeys('Ctrl+F6')<cr>

"" maps Ctrl-F7 to eclipse's Ctrl-F7 key binding (switch views)
"nmap <silent> <c-f7> :call eclim#vimplugin#FeedKeys('Ctrl+F7')<cr>

"" maps Ctrl-F to eclipse's Ctrl-Shift-R key binding (find resource)
"nmap <silent> <c-f> :call eclim#vimplugin#FeedKeys('Ctrl+Shift+R')<cr>

"" maps Ctrl-M to eclipse's Ctrl-M binding to maximize the editor
"nmap <silent> <c-m> :call eclim#vimplugin#FeedKeys('Ctrl+M', 1)<cr>
