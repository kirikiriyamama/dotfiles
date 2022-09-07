return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-buffer.vim'
  use 'prabirshrestha/asyncomplete-file.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'
  use 'prabirshrestha/asyncomplete-tags.vim'
  use 'ctrlpvim/ctrlp.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'itchyny/lightline.vim',
    config = function()
      vim.opt.laststatus = 2
    end
  }
  use { 'scrooloose/nerdtree', requires = { 'Xuyuanp/nerdtree-git-plugin' },
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

        " Exit Vim if NERDTree is the only window left.
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
      ]]

      vim.g.NERDTreeQuitOnOpen = true
      vim.g.NERDTreeShowHidden = true

      vim.g.NERDTreeMapOpenSplit = 's'
      vim.g.NERDTreeMapPreviewSplit = 'gs'
      vim.g.NERDTreeMapOpenVSplit = 'v'
      vim.g.NERDTreeMapPreviewVSplit = 'gv'
      vim.g.NERDTreeMapToggleZoom = 'z'

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
  use { 'altercation/vim-colors-solarized',
    config = function()
      vim.opt.background = 'dark'
      vim.cmd('colorscheme solarized')
    end
  }
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'mattn/vim-goimports'
  use 'ludovicchabant/vim-gutentags'
  use 'prabirshrestha/vim-lsp'
  use { 'Shougo/vimproc.vim', run = 'make' }
  use 'tpope/vim-rhubarb'
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
