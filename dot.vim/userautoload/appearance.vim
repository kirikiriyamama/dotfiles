set t_Co=256

set cursorline

augroup CursorLineOnlyCurrentWindow
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set background=dark
let g:solarized_termtrans=1
let g:solarized_diffmode="high"
let g:solarized_contrast="high"
colorscheme solarized

let g:Powerline_symbols="fancy"
set laststatus=2
set runtimepath+=~/.powerline/powerline/bindings/vim

set list
set listchars=tab:>-

set colorcolumn=100

augroup AdditionalHighlights
  autocmd!

  autocmd ColorScheme * highlight TrailingSpaces term=NONE ctermbg=Red
  autocmd Syntax * syntax match TrailingSpaces containedin=ALL /\s\+$/

  autocmd ColorScheme * highlight FullWidthSpace term=NONE ctermbg=Red
  autocmd Syntax * syntax match FullWidthSpace containedin=ALL /　/
augroup END
