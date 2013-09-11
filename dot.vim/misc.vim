nmap ; :

nnoremap ! :Switch<CR>

autocmd BufWritePre * :%s/\s\+$//ge
