define :apt_repository, uri: nil, options: {}, suite: nil, components: [], key: nil do
  key_path = "/etc/apt/keyrings/#{params[:name]}.gpg"

  execute "curl -fsSL #{params[:key]} | gpg --dearmor -o #{key_path}" do
    not_if "test -f #{key_path}"
  end

  # man 5 sources.list
  template "/etc/apt/sources.list.d/#{params[:name]}.list" do
    source 'templates/sources.list.erb'
    variables(
      options: params[:options].merge('signed-by': key_path),
      uri: params[:uri],
      suite: params[:suite],
      components: params[:components],
    )
    mode '644'
    notifies :run, 'execute[apt update]', :immediately
  end

  execute 'apt update' do
    action :nothing
  end
end
