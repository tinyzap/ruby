require "rails_helper"

describe Imageomatic::UrlSignature do
  let(:secret_key) { "SeKrUt" }
  let(:public_key) { "my-account" }
  let(:url_signature) { Imageomatic::UrlSignature.new secret_key: secret_key, public_key: public_key}
  let(:path) { "/opengraph/super/badge?foo=bar"}
  let(:signed_url) { url_signature.signed_url(path) }
  let(:tampered_url) { URI.join(signed_url, "blarny!") }

  it "signs URL" do
    expect(signed_url.to_s).to eql "https://www.imageomatic.com/v1/my-account/f90c842d59d53be70829f246b3610e9432cb2c50b0eac5b709f2654dfa5889db/opengraph/super/badge?foo=bar"
  end

  describe "valid?" do
    it "returns true for signed signature" do
      expect(url_signature.valid?(signed_url.to_s)).to be true
    end

    it "returns false for tampered signature" do
      expect(url_signature.valid?(tampered_url.to_s)).to be false
    end
  end
end
