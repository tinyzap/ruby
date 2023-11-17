module TinyZap
  module Opengraph
    class Metatag < Struct.new(:property, :content)
      include ActionView::Helpers::TagHelper

      def to_html
        tag :meta, property: property, content: content
      end
    end
  end
end
