define :github_binary, repository: nil, version: nil, asset: nil, extract: nil, bin: nil, dest: nil do
  name = params[:name]
  repository = params[:repository]
  version = params[:version]
  asset = params[:asset]
  extract = params[:extract]
  bin = params[:bin] || name

  dest = params[:dest] || "/usr/local/bin/#{name}"
  url = "https://github.com/#{repository}/releases/download/#{version}/#{asset}"

  workdir = '/tmp'

  execute "curl -fsSLo #{workdir}/#{asset} #{url}" do
    not_if "test -f #{dest}"
  end

  if extract
    execute extract do
      cwd workdir
      not_if "test -f #{dest}"
    end
  end

  execute "mv #{workdir}/#{bin} #{dest}" do
    not_if "test -f #{dest}"
  end

  file dest do
    mode '755'
  end
end
