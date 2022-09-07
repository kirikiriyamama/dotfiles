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

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5

vim.opt.lazyredraw = true
vim.opt.ttyfast = true

vim.opt.autoread = true
vim.opt.swapfile = false

vim.cmd [[
  autocmd QuickFixCmdPost *grep* if len(getqflist()) != 0 | tabnew | copen | endif
  autocmd bufenter * if (winnr("$") == 1 && &filetype == 'qf') | q | endif
]]
