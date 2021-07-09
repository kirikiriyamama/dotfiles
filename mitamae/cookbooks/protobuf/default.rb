case node[:platform]
when 'arch'
  package 'protobuf'
when 'ubuntu'
  package 'protobuf-compiler'
  package 'libprotobuf-dev'
else
  raise NotImplementedError
end
