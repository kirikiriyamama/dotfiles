case node[:platform]
when 'arch'
  aur 'amazon-ecr-credential-helper'
when 'ubuntu'
  package 'amazon-ecr-credential-helper'
else
  raise NotImplementedError
end
