define :cask do
  name = params[:name].shellescape

  execute "brew install --cask #{name}" do
    not_if "ls -1 /opt/homebrew/Caskroom | grep '^#{name.split('/').last}$'"
  end
end
