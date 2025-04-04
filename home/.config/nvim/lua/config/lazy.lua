-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'neoclide/coc.nvim',
      branch = 'release',
      init = function()
        require('config/coc')
      end,
    },
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
      end,
    },
    {
      'ctrlpvim/ctrlp.vim',
      init = function()
        vim.g.ctrlp_map = '<Space>p'
        vim.g.ctrlp_show_hidden = true
        vim.g.ctrlp_custom_ignore = '\\.git\\|node_modules\\|tmp/cache'
        vim.g.ctrlp_switch_buffer = 0
      end,
    },
    {
      'lewis6991/gitsigns.nvim',
    },
    {
      'ellisonleao/gruvbox.nvim',
      priority = 1000,
      config = function()
        require('gruvbox').setup({
          italic = {
            strings = false,
            operators = false,
            comments = false,
          }
        })
        vim.opt.background = 'dark'
        vim.opt.termguicolors = true
        vim.cmd('colorscheme gruvbox')
      end,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('ibl').setup({
          scope = { show_start = false, show_end = false }
        })

        local hooks = require('ibl.hooks')
        hooks.register(
          hooks.type.WHITESPACE,
          hooks.builtin.hide_first_space_indent_level
        )
      end,
    },
    {
      'mizlan/iswap.nvim',
    },
    {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('config/lualine')
      end,
    },
    {
      'preservim/nerdtree',
      init = function()
        require('config/nerdtree')
      end,
    },
    {
      'kevinhwang91/nvim-hlslens',
      dependencies = { 'rapan931/lasterisk.nvim' },
      config = function()
        require('config/hlslens')
      end,
    },
    {
      'petertriho/nvim-scrollbar',
      config = function()
        require('scrollbar').setup()
      end,
    },
    {
      'kylechui/nvim-surround',
      config = function()
        require('nvim-surround').setup()
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      dependencies = {
        'RRethy/nvim-treesitter-endwise',
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      config = function()
        require('config/treesitter')
      end,
    },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup({
          enable_autocmd = false,
        })
      end,
    },
    {
      'yssl/QFEnter',
      init = function()
        vim.g.qfenter_keymap = {
          open = { '<CR>' },
          vopen = { '<C-v>' },
          hopen = { '<C-s>' },
        }
        vim.cmd('autocmd FileType qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T')
      end,
    },
    {
      'junegunn/vim-easy-align',
    },
    {
      'tpope/vim-fugitive',
      dependencies = { 'tpope/vim-rhubarb' },
      init = function()
        vim.g.netrw_browsex_viewer = 'open'
      end
    },
    {
      'ludovicchabant/vim-gutentags',
    },

    {
      'vim-scripts/nginx.vim',
      ft = 'nginx',
    },
    {
      'hashivim/vim-terraform',
      ft = 'terraform',
    },
    {
      'nelstrom/vim-textobj-rubyblock',
      ft = 'ruby',
      dependencies = { 'kana/vim-textobj-user' },
    },
  },
  -- automatically check for plugin updates
  ui = {
    icons = {
      cmd = '',
      config = '',
      -- debug
      event = '',
      -- favorite
      ft = '',
      init = '',
      -- import
      keys = '',
      -- lazy
      -- loaded
      -- not_loaded
      plugin = '',
      runtime = '',
      require = '',
      source = '',
      start = '',
      -- task = '',
      lazy = '',
      list = { '*', '*', '*', '*' },
    },
  },
})
