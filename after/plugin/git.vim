let g:git_no_map_default=1

cnoremap gd :GitDiff
cnoremap gD :GitDiff --cached
cnoremap gs :GitStatus
cnoremap gl :GitLog
cnoremap ga :GitAdd
cnoremap gA :GitAdd <cfile>
cnoremap gc :GitCommit
cnoremap gp :GitPullRebase
cnoremap gb :GitBlame
