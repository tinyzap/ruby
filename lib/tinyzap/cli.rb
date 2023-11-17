require "thor"

module TinyZap
  class CLI < Thor
    include Thor::Actions

    desc "install", "Install TinyZap to the Rails application"
    def install
      run "./bin/bundle add tinyzap"
      run "./bin/rails generate tinyzap:install"
    end

    desc "version", "Prints the version of tinyzap"
    def version
      puts TinyZap::VERSION
    end

    desc "environment [ENVIRONMENT]", "Generates environment variables for target enrivonment"
    def environment(environment = TinyZap::KeyGenerator::ENVIRONMENT)
      puts TinyZap.key_generator(environment: environment).env_vars
    end
  end
end
