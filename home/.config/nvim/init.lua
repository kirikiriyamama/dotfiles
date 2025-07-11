vim.cmd('syntax on')

vim.opt.mouse = ''

vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.cursorline = true

vim.cmd [[
  augroup AdditionalHighlights
    autocmd!

    autocmd ColorScheme * highlight TrailingSpaces term=NONE ctermbg=Red guibg=#cc241d
    autocmd Syntax * syntax match TrailingSpaces containedin=ALL /\s\+$/

    autocmd ColorScheme * highlight FullWidthSpace term=NONE ctermbg=Red guibg=#cc241d
    autocmd Syntax * syntax match FullWidthSpace containedin=ALL /　/

    autocmd Syntax * call matchadd('Todo', '\W\zs\(FIXME\|NOTE\|TODO\)')
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
  augroup qf
    autocmd!

    autocmd FileType qf set wrap

    autocmd QuickFixCmdPost *grep* if len(getqflist()) != 0 | tabnew | copen | endif
    autocmd bufenter * if (winnr("$") == 1 && &filetype == 'qf') | q | endif
  augroup END
]]

for _, map in ipairs({
  { 'n', 'ZZ', '<Nop>' },
  { 'n', 'ZQ', '<Nop>' },
  { 'n', 'Q', '<Nop>' },
  { 'n', ';', ':' },
  { 'n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true } },
  { 'n', '<C-c>', '<Nop>' },
  { 'i', '<C-c>', '<Nop>' },
  { 'n', '<C-w>c', '<Nop>' },
  { 'n', '<C-w><C-n>', '<Nop>' },
  { 'n', '<C-w>n', 'gt' },
  { 'n', '<C-w>p', 'gT' },
  { 'n', '<C-w>z', '<C-w>_<C-w>|' },
  { 'n', '<C-]>', 'g<C-]>' },
  { 'n', '<C-w><C-]>', '<C-w>g<C-]>' },
  { 'c', '<C-b>', '<Left>' },
  { 'c', '<C-f>', '<Right>' },
  { 'c', '<C-a>', '<Home>' },
  { 'c', '<C-e>', 'wildmenumode() ? "<C-e>" : "<End>"', { expr = true } },
  { 'c', '<C-d>', '<Del>' },
  { 'c', '<C-k>', '<Nop>' },
  { 'c', '<C-u>', '<End><C-u>' },
}) do
  vim.keymap.set(map[1], map[2], map[3], map[4])
end

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = false

require('config/lazy')
