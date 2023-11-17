require "tinyzap/version"
require "tinyzap/engine" if defined? Rails

module TinyZap
  autoload :CLI,              "tinyzap/cli"
  autoload :Client,           "tinyzap/client"
  autoload :Configuration,    "tinyzap/configuration"
  autoload :KeyGenerator,     "tinyzap/key_generator"
  autoload :UrlSignature,     "tinyzap/url_signature"

  class << self
    def client
      @client ||= Client.new
    end

    def key_generator(environment: Rails.env)
      @key_generator ||= KeyGenerator.new(environment: environment)
    end

    def configure(&block)
      block.call client.configuration
    end
  end
end
