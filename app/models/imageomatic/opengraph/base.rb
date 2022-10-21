module Imageomatic
  module Opengraph
    # Provides a way to specify OpenGraph keys for an OpengraphModel, which can later
    # be iterated upon to generate OpenGraph meta tags.
    class Base
      # Encapsulates OpenGraph properties and provides helpers that are
      # useful for documentation purposes or for reflecting on Ruby objects.
      class Property
        attr_accessor :key, :name, :description, :default

        def initialize(key, description = nil, default: nil)
          @key = key
          @description = description
          # If we get a string like `og:image:url`, this would give us `url`
          *_, @name = key.rpartition(":")
          @default = default
        end
      end

      # Allows for the object to be initialized with args like `Image.new(url: "https://example.com/logo.png", alt: "Logo image")`.
      def initialize(**kwargs)
        kwargs.each do |kwarg, value|
          self.send("#{kwarg}=", value)
        rescue NoMethodError
          raise NoMethodError, "#{kwarg.inspect} is not a property of #{self.inspect}"
        end
      end

      # DSL for creating properties when defining a model.
      def self.property(*args, **kwargs)
        property = Property.new *args, **kwargs
        attr_accessor property.name
        self.properties.append property
      end

      # Array where properties are registered.
      def self.properties
        @properties ||= []
      end

      # Iterates through the properties and also gets their value.
      def properties
        Enumerator.new do |y|
          self.class.properties.each do |property|
            y << [ property, (self.send(property.name) || property.default) ]
          end
        end
      end
    end
  end
end
