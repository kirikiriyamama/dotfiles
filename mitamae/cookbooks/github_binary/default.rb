define :github_binary, repository: nil, version: nil, asset: nil, extract: nil, source: nil do
  name = params[:name]
  repository = params[:repository]
  version = params[:version]
  asset = params[:asset]
  extract = params[:extract]
  source = params[:source] || name

  bin = "/usr/local/bin/#{name}"
  url = "https://github.com/#{repository}/releases/download/#{version}/#{asset}"

  workdir = '/tmp'

  execute "curl -fsSLo #{workdir}/#{asset} #{url}" do
    not_if "test -f #{bin}"
  end

  if extract
    execute extract do
      cwd workdir
      not_if "test -f #{bin}"
    end
  end

  execute "mv #{workdir}/#{source} #{bin} && chmod +x #{bin}" do
    not_if "test -f #{bin}"
  end
end
