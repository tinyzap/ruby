module Imageomatic
  module OpenGraph
      before_action :assign_opengraph_fallback_formats, if: :opengraph_request?
      before_action :assign_opengraph_defaults

      def assign_opengraph_fallback_formats
        request.formats = [ :opengraph, :html ]
      end

      def opengraph_request?
        request.format.opengraph?
      end

      def url_for_opengraph_image
        url_for(format: :opengraph)
      end

      Opengraph = Struct.new(:title, :image, :description)

      helper_method :og, :opengraph
      def opengraph
        @opengraph ||= Opengraph.new
      end
      alias :og :opengraph

      def assign_opengraph_defaults
        og.image ||= url_for(format: :opengraph)
      end
  end
end
