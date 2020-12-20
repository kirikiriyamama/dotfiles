version = '0.0.4'
url = "https://github.com/equalsraf/win32yank/releases/download/v#{version}/win32yank-x64.zip"

workdir = '/tmp'
bin = '/usr/local/bin/win32yank.exe'

execute "curl -fsSLo #{workdir}/win32yank-x64.zip #{url}" do
  not_if "test -f #{bin}"
end

execute "unzip #{workdir}/win32yank-x64.zip -d #{workdir}/win32yank-x64" do
  not_if "test -f #{bin}"
end

execute "mv #{workdir}/win32yank-x64/win32yank.exe #{bin} && chmod +x #{bin}" do
  not_if "test -f #{bin}"
end
