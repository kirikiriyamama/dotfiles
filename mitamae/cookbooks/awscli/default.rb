workdir = '/tmp'

execute "curl -fsSLo #{workdir}/aws.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" do
  not_if 'type aws'
end

execute "unzip #{workdir}/aws.zip -d #{workdir}" do
  not_if 'type aws'
end

execute "#{workdir}/aws/install" do
  not_if 'type aws'
end
