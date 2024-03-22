dotfile '.bundle'
dotfile '.gemrc'
dotfile '.irbrc'
dotfile '.rspec'

if node[:platform] == 'ubnutu'
  package 'libreadline-dev'
  package 'zlib1g-dev'
end
