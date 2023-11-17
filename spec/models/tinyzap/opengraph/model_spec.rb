require 'rails_helper'

module TinyZap
  RSpec.describe Opengraph::Model, type: :model do
    let(:title) { "This is a webpage" }
    let(:image) { "http://www.example.com/image.jpg" }
    let(:description) { nil }
    let(:model) { Opengraph::Model.new(title: title, image: image, description: description) }
    describe "#to_html" do
      subject { model.to_html }
      it { is_expected.to include %[<meta property="og:title" content="This is a webpage" />] }
      it { is_expected.to include %[<meta property="og:image:url" content="http://www.example.com/image.jpg" />] }
      it { is_expected.to_not include %[<meta property="og:description"] }
      it { is_expected.to include %[<meta property="twitter:title" content="This is a webpage" />] }
      it { is_expected.to include %[<meta property="twitter:image" content="http://www.example.com/image.jpg" />] }
      it { is_expected.to include %[<meta property="twitter:card" content="summary_large_image" />] }
      it { is_expected.to_not include %[<meta property="twitter:description"] }
      it { is_expected.to_not include %[<meta property="twitter:site"] }
    end
  end
end
