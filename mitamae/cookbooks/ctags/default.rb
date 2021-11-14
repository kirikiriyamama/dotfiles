case node[:platform]
when 'arch'
  package 'ctags'
when 'ubuntu'
  package 'exuberant-ctags'
else
  raise NotImplementedError
end

dotfile '.ctags'
