require "imageomatic/version"
require "imageomatic/engine"

module Imageomatic
  autoload :Client,           "imageomatic/client"
  autoload :Configuration,    "imageomatic/configuration"
  autoload :KeyGenerator,     "imageomatic/key_generator"
  autoload :UrlSignature,     "imageomatic/url_signature"

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
