case node[:platform]
when 'arch'
  aur 'peco'
when 'ubuntu'
  package 'peco'
else
  raise NotImplementedError
end

dotfile '.peco'
