require 'spina'
module Blog
  class Engine < ::Rails::Engine
    initializer 'spina.plugin.register.blog', before: :load_config_initializers do
      ::Spina::Plugin.register do |plugin|
        plugin.name       = 'Blog'
        plugin.namespace  = 'blog'
      end
    end
  end
end
