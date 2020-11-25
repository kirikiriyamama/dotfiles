version = '1.1.0'
arch = 'amd64'

deb 'gh' do
  url "https://github.com/cli/cli/releases/download/v#{version}/gh_#{version}_linux_#{arch}.deb"
end
