return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'neoclide/coc.nvim', branch = 'release',
    config = function()
      require('config/coc')
    end
  }
  use { 'numToStr/Comment.nvim', requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  }
  use 'github/copilot.vim'
  use { 'ctrlpvim/ctrlp.vim',
    config = function()
      vim.g.ctrlp_map = '<Space>p'
      vim.g.ctrlp_show_hidden = true
      vim.g.ctrlp_custom_ignore = '\\.git\\|node_modules\\|tmp/cache'
      vim.g.ctrlp_switch_buffer = 0
    end
  }
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use { 'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({ italic = false })
      vim.opt.background = 'dark'
      vim.opt.termguicolors = true
      vim.cmd('colorscheme gruvbox')
    end
  }
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_first_indent_level = false,
        show_current_context = true,
      })
    end
  }
  use { 'mizlan/iswap.nvim' }
  use { 'nvim-lualine/lualine.nvim', requires = 'neoclide/coc.nvim',
    config = function()
      require('config/lualine')
    end
  }
  use { 'preservim/nerdtree',
    config = function()
      require('config/nerdtree')
    end
  }
  use { 'kevinhwang91/nvim-hlslens', requires = 'rapan931/lasterisk.nvim',
    config = function()
      require('config/hlslens')
    end
  }
  use { 'petertriho/nvim-scrollbar', requires = 'kevinhwang91/nvim-hlslens',
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.search').setup()
    end
  }
  use { 'kylechui/nvim-surround',
   config = function()
     require('nvim-surround').setup()
   end
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    requires = {
      'RRethy/nvim-treesitter-endwise',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('config/treesitter')
    end
  }
  use { 'yssl/QFEnter',
    config = function()
      vim.g.qfenter_keymap = {
        open = { '<CR>' },
        vopen = { '<C-v>' },
        hopen = { '<C-s>' },
      }
      vim.cmd('autocmd FileType qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T')
    end
  }
  use 'junegunn/vim-easy-align'
  use { 'tpope/vim-fugitive', requires = 'tpope/vim-rhubarb',
    config = function()
      vim.g.netrw_browsex_viewer = 'open'
    end
  }
  use 'ludovicchabant/vim-gutentags'

  use { 'vim-scripts/nginx.vim', ft = 'nginx' }
  use 'hashivim/vim-terraform'
  use { 'nelstrom/vim-textobj-rubyblock', ft = 'ruby', requires = 'kana/vim-textobj-user' }
end)
