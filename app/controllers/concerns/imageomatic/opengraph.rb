module Imageomatic
  module Opengraph
    extend ActiveSupport::Concern

    DEFAULT_OPENGRAPH_TYPE = "website".freeze

    DEFAULT_OPENGRAPH_FALLBACK_FORMATS = [ :opengraph, :html ]
    included do
      before_action :assign_opengraph_fallback_formats, if: :opengraph_request?
      before_action :assign_opengraph_defaults

      helper Imageomatic::OpengraphTagHelper

      helper_method :opengraph
    end

    protected
      def assign_opengraph_fallback_formats
        request.formats = DEFAULT_OPENGRAPH_FALLBACK_FORMATS
      end

      def opengraph_request?
        request.format.opengraph?
      end

      def url_for_opengraph_image
        imageomatic_opengraph_url url: url_for(format: :opengraph)
      end

      def imageomatic_opengraph_url(*args, **kwargs)
        Imageomatic.client.url_signature.url_for "opengraph", *args, **kwargs
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
