return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'altercation/vim-colors-solarized'
  use 'itchyny/lightline.vim'
  use 'ctrlpvim/ctrlp.vim'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-surround'
  use 'kana/vim-textobj-user'
  use 'junegunn/vim-easy-align'
  use { 'Shougo/vimproc.vim', run = 'make' }
  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-buffer.vim'
  use 'prabirshrestha/asyncomplete-file.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'
  use 'prabirshrestha/asyncomplete-tags.vim'
  use 'prabirshrestha/vim-lsp'
  use 'mattn/vim-goimports'
  use 'ludovicchabant/vim-gutentags'
  use 'lukas-reineke/indent-blankline.nvim'

  use { 'tpope/vim-markdown', ft = 'markdown' }
  use { 'slim-template/vim-slim', ft = 'slim' }
  use { 'puppetlabs/puppet-syntax-vim', ft = 'puppet' }
  use { 'vim-scripts/nginx.vim', ft = 'nginx' }
  use { 'othree/yajs.vim', ft = 'javascript' }
  use { 'elzr/vim-json', ft = 'json' }
  use { 'kchmck/vim-coffee-script', ft = 'coffee' }
  use { 'tpope/vim-haml', ft = 'haml' }
  use { 'elixir-lang/vim-elixir', ft = 'elixir' }
  use { 'vim-scripts/ruby-matchit', ft = 'ruby' }
  use { 'tpope/vim-endwise', ft = 'ruby' }
  use { 'rhysd/vim-textobj-ruby', ft = 'ruby' }
  use { 'hashivim/vim-terraform', ft = 'terraform' }
  use { 'tmux-plugins/vim-tmux', ft = 'tmux' }
  use { 'othree/html5.vim', ft = 'html' }
  use { 'mrk21/yaml-vim', ft = 'yaml' }
  use { 'google/vim-jsonnet', ft = { 'jsonnet', 'libsonnet' } }
  use 'leafgarland/typescript-vim'
  use { 'styled-components/vim-styled-components', branch = 'main' }
  use 'peitalin/vim-jsx-typescript'
  use { 'jparise/vim-graphql', ft = 'graphql' }
end)
