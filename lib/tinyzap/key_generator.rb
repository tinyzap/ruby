require "securerandom"

module TinyZap
  # Generates random keys for environments.
  class KeyGenerator
    LENGTH = 14
    DELIMITER = "_".freeze
    ENVIRONMENT = :development

    attr_reader :environment

    def initialize(environment: ENVIRONMENT)
      @environment = environment
    end

    def public_key
      generate :public
    end

    def secret_key
      generate :secret
    end

    def env_vars
      <<~ENVARS
      TINYZAP_SECRET_KEY=#{secret_key}
      TINYZAP_PUBLIC_KEY=#{public_key}
      ENVARS
    end

    def generate(*scopes)
      scopes
        .prepend(environment)
        .append(random)
        .join(DELIMITER)
    end

    private
      def random
        SecureRandom.hex(LENGTH)
      end
  end
end
