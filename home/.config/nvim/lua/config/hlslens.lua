-- https://github.com/petertriho/nvim-scrollbar/blob/6a2065f/README.md#setup-packer
require('scrollbar.handlers.search').setup({ nearest_only = true })

vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]])
vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]])
vim.keymap.set('n', '*', function()
  require('lasterisk').search()
  require('hlslens').start()
end)
vim.keymap.set({ 'n', 'x' }, 'g*', function()
  require('lasterisk').search({ is_whole = false })
  require('hlslens').start()
end)
