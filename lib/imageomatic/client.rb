module Imageomatic
  class Client
    delegate :secret_key, :public_key, to: :configuration

    def url_signature
      @url_signature ||= UrlSignature.new(secret_key: secret_key, public_key: public_key)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
