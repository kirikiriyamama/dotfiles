augroup filetypedetect
  autocmd BufNewFile,BufRead Capfile setfiletype ruby
  autocmd BufNewFile,BufRead Guardfile setfiletype ruby
  autocmd BufNewFile,BufRead *.coffee setfiletype coffee
  autocmd BufNewFile,BufRead *.thor setfiletype ruby
  autocmd BufNewFile,BufRead *.template setfiletype json
  autocmd BufNewFile,BufRead *.zshrc setfiletype zsh
  autocmd BufNewFile,BufRead *.zsh-theme setfiletype zsh
augroup END
