version = '1.27.4'
url = "https://github.com/docker/compose/releases/download/#{version}/docker-compose-$(uname -s)-$(uname -m)"

bin = '/usr/local/bin/docker-compose'

execute "curl -fsSLo #{bin} #{url} && chmod +x #{bin}" do
  not_if "test -f #{bin}"
end
