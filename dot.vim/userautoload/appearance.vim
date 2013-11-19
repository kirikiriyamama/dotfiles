set t_Co=256

set cursorline
autocmd ColorScheme * highlight clear CursorLine
autocmd ColorScheme * highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

augroup CursorLineOnlyCurrentWindow
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set background=dark
colorscheme solarized

let g:Powerline_symbols='fancy'
set laststatus=2

set list
set listchars=tab:>-

augroup AdditionalHighlights
  autocmd!

  autocmd ColorScheme * highlight TrailingSpaces term=NONE ctermbg=Red
  autocmd Syntax * syntax match TrailingSpaces containedin=ALL /\s\+$/

  autocmd ColorScheme * highlight FullWidthSpace term=NONE ctermbg=Red
  autocmd Syntax * syntax match FullWidthSpace containedin=ALL /　/
augroup END
