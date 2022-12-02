vim.opt.laststatus = 2
vim.opt.showmode = false

local gruvbox = require('lualine.themes.gruvbox')
for _, mode in ipairs({ 'insert', 'visual', 'replace', 'command' }) do
  gruvbox[mode].c.bg = '#3c3836' -- darkgray
  gruvbox[mode].c.fg = '#a89984' -- gray
end

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = gruvbox,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = { 'ctrlp' } },
  },
  sections = {
    lualine_b = { 'g:coc_status', 'gutentags#statusline', 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } }
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 1 } }
  },
})

vim.cmd('autocmd User CocStatusChange,CocDiagnosticChange lua require("lualine").refresh()')
