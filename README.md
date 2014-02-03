# dotfiles

## Installation
<pre><code>$ git clone https://github.com/remain/dotfiles.git
$ cd dotfiles && ./install.sh

$ vi +NeoBundleInstall +q

$ vi ~/.zshrc.local
+DEFAULT_USER="[your username]"</code></pre>

## Requirements
 * Zsh
 * Git (1.7.2 or more)
 * tmux (1.8 or more)
 * Vim (7.3.885 or more)
 * GNU core utilities
  * See also [Coreutils - GNU core utilities](http://www.gnu.org/software/coreutils/ "Coreutils - GNU core utilities")
  * For OSX
<pre><code>$ brew install coreutils
$ vi ~/.zshrc.local
+PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
</code></pre>
 * Patched font
  * See also [erikw/tmux-powerline](https://github.com/erikw/tmux-powerline "erikw/tmux-powerline")
 * Solarized Dark colorscheme (except cygwin)
  * See also [altercation/solarized](https://github.com/altercation/solarized "altercation/solarized")
