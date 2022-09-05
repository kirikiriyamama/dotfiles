require('plugins')

vim.cmd('syntax on')

vim.opt.number = true
vim.opt.colorcolumn = '120'
vim.opt.synmaxcol = 256

vim.cmd [[
  augroup AdditionalHighlights
    autocmd!

    autocmd ColorScheme * highlight TrailingSpaces term=NONE ctermbg=Red
    autocmd Syntax * syntax match TrailingSpaces containedin=ALL /\s\+$/

    autocmd ColorScheme * highlight FullWidthSpace term=NONE ctermbg=Red
    autocmd Syntax * syntax match FullWidthSpace containedin=ALL /　/
  augroup END
]]
