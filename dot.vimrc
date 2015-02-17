function! g:MeetNeocompleteRequirements()
  return has('lua') && ( (v:version == 703 && has('patch885')) || v:version >= 704 )
endfunction

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'kirikiriyamama/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }

NeoBundleLazy 'AndrewRadev/switch.vim', {
\   'autoload' : {
\     'commands' : ['Switch'],
\   },
\ }
NeoBundleLazy 'tpope/vim-markdown', {
\   'autoload' : {
\     'filetypes' : ['markdown'],
\   },
\ }
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : {
\     'commands' : ['VimShell'],
\   },
\ }
NeoBundleLazy 'mbbill/undotree', {
\   'autoload' : {
\     'commands' : ['UndotreeToggle'],
\   },
\ }
NeoBundleLazy 'thinca/vim-quickrun', {
\   'autoload' : {
\     'commands' : ['QuickRun'],
\   },
\ }
NeoBundleLazy 'slim-template/vim-slim', {
\   'autoload' : {
\     'filetypes' : ['slim'],
\   },
\ }
NeoBundleLazy 'puppetlabs/puppet-syntax-vim', {
\   'autoload' : {
\     'filetypes' : ['puppet'],
\   },
\ }
NeoBundleLazy 'vim-scripts/nginx.vim', {
\   'autoload' : {
\     'filetypes' : ['nginx'],
\   },
\ }
NeoBundleLazy 'jnwhiteh/vim-golang', {
\   'autoload' : {
\     'filetypes' : ['go'],
\   },
\ }
NeoBundleLazy 'elzr/vim-json', {
\   'autoload' : {
\     'filetypes' : ['json'],
\   },
\ }
NeoBundleLazy 'kchmck/vim-coffee-script', {
\   'autoload' : {
\     'filetypes' : ['coffee'],
\   },
\ }

if g:MeetNeocompleteRequirements()
  NeoBundle 'Shougo/neocomplete.vim'
endif

syntax on
filetype indent plugin on

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

if g:MeetNeocompleteRequirements()
  source ~/.vim/neocomplete.vim
endif
