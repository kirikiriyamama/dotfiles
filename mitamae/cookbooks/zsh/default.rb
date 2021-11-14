package 'zsh'

execute "chsh #{node[:user]} -s /usr/bin/zsh" do
  not_if "test \"$(getent passwd #{node[:user]} | cut -d: -f7)\" = /usr/bin/zsh"
end

dotfile '.dircolors'
dotfile '.zshrc'
dotfile '.zshenv'
dotfile '.zsh.d'
