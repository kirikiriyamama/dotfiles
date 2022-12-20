asdf = "#{node[:home]}/.asdf"

git asdf do
  repository 'https://github.com/asdf-vm/asdf.git'
  user node[:user]
  not_if "test -d #{asdf}"
end

dotfile '.asdfrc'
