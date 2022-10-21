module Imageomatic
  module Opengraph
    class Twitter < Base
      property "twitter:card",        "Type of card, which is 'summary_large_image'", default: "summary_large_image"
      property "twitter:site",        "Twitter @handle of the account"
      property "twitter:title",       "Title of the card, similar to og:title"
      property "twitter:description", "Description of the card, similar to og:description"
      property "twitter:image",       "Image URL of the card, similar to og:image"
    end
  end
end
