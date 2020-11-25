dotfile 'bin'

directory "#{node[:home]}/bin.local" do
  user node[:user]
end
