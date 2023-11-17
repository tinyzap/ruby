require "tinyzap/version"
require "tinyzap/engine" if defined? Rails
require "zeitwerk"

module TinyZap
  Loader = Zeitwerk::Loader.for_gem.tap do |loader|
    loader.ignore "#{__dir__}/generators"
    loader.inflector.inflect "tinyzap" => "TinyZap"
    loader.setup
  end

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
