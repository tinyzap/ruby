module Imageomatic
  module OpengraphTagHelper
    def opengraph_meta_tags(model=opengraph)
      model.to_html
    end
  end
end
