require 'rails_helper'

module Imageomatic
  RSpec.describe Opengraph::Model, type: :model do
    let(:title) { "This is a webpage" }
    let(:image) { "http://www.example.com/image.jpg" }
    let(:description) { nil }
    let(:model) { Opengraph::Model.new(title, image, description) }

    describe "#to_html" do
      subject { model.to_html }
      it { is_expected.to include %[<meta property="og:title" content="This is a webpage" />]}
      it { is_expected.to include %[<meta property="og:image" content="http://www.example.com/image.jpg" />]}
      it { is_expected.to_not include %[<meta property="og:description"]}
    end
  end
end
