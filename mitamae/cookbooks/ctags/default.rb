case node[:platform]
when 'arch'
  package 'ctags'
when 'darwin'
  package 'ctags'
  dotfile '.ctags'
when 'ubuntu'
  package 'exuberant-ctags'
else
  raise NotImplementedError
end

dotfile '.config/ctags'
