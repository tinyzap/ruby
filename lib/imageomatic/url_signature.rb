require "openssl"
require "uri"

module Imageomatic
  class UrlSignature
    # Use for `OpenSSL::HMAC`
    DIGEST = "SHA256".freeze

    attr_reader :secret_key, :public_key, :path_prefix

    def initialize(secret_key:, public_key:)
      @secret_key = secret_key
      @public_key = public_key
      @path_prefix = File.join("/", "v1", public_key)
    end

    def signed_url(path)
      URI.join("https://www.imageomatic.com/", signed_path(path))
    end

    def valid?(url)
      path = URI(url).request_uri
      version, account_key, signature, path = Regexp.new("/(v1)/(.+?)/(.+?)(/.+)").match(path).captures
      signature == sign(path)
    end

    def url_for(path, **query)
      path = URI(path).tap do |url|
        url.path = path
        url.query = query.to_query
      end
      signed_url path
    end

    private
      def signed_path(path)
        File.join(path_prefix, sign(File.join("/", path.to_s)), path.to_s)
      end

      def sign(data)
        OpenSSL::HMAC.hexdigest(DIGEST, secret_key, data)
      end
  end
end
