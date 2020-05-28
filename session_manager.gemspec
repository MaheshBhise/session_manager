$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "session_manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "session_manager"
  spec.version     = SessionManager::VERSION
  spec.authors     = ["Mahesh"]
  spec.email       = ["mahesh.bhise@hotmail.com"]
  spec.homepage    = ""
  spec.summary     = "Summary of SessionManager."
  spec.description = "Description of SessionManager."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "kaminari", ">= 1.1.1", "< 1.3.0"
  spec.add_dependency "sassc-rails", "~> 2.1.2"

  spec.add_development_dependency "sqlite3"
end
