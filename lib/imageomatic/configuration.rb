module Imageomatic
  class Configuration
    attr_accessor :secret_key, :public_key

    def load_secret_key_env!
      self.secret_key = ENV.fetch("IMAGEOMATIC_SECRET_KEY")
    end

    def load_public_key_env!
      self.public_key = ENV.fetch("IMAGEOMATIC_PUBLIC_KEY")
    end

    def load_env!
      load_secret_key_env!
      load_public_key_env!
    end
  end
end
