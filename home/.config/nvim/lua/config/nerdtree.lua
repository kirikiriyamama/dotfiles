vim.cmd [[
  " Close the tab if NERDTree is the only window remaining in it.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]

vim.keymap.set('n', '<Space>e', 'g:NERDTree.IsOpen() ? ":NERDTreeClose<CR>" : ":NERDTreeFind<CR>"', { silent = true, expr = true })

vim.g.NERDTreeQuitOnOpen = true
vim.g.NERDTreeShowHidden = true

vim.g.NERDTreeMapOpenSplit = '<C-s>'
vim.g.NERDTreeMapOpenVSplit = '<C-v>'
vim.g.NERDTreeMapOpenInTab = '<C-t>'
vim.g.NERDTreeMapToggleZoom = 'z'

vim.g.NERDTreeCustomOpenArgs = { file = { where = 'p' }, dir = vim.empty_dict() }
