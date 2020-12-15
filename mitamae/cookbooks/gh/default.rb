ver = '1.3.1'
arch = 'amd64'

deb 'gh' do
  url "https://github.com/cli/cli/releases/download/v#{ver}/gh_#{ver}_linux_#{arch}.deb"
  version ver
end
