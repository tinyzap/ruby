require "thor"

module Imageomatic
  class CLI < Thor
    include Thor::Actions

    desc "install", "Install Imageomatic to the Rails application"
    def install
      run "./bin/bundle add imageomatic"
      run "./bin/rails generate imageomatic:install"
    end

    desc "version", "Prints the version of imageomatic"
    def version
      puts Imageomatic::VERSION
    end

    desc "environment [ENVIRONMENT]", "Generates environment variables for target enrivonment"
    def environment(environment = Imageomatic::KeyGenerator::ENVIRONMENT)
      puts Imageomatic.key_generator(environment: environment).env_vars
    end
  end
end
