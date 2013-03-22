" Vim script
" Last Change: Sept 15, 2010
" Author: Andrew Mcveigh
" URL: http://andrewmcveigh.com
" License: ---
" Version: 0.1
" Uses closepairs.vim as a starting point

if !exists('g:load_pairs')
  let g:load_pairs = 1
endif

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

nnoremap <LEADER>90 ma%v?[\]\}\)]<CR>lx``v/[\[\{\(]<CR>hx:nohl<CR>
nnoremap <LEADER>() ma%x``x

nnoremap <LEADER>i( :call FindBracket()<CR>"zc%( <C-R>z)<ESC>%mz=%`za
nnoremap <LEADER>i) :call FindBracket()<CR>"zc%(<C-R>z )<ESC>mz=%`zi
nnoremap <LEADER>i9 :call FindBracket()<CR>"zc%( <C-R>z)<ESC>%mz=%`za
nnoremap <LEADER>i0 :call FindBracket()<CR>"zc%(<C-R>z )<ESC>mz=%`zi
nnoremap <LEADER>i[ :call FindBracket()<CR>"zc%[ <C-R>z]<ESC>%mz=%`za
nnoremap <LEADER>i] :call FindBracket()<CR>"zc%[<C-R>z ]<ESC>mz=%`zi
nnoremap <LEADER>i{ :call FindBracket()<CR>"zc%{ <C-R>z}<ESC>%mz=%`za
nnoremap <LEADER>i} :call FindBracket()<CR>"zc%{<C-R>z }<ESC>mz=%`zi

nnoremap <LEADER>w( "zciw( <C-R>z)<ESC>%a
nnoremap <LEADER>w) "zciw(<C-R>z )<ESC>i
nnoremap <LEADER>w9 "zciw( <C-R>z)<ESC>%a
nnoremap <LEADER>w0 "zciw(<C-R>z )<ESC>i
nnoremap <LEADER>w[ "zciw[ <C-R>z]<ESC>%a
nnoremap <LEADER>w] "zciw[<C-R>z ]<ESC>i
nnoremap <LEADER>w{ "zciw{ <C-R>z}<ESC>%a
nnoremap <LEADER>w} "zciw{<C-R>z }<ESC>i

vnoremap <LEADER>w( "zc( <C-R>z)<ESC>%a
vnoremap <LEADER>w) "zc(<C-R>z )<ESC>i
vnoremap <LEADER>i9 "zc( <C-R>z)<ESC>%a
vnoremap <LEADER>i0 "zc(<C-R>z )<ESC>i
vnoremap <LEADER>w[ "zc[ <C-R>z]<ESC>%a
vnoremap <LEADER>w] "zc[<C-R>z ]<ESC>i
vnoremap <LEADER>w{ "zc{ <C-R>z}<ESC>%a
vnoremap <LEADER>w} "zc{<C-R>z }<ESC>i

nnoremap <LEADER>r( ma%r)``r(
nnoremap <LEADER>r[ ma%r]``r[
nnoremap <LEADER>r{ ma%r}``r{

"inoremap <C-9> <ESC>F("zd%i( <C-R>z)<ESC>%a


function! FindNextBracketBackward(line_nr, column)
  call search('\v[\(\[\{]', 'b')
  normal %
  if getpos('.')[1] < a:line_nr || (getpos('.')[1] <= a:line_nr && col('.') < a:column)
    normal %
    call FindNextBracketBackward(a:line_nr, a:column)
  endif
endfunction

function! FindBracket()
    let line = getline('.')
    let line_nr = getpos('.')[1]
    let column = col('.')
" if not on a bracket
    if index(['(',')','[',']','{','}'], line[column - 1]) <= -1
        call FindNextBracketBackward(line_nr, column)
    endif
    nohl
endfunction

nnoremap <LEADER>hb viw"zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:b <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hp ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:p <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hli ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:li <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh1 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h1 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh2 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h2 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh3 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h3 <ESC>F[i <ESC>l%a <ESC>
nnoremap <LEADER>hh4 ^v$h"zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h4 <ESC>F[i <ESC>l%a <ESC>

vnoremap <LEADER>hb "zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:b <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hu "zdi"<C-R>z"<ESC>hvi""zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:u <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hp "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:p <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>ha "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:a <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hli "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:li <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh1 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h1 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh2 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h2 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh3 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h3 <ESC>F[i <ESC>l%a <ESC>
vnoremap <LEADER>hh4 "zdi[<C-R>z]<ESC>vi]"zdi"<C-R>z"<ESC>%a:h4 <ESC>F[i <ESC>l%a <ESC>

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
" Do Linux-specific stuff.
    inoremap <M-(> (
    inoremap <M-)> (<esc><right>%a)<esc>%a
    inoremap <M-[> [
    inoremap <M-]> [<esc><right>%a]<esc>%a
    inoremap <M-{>{ {
    inoremap <M-}>} {<esc><right>%a}<esc>%a
else
" MacVim Mappings
    inoremap <D-(> (
    inoremap <D-)> (<esc><right>%a)<esc>%a
    inoremap <D-[> [
    inoremap <D-]> [<esc><right>%a]<esc>%a
    inoremap <D-[><D-[> {
    inoremap <D-]><D-]> {<esc><right>%a}<esc>%a
endif

vnoremap <leader>" "zc"<C-R>z"
vnoremap <leader>' "zc'<C-R>z'
vnoremap <leader>( "zc(<C-R>z)
vnoremap <leader>[ "zc[<C-R>z]
vnoremap <leader>{ "zc{<C-R>z}

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

"inoremap <expr> " <SID>pairquotes('"')
"inoremap <expr> '' <SID>pairquotes("'")

function! s:CommentOut()
  if g:ft_check == "clojure"
    return " ?[\[\{\(]\<CR>ma%a)\<ESC>``i(comment \<ESC>:nohl"
  endif
endfunction


function! s:delpair()
let l:lst = ['""',"''",'{}','[]','()']
let l:col = col('.')
let l:line = getline('.')
let l:chr = l:line[l:col-2 : l:col-1]
if index(l:lst, l:chr) > -1
return "\<bs>\<del>"
else
let l:chr = l:line[l:col-3:l:col-2]
if (index(l:lst, l:chr)) > - 1
return "\<bs>\<bs>"
endif
return "\<bs>"
endfunction

function! s:escapepair(right)
let l:col = col('.')
let l:chr = getline('.')[l:col-1]
if a:right == l:chr
return "\<right>"
else
return a:right
endfunction

function! s:pairquotes(pair)
let l:col = col('.')
let l:line = getline('.')
let l:chr = l:line[l:col-1]
if a:pair == l:chr
return "\<right>"
else
return a:pair.a:pair."\<left>"
endfunction

" vim: ts=2 sw=2 softtabstop=2 et
if !exists('g:ft_check')
  let g:ft_check = ""
endif

au FileType clojure let g:ft_check = "clojure"
au FileType javascript let g:ft_check = "javascript"
au FileType javascript.jquery let g:ft_check = "javascript"
au FileType cs let g:ft_check = "csharp"

nmap <expr> <LEADER>rrg <SID>GlobalRename()
vnoremap <LEADER>jsb "zc{<CR><C-R>z}<ESC>=i{bi
vnoremap <LEADER>jsi "zcif (<C-R>z) {<CR>}<ESC>=i{O

nnoremap <LEADER>rrr yiw(v%:s/<C-R>"//gc<LEFT><LEFT><LEFT>

function! ExtractFunctionClj()
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  call FindBracket()
  let space = empty(params) ? "" : " "
  silent exec "normal \"zc%(".name.space.params.")\<ESC>{o(defn ".name." [".params."]\<CR>\<C-R>z)\<CR>\<ESC>kvip=/(".name.space.params.")\<CR>"
endfunction

function! DefThisSExp()
  let name = input("Name of def: ")
  call FindBracket()
  silent exec "normal \"zc%".name."\<ESC>{o(def ".name."\<CR>\<C-R>z)\<CR>\<ESC>kvip=/".name."\<CR>*"
endfunction

function! ExtractMethodCSharp()
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  exe "\"+d?public void<CR>/{<CR>%o<CR>public void ".name."() {<ESC>po}"
endfunction

function! ExtractFunctionJS(text, lastchar)
  let name = input("Name of new method: ")
  let params = input("Params to pass: ")
  let visual_line = !empty(matchstr(a:text, '\c\n$'))
  let returnstr = ""
  if a:lastchar == "="
    let returnstr = "return "
  endif
  if visual_line
    exe "normal! O_this." . name . "(" . params . ");\<ESC>?this\..*{\nOthis." . name . " = function(" . params .") {};\<ESC>hi\<CR>" . returnstr . a:text . "\<ESC>vip=f{%o"
  else
    exe "normal! a _this." . name . "(" . params . ");\<CR>\<ESC>?this\..*{\nOthis." . name . " = function(" . params .") {};\<ESC>hi\<CR>" . returnstr . a:text . "\<CR>\<ESC>vip=f{%o"
  endif
endfunction

if g:ft_check == "javascript"
  vmap <LEADER>rem "rd?\S<CR>"ly :call ExtractFunctionJS(@r, @l)<CR>
endif

function! ExtractMethod()
  if g:ft_check == "clojure"
    call ExtractFunctionClj()
  elseif g:ft_check == "csharp"
    call ExtractMethodCSharp()
  endif
endfunction

nnoremap <LEADER>rem :call ExtractMethod()<CR>
nmap <LEADER>def :call DefThisSExp()<CR>


function! s:GlobalRename()
  let new_name = input("Global Rename:- new name of symbol?: ")
  return "gD:%s/\<C-R>//" . new_name . "/gc\<CR>"
endfunction

function! ReorderParams(params)
  let params = split(a:params, ',\s')
  let order = input(string(map(copy(params), 'v:key + 1 . ": " . v:val')))
  let @" = join(map(split(order, '[0-9]\zs'), 'params[str2nr(v:val) - 1]'), ', ')
  normal P
endfunction
nmap <LEADER>rrp di(:call ReorderParams(@")<CR>

" vim: ts=2 sw=2 softtabstop=2 et 

