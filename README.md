# dotfiles

## Installation
```
$ git clone https://github.com/kirikiriyamama/dotfiles.git
$ cd dotfiles && ./install.sh

$ vi +NeoBundleInstall +q
```

## Requirements
 * Zsh
 * Git (1.7.2 or more)
 * tmux (1.8 or more)
 * Vim (7.3.885 or more)
 * Python (2.7.4 or more)
 * GNU sed
  * See also [GNU sed](http://www.gnu.org/software/sed/ "GNU sed")
  * For OSX
 * GNU core utilities
  * See also [GNU core utilities](http://www.gnu.org/software/coreutils/ "GNU core utilities")
  * For OSX
<pre><code>$ brew install coreutils
$ vi ~/.zshrc.local
+PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
</code></pre>
