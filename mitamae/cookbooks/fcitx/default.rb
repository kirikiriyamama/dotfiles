package 'fcitx5-im'
package 'fcitx5-mozc'

remote_file "#{node[:home]}/.config/environment.d/im.conf" do
  source 'files/im.conf'
  mode '644'
end
