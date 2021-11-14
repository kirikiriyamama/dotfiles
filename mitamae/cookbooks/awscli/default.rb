case node[:platform]
when 'arch'
  package 'aws-cli'
  aur 'aws-session-manager-plugin'
when 'ubuntu'
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

  deb "session-manager-plugin" do
    url "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb"
    not_if "session-manager-plugin"
  end
else
  raise NotImplementedError
end
