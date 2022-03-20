case node[:platform]
when 'arch'
  aur 'peco'
when 'ubuntu', 'darwin'
  package 'peco'
else
  raise NotImplementedError
end

dotfile '.peco'
