git "#{node[:home]}/.asdf" do
  repository 'https://github.com/asdf-vm/asdf.git'
  user node[:user]
end

dotfile '.asdfrc'

# For Ruby
package 'libreadline-dev'
package 'zlib1g-dev'
