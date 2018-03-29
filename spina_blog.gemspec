$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina_blog"
  s.version     = SpinaBlog::VERSION
  s.authors     = ["Matt Redmond"]
  s.email       = ["signs.of.antilife@gmail.com"]
  s.homepage    = "http://spinacms.com"
  s.summary     = "Blog module for Spina CMS"
  s.description = "Adds a Blog module to a Spina CMS instance. Provides admin and front-end."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1"
  s.add_dependency "spina"

  s.add_development_dependency "sqlite3"
end
