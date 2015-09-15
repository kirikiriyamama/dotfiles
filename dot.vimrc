filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'KazuakiM/vim-qfstatusline'
NeoBundle 'jceb/vim-hier'
NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
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
NeoBundleLazy 'rking/ag.vim', {
\   'autoload' : {
\     'commands' : ['Ag'],
\   },
\ }
NeoBundleLazy 'thinca/vim-quickrun', {
\   'autoload' : {
\     'commands' : ['QuickRun'],
\   },
\ }

NeoBundleLazy 'tpope/vim-markdown', {
\   'autoload' : {
\     'filetypes' : ['markdown'],
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
NeoBundleLazy 'tpope/vim-haml', {
\   'autoload' : {
\     'filetypes' : ['haml'],
\   },
\ }
NeoBundleLazy 'elixir-lang/vim-elixir', {
\   'autoload' : {
\     'filetypes' : ['elixir'],
\   },
\ }
NeoBundleLazy 'vim-scripts/ruby-matchit', {
\   'autoload' : {
\     'filetypes' : ['ruby'],
\   },
\ }
NeoBundleLazy 'tpope/vim-endwise', {
\   'autoload' : {
\     'filetypes' : ['ruby'],
\   },
\ }

syntax on
filetype indent plugin on

set runtimepath+=~/.vim/
runtime! userautoload/*.vim
