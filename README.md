# dotfiles

## Installation
```
$ git clone https://github.com/kirikiriyamama/dotfiles.git
$ cd dotfiles && ./install.sh

$ vim +NeoBundleInstall +q
```

## Requirements
 * Zsh
 * Git
 * tmux
 * Vim
 * GNU sed
  * See also [GNU sed](http://www.gnu.org/software/sed/)
  * For OSX
 * GNU core utilities
  * See also [GNU core utilities](http://www.gnu.org/software/coreutils/)
  * For OSX
<pre><code>$ brew install coreutils
$ vim ~/.zshrc.local
+PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
</code></pre>
