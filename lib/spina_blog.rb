require "spina_blog/engine"
require "spina_blog/blog"

module SpinaBlog
  include ActiveSupport::Configurable

  BLOGS = []
end