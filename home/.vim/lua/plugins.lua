return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'neoclide/coc.nvim', branch = 'release',
    config = function()
      require('coc')
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
      })
    end
  }
  use { 'itchyny/lightline.vim',
    config = function()
      vim.opt.laststatus = 2
    end
  }
  use { 'preservim/nerdtree', requires = { 'Xuyuanp/nerdtree-git-plugin' },
    config = function()
      vim.cmd [[
        " Mirror the NERDTree before showing it. This makes it the same on all tabs.
        function! s:toggle()
          if g:NERDTree.IsOpen()
            NERDTreeClose
          else
            NERDTreeMirror
            NERDTreeFocus
          endif
        endfunction
        nnoremap <silent> <Space>e :call <SID>toggle()<CR>

        " Close the tab if NERDTree is the only window remaining in it.
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
      ]]

      vim.g.NERDTreeQuitOnOpen = true
      vim.g.NERDTreeShowHidden = true

      vim.g.NERDTreeMapOpenSplit = 's'
      vim.g.NERDTreeMapOpenVSplit = 'v'
      vim.g.NERDTreeMapToggleZoom = 'z'

      vim.g.NERDTreeCustomOpenArgs = { file = { where = 'p' }, dir = vim.empty_dict() }

      vim.g.NERDTreeGitStatusIndicatorMapCustom = {
        Modified  = 'M',
        Staged    = 'A',
        Untracked = '?',
        Renamed   = 'R',
        Unmerged  = 'U',
        Deleted   = 'D',
        Dirty     = 'x',
        Unknown   = '',
      }
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
  use { 'airblade/vim-gitgutter',
    config = function()
      vim.g.gitgutter_map_keys = 0
    end
  }
  use 'ludovicchabant/vim-gutentags'
  use 'tpope/vim-surround'
  use 'kana/vim-textobj-user'

  use { 'othree/html5.vim', ft = 'html' }
  use { 'vim-scripts/nginx.vim', ft = 'nginx' }
  use { 'vim-scripts/ruby-matchit', ft = 'ruby' }
  use 'leafgarland/typescript-vim'
  use { 'elixir-lang/vim-elixir', ft = 'elixir' }
  use { 'tpope/vim-endwise', ft = 'ruby' }
  use { 'jparise/vim-graphql', ft = 'graphql' }
  use { 'tpope/vim-haml', ft = 'haml' }
  use { 'elzr/vim-json', ft = 'json' }
  use { 'google/vim-jsonnet', ft = { 'jsonnet', 'libsonnet' } }
  use 'peitalin/vim-jsx-typescript'
  use { 'tpope/vim-markdown', ft = 'markdown' }
  use { 'slim-template/vim-slim', ft = 'slim' }
  use { 'styled-components/vim-styled-components', branch = 'main' }
  use { 'hashivim/vim-terraform', ft = 'terraform' }
  use { 'rhysd/vim-textobj-ruby', ft = 'ruby' }
  use { 'tmux-plugins/vim-tmux', ft = 'tmux' }
  use { 'othree/yajs.vim', ft = 'javascript' }
  use { 'mrk21/yaml-vim', ft = 'yaml' }
end)
