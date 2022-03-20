MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root = File.expand_path('..', __FILE__)
    cookbook = File.join(root, 'cookbooks', name)

    platform = File.join(cookbook, "#{node[:platform]}.rb")
    default = File.join(cookbook, 'default.rb')

    if File.exist?(platform)
      include_recipe platform
    else
      include_recipe default
    end
  end

  def wsl?
    node[:kernel][:release].match?(/microsoft/i)
  end
end
