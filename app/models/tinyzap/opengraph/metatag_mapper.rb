module TinyZap
  module Opengraph
    # Iterates recursively through an OpenGraph object and gets a bunch of
    # metatags and keys.
    class MetatagMapper
      include ActionView::Helpers::OutputSafetyHelper

      attr_reader :model
      delegate :context,
        to: :model

      def initialize(model)
        @model = model
      end

      def metatags
        Enumerator.new do |y|
          model.properties.each do |property, content|
            if content.respond_to? :properties
              MetatagMapper.new(content).metatags.each do |tag|
                y << tag
              end
            else
              y << Metatag.new(property.key, content) if content.present?
            end
          end
        end
      end

      def to_html
        safe_join metatags.map(&:to_html), "\n"
      end
    end
  end
end
