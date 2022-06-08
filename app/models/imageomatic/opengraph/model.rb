module Imageomatic
  module Opengraph
    class Model < Struct.new(:title, :image, :description)
      include ActionView::Helpers::OutputSafetyHelper

      def metatags
        Enumerator.new do |y|
          each_pair do |property, content|
            y << Metatag.new(property, content) if content.present?
          end
        end
      end

      def to_html
        safe_join metatags.map(&:to_html), "\n"
      end
    end
  end
end
