define :dotfile do
  name = params[:name]

  src = File.join(node[:dotfiles], name)
  dst = File.join(node[:home], name)

  directory File.dirname(dst) do
    user node[:user]
  end

  link dst do
    to src
    user node[:user]
  end
end
