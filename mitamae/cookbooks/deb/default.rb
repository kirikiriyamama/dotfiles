define :deb, url: nil do
  workdir = '/tmp'

  name = params[:name]
  url = params[:url]

  execute 'fetch' do
    command "curl -fsSLo #{workdir}/#{name} #{url}"
    not_if "dpkg -l #{name}"
  end

  execute 'install' do
    command "dpkg -i #{workdir}/#{name}"
    not_if "dpkg -l #{name}"
  end
end
