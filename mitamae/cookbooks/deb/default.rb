define :deb, url: nil, version: nil do
  workdir = '/tmp'

  name = params[:name]
  url = params[:url]
  version = params[:version]

  condition =
    if version.nil?
      "dpkg -l #{name}"
    else
      %Q{test "$(dpkg-query -W -f '${Version}' #{name})" = "#{version}"}
    end

  execute 'fetch' do
    command "curl -fsSLo #{workdir}/#{name} #{url}"
    not_if condition
  end

  execute 'install' do
    command "dpkg -i #{workdir}/#{name}"
    not_if condition
  end
end
