workdir = '/tmp'
dest = "#{node[:home]}/.local/bin"

execute "curl -fsSo #{workdir}/q.zip https://desktop-release.q.us-east-1.amazonaws.com/latest/q-x86_64-linux.zip" do
  not_if "test -x #{dest}/q"
end

execute "unzip #{workdir}/q.zip -d #{workdir}" do
  not_if "test -x #{dest}/q"
end

execute "mv /tmp/q/bin/{q,qchat,qterm} #{dest}/" do
  not_if "test -x #{dest}/q"
end
