set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim.d/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim.d/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim.git'
" NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'remain/ctrlp.vim.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-markdown'

function! g:meet_neocomplete_requirements()
  return has('lua') && ( (v:version == 703 && has('patch885')) || v:version >= 704 )
endfunction

if g:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
endif

syntax on
filetype indent plugin on


source ~/.vim.d/editor.vim
source ~/.vim.d/appearance.vim
source ~/.vim.d/keymaps.vim
source ~/.vim.d/search.vim
source ~/.vim.d/nerdtree.vim
source ~/.vim.d/neocomplete.vim
