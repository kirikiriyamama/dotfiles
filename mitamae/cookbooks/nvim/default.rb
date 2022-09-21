package 'neovim'
include_cookbook 'ctags'

dotfile '.config/nvim'

git "#{node[:home]}/.local/share/nvim/site/pack/packer/start/packer.nvim" do
  repository 'https://github.com/wbthomason/packer.nvim'
  depth 1
  user node[:user]
end
