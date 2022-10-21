module Imageomatic
  module Opengraph
    class Model < Base
      property "og:title",        %[The title of your object as it should appear within the graph, e.g., "The Rock".]
      property "og:type",         %[The type of your object, e.g., "video.movie". Depending on the type you specify, other properties may also be required.]
      property "og:image",        %[An image URL which should represent your object within the graph.]
      property "og:url",          %[The canonical URL of your object that will be used as its permanent ID in the graph, e.g., "https://www.imdb.com/title/tt0117500/".]
      property "og:description",  %[A one to two sentence description of your object.]
      property "twitter",  %[A one to two sentence description of your object.]

      delegate :to_html, to: :metatag_mapper

      def image
        @image ||= Image.new
      end

      def image=(url)
        image.url = url
      end

      def twitter
        @twitter ||= Twitter.new.tap do |twitter|
          twitter.title = title
          twitter.description = description
          twitter.image = image.url
        end
      end

      private
        def metatag_mapper
          MetatagMapper.new(self)
        end
    end
  end
end
