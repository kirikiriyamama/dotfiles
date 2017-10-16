let g:quickrun_config = {
\   'watchdogs_checker/_' : {
\     'outputter/quickfix/open_cmd': '',
\     'hook/qfstatusline_update/enable_exit':   1,
\     'hook/qfstatusline_update/priority_exit': 4,
\   },
\ }
call watchdogs#setup(g:quickrun_config)

let g:Qfstatusline#Text = 0
let g:Qfstatusline#UpdateCmd = function('lightline#update')

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enable_on_wq = 0
