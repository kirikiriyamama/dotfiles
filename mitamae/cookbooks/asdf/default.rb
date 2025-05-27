version = 'v0.17.0'
asset = "asdf-#{version}-linux-amd64.tar.gz"

github_binary 'asdf' do
  repository 'asdf-vm/asdf'
  version version
  asset asset
  extract "tar -xzf #{asset}"
end

dotfile '.asdfrc'
