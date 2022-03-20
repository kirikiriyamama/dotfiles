root = File.expand_path('..', __FILE__)

node.reverse_merge!(
  user: 'kirikiriyamama',
  dotfiles: File.expand_path('../home', root)
)

include_recipe File.join(root, 'helper')
include_recipe File.join(root, 'roles', node[:platform], 'default')
