define :apt_key, fingerprint: nil do
  key = params[:name]
  fingerprint = params[:fingerprint]

  execute 'apt-key add' do
    command "curl -fsSL #{key} | apt-key add - && test -n \"$(apt-key fingerprint #{fingerprint})\""
    only_if "test -z \"$(apt-key fingerprint #{fingerprint})\""
  end
end
