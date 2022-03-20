bin = '/Applications/Alacritty.app'
workdir = '/tmp/alacritty'

package 'rust'

git workdir do
  repository 'https://github.com/alacritty/alacritty.git'
  not_if "test -d #{bin}"
end

execute 'make app' do
  cwd workdir
  not_if "test -d #{bin}"
end

execute "cp -r target/release/osx/Alacritty.app #{bin}" do
  cwd workdir
  not_if "test -d #{bin}"
end

dotfile '.config/alacritty'
cask 'homebrew/cask-fonts/font-ricty-diminished'
