augroup lsp_go
  au!
  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'go-lang',
    \ 'cmd': { server_info -> ['gopls', '-remote=auto', '-remote.listen.timeout=0'] },
    \ 'allowlist': ['go'],
    \ })
augroup END


function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
