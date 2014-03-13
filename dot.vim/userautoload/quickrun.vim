let g:quickrun_config = {
\   '_' : {
\     'hook/time/enable' : 1,
\     'runner' : 'vimproc',
\     'runner/vimproc/updatetime' : 60,
\     'outputter/buffer/split' : ':botright',
\   }
\ }

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <Space>q :QuickRun<Space>
