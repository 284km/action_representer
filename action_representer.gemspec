$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_representer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "action_representer"
  s.version     = ActionRepresenter::VERSION
  s.authors     = ["284km"]
  s.email       = ["at284km@gmail.com"]
  s.homepage    = "https://github.com/284km/action_representer"
  s.summary     = "Support JSON representation."
  s.description = "Support JSON representation."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport"
end
