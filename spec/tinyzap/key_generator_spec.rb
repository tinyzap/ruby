require "rails_helper"

describe TinyZap::KeyGenerator do
  let(:key_generator) { TinyZap::KeyGenerator.new }
  subject { key_generator }
  describe "#public_key" do
    it "generates" do      
      expect(subject.public_key).to match /development_public_(\w+)/
    end
  end
  describe "#secret_key" do
    it "generates" do
      expect(subject.secret_key).to match /development_secret_(\w+)/
    end
  end
  describe "#env_vars" do
    it "generates" do
      expect(subject.env_vars).to match("IMAGEOMATIC_PUBLIC_KEY=development_public_")
    end
  end
end
