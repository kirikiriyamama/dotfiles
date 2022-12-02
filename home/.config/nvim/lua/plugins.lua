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
  use { 'nvim-lualine/lualine.nvim',
    config = function()
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
    end
  }
  use { 'preservim/nerdtree',
    config = function()
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
    end
  }
  use { 'kevinhwang91/nvim-hlslens', requires = 'rapan931/lasterisk.nvim',
    config = function()
      local kopts = { silent = true }

      vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]], kopts)
      vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]], kopts)
      vim.keymap.set('n', '*', function()
        require('lasterisk').search()
        require('hlslens').start()
      end)
      vim.keymap.set({ 'n', 'x' }, 'g*', function()
        require('lasterisk').search({ is_whole = false })
        require('hlslens').start()
      end, kopts)
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
