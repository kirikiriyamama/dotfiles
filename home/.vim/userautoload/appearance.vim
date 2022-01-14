set t_Co=256

set background=dark
colorscheme solarized

let g:solarized_termtrans=1
let g:solarized_diffmode="high"
let g:solarized_contrast="high"

set laststatus=2

set number
set colorcolumn=120

set synmaxcol=192

augroup AdditionalHighlights
  autocmd!

  autocmd ColorScheme * highlight TrailingSpaces term=NONE ctermbg=Red
  autocmd Syntax * syntax match TrailingSpaces containedin=ALL /\s\+$/

  autocmd ColorScheme * highlight FullWidthSpace term=NONE ctermbg=Red
  autocmd Syntax * syntax match FullWidthSpace containedin=ALL /　/
augroup END
