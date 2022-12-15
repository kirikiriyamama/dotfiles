package 'fcitx5-im'
package 'fcitx5-mozc'

remote_file "#{node[:home]}/.config/environment.d/fcitx.conf" do
  source 'files/fcitx.conf'
  mode '644'
end
