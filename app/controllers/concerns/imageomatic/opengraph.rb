module Imageomatic
  module Opengraph
    extend ActiveSupport::Concern

    DEFAULT_OPENGRAPH_TYPE = "website".freeze

    included do
      before_action :assign_opengraph_fallback_formats, if: :opengraph_request?
      before_action :assign_opengraph_defaults

      helper Imageomatic::OpengraphTagHelper

      helper_method :opengraph
    end

    protected
      def assign_opengraph_fallback_formats
        request.formats = [ :opengraph, :html ]
      end

      def opengraph_request?
        request.format.opengraph?
      end

      def url_for_opengraph_image
        url_for(format: :opengraph)
      end

      def opengraph
        @opengraph ||= Model.new
      end

      def assign_opengraph_defaults
        opengraph.image ||= url_for_opengraph_image
        opengraph.type ||= DEFAULT_OPENGRAPH_TYPE
      end
  end
end
