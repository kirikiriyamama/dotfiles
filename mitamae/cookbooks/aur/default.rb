git '/tmp/paru' do
  repository 'https://aur.archlinux.org/paru.git'
  user node[:user]
  not_if 'type paru'
end

execute 'makepkg -si --noconfirm' do
  user node[:user]
  cwd '/tmp/paru'
  not_if 'type paru'
end

define :aur do
  name = params[:name].shellescape

  execute "paru -S --noconfirm #{name}" do
    user node[:user]
    not_if "paru -Q #{name} || paru -Qg #{name}"
  end
end
