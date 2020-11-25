package 'neovim'

dotfile '.config/nvim'

execute 'nvim +PlugInstall +qa' do
  user node[:user]
  not_if "test -d #{node[:home]}/.config/nvim/plugged"
end
