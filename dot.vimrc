set runtimepath+=~/.vim/
runtime! vim-plug/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'wakatime/vim-wakatime'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'KazuakiM/vim-qfstatusline'
Plug 'jceb/vim-hier'
Plug 'dannyob/quickfixstatus'
Plug 'Shougo/vimproc', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'thinca/vim-quickrun'
Plug 'Shougo/neocomplete'
Plug 'tpope/vim-rails'
Plug 'soramugi/auto-ctags.vim'

Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'puppetlabs/puppet-syntax-vim', { 'for': 'puppet' }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'jnwhiteh/vim-golang', { 'for': 'go' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mrk21/yaml-vim', { 'for': 'yaml' }

call plug#end()

syntax on
filetype indent plugin on

runtime! userautoload/*.vim
