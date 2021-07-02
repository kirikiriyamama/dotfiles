workdir = '/tmp'

version = '3.2.3'
url = "https://github.com/wslutilities/wslu/releases/download/v#{version}/wslu-#{version}-0-any.pkg.tar.zst"

execute "curl -fsSLo #{workdir}/wslu.pkg.tar.zst #{url}" do
  not_if "pacman -Q wslu"
end

execute "pacman -U --noconfirm #{workdir}/wslu.pkg.tar.zst" do
  not_if "pacman -Q wslu"
end
