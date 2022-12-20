package 'neovim'

include_cookbook 'ctags'

dotfile '.config/nvim'

packer = "#{node[:home]}/.local/share/nvim/site/pack/packer/start/packer.nvim"

git packer do
  repository 'https://github.com/wbthomason/packer.nvim'
  depth 1
  user node[:user]
  not_if "test -d #{packer}"
end
