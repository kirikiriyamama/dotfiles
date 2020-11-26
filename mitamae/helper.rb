MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root = File.expand_path('..', __FILE__)
    include_recipe File.join(root, 'cookbooks', name, 'default')
  end

  def wsl?
    node[:kernel][:release].match?(/microsoft/i)
  end
end
