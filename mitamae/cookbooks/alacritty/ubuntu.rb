bin = '/usr/local/bin/alacritty'
workdir = '/tmp/alacritty'

package 'cargo'

package 'libfontconfig1-dev'
package 'libxcb-xfixes0-dev'

git workdir do
  repository 'https://github.com/alacritty/alacritty.git'
  not_if "test -f #{bin}"
end

execute 'cargo build --release' do
  cwd workdir
  not_if "test -f #{bin}"
end

execute 'tic -xe alacritty,alacritty-direct extra/alacritty.info' do
  cwd workdir
  not_if "test -f #{bin}"
end

execute 'cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg' do
  cwd workdir
  not_if "test -f #{bin}"
end

execute 'desktop-file-install extra/linux/Alacritty.desktop && update-desktop-database' do
  cwd workdir
  not_if "test -f #{bin}"
end

execute "cp target/release/alacritty #{bin}" do
  cwd workdir
  not_if "test -f #{bin}"
end

dotfile '.config/alacritty'
package 'fonts-ricty-diminished'
