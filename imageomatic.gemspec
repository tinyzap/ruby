require_relative "lib/imageomatic/version"

Gem::Specification.new do |spec|
  spec.name        = "imageomatic"
  spec.version     = Imageomatic::VERSION
  spec.authors     = ["Brad Gessler"]
  spec.email       = ["brad@imageomatic.com"]
  spec.homepage    = "https://www.imageomatic.com/"
  spec.summary     = "Easiest way to generate fresh images for Rails applications."
  spec.description = spec.summary
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/imageomatic/ruby"
  spec.metadata["changelog_uri"] = "https://github.com/imageomatic/ruby/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
