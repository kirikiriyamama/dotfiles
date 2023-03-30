package 'ibus'
aur 'ibus-qt'
aur 'ibus-mozc'

remote_file "#{node[:home]}/.config/environment.d/im.conf" do
  source 'files/im.conf'
  mode '644'
end
