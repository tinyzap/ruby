module Imageomatic
  module Opengraph
    class Metatag < Struct.new(:property, :content)
      include ActionView::Helpers::TagHelper

      def to_html
        tag :meta, property: "og:#{property}", content: content
      end
    end
  end
end
