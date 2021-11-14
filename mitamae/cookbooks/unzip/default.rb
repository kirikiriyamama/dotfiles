case node[:platform]
when 'arch'
  aur 'unzip-iconv'
when 'ubuntu'
  package 'unzip'
else
  raise NotImplementedError
end
