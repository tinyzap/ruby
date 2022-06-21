module Imageomatic
  # Generates random keys for environments.
  class KeyGenerator
    LENGTH = 14
    DELIMITER = "_".freeze
    ENVIRONMENT = :development

    def generate(*scopes)
      scopes.append(SecureRandom.hex(LENGTH)).join(DELIMITER)
    end

    def public_key(environment: ENVIRONMENT)
      generate environment, :public
    end

    def secret_key(environment: ENVIRONMENT)
      generate environment, :secret
    end
  end
end
