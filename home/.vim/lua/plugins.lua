return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-buffer.vim'
  use 'prabirshrestha/asyncomplete-file.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'
  use 'prabirshrestha/asyncomplete-tags.vim'
  use 'ctrlpvim/ctrlp.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'itchyny/lightline.vim'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'altercation/vim-colors-solarized'
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
  use { 'puppetlabs/puppet-syntax-vim', ft = 'puppet' }
  use { 'vim-scripts/ruby-matchit', ft = 'ruby' }
  use 'leafgarland/typescript-vim'
  use { 'kchmck/vim-coffee-script', ft = 'coffee' }
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
