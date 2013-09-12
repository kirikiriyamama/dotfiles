set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
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

function! g:meet_neocomplete_requirements()
  return has('lua') && v:version >= 703 && has('patch885')
endfunction

if g:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
endif

syntax on
filetype indent plugin on


source ~/.vim/editor.vim
source ~/.vim/appearance.vim
source ~/.vim/keymaps.vim
source ~/.vim/search.vim
source ~/.vim/misc.vim
source ~/.vim/nerdtree.vim
source ~/.vim/neocomplete.vim
