require "rails_helper"

describe Imageomatic::KeyGenerator do
  let(:key_generator) { Imageomatic::KeyGenerator.new }
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
end
