github_binary 'win32yank.exe' do
  repository 'equalsraf/win32yank'
  version 'v0.0.4'
  asset 'win32yank-x64.zip'

  extract 'unzip win32yank-x64.zip -d win32yank-x64'
  source 'win32yank-x64/win32yank.exe'
end
