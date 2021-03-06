" ~/vimfiles/sessions/core.vim: Vim session script.
" Created by session.vim 1.5 on 16 abril 2013 at 16:57:23.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrLtT
silent! set guifont=Ubuntu_Mono_for_powerline:h11:cANSI
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'eclipse' | colorscheme eclipse | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd C:\inetpub\wwwroot\AUTOMARSH_SitiosEsp\Framework35\MMC.AutoMarsh.Core\MMC.AutoMarsh.Core.Entities
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +10 C:/inetpub/wwwroot/AUTOMARSH_SitiosEsp/Framework35/MMC.AutoMarsh.Core/MMC.AutoMarsh.Core.Entities/Direccion.cs
badd +0 C:/inetpub/wwwroot/AUTOMARSH_SitiosEsp/Framework35/MMC.AutoMarsh.Core/MMC.AutoMarsh.Core.Entities/Error.cs
args /inetpub/wwwroot/AUTOMARSH_SitiosEsp/Framework35/MMC.AutoMarsh.Core/MMC.AutoMarsh.Core.sln
set lines=49 columns=177
edit C:/inetpub/wwwroot/AUTOMARSH_SitiosEsp/Framework35/MMC.AutoMarsh.Core/MMC.AutoMarsh.Core.Entities/Error.cs
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 1 + 24) / 49)
exe '2resize ' . ((&lines * 44 + 24) / 49)
argglobal
enew
file C:/inetpub/wwwroot/AUTOMARSH_SitiosEsp/Framework35/MMC.AutoMarsh.Core/MMC.AutoMarsh.Core.Entities/-MiniBufExplorer-
setlocal fdm=marker
setlocal fde=0
setlocal fmr={,}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal fen
wincmd w
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={,}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 1 + 24) / 49)
exe '2resize ' . ((&lines * 44 + 24) / 49)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
2wincmd w

" vim: ft=vim ro nowrap smc=128
