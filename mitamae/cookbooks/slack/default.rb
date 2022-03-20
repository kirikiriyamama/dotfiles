case node[:platform]
when 'darwin'
  cask 'slack'
else
  version = '4.10.0'
  arch = 'amd64'

  deb 'slack-desktop' do
    url "https://downloads.slack-edge.com/linux_releases/slack-desktop-#{version}-#{arch}.deb"
  end
end
