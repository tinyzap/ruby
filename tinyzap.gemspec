require_relative "lib/tinyzap/version"

Gem::Specification.new do |spec|
  spec.name        = "tinyzap"
  spec.version     = TinyZap::VERSION
  spec.authors     = ["Brad Gessler"]
  spec.email       = ["brad@tinyzap.com"]
  spec.homepage    = "https://tinyzap.com/"
  spec.summary     = "Easiest way to generate fresh images for Rails applications."
  spec.description = spec.summary
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tinyzap/ruby"
  spec.metadata["changelog_uri"] = "https://github.com/tinyzap/ruby/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,exe}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "thor", ">= 1.0.0"
  spec.add_dependency "zeitwerk", "~> 2.5"
end
