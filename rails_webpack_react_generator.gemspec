$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_webpack_react_generator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_webpack_react_generator"
  s.version     = RailsWebpackReactGenerator::VERSION
  s.authors     = ["armanmiranda"]
  s.email       = ["arman.miranda.ust@gmail.com"]
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
end
