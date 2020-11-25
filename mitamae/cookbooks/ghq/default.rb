name = 'ghq_linux_amd64'
version = '1.1.5'
url = "https://github.com/x-motemen/ghq/releases/download/v#{version}/#{name}.zip"

bin = '/usr/local/bin/ghq'
workdir = '/tmp'

execute 'fetch' do
  command "curl -fsSLo #{workdir}/#{name}.zip #{url}"
  not_if "test -f #{bin}"
end

execute 'extract' do
  command "unzip #{workdir}/#{name}.zip -d #{workdir}"
  not_if "test -f #{bin}"
end

execute 'install' do
  command "mv #{workdir}/#{name}/ghq #{bin}"
  not_if "test -f #{bin}"
end
