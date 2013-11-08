function! g:meet_neocomplete_requirements()
  return has('lua') && ( (v:version == 703 && has('patch885')) || v:version >= 704 )
endfunction


set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'remain/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/YankRing.vim'

if g:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neosnippet.vim'
endif

syntax on
filetype indent plugin on


set runtimepath+=~/.vim/
runtime! userautoload/*.vim

if g:meet_neocomplete_requirements()
  source ~/.vim/neocomplete.vim
  source ~/.vim/neosnippet.vim
endif
