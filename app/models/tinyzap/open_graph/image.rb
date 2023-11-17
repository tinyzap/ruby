module TinyZap
  module OpenGraph
    class Image < Base
      property "og:image:url",        "Identical to og:image."
      property "og:image:secure_url", "An alternate url to use if the webpage requires HTTPS."
      property "og:image:type",       "A MIME type for this image."
      property "og:image:width",      "The number of pixels wide."
      property "og:image:height",     "The number of pixels high."
      property "og:image:alt",        "A description of what is in the image (not a caption). If the page specifies an og:image it should specify og:image:alt."
    end
  end
end
