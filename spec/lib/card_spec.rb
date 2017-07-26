require "spec_helper"

RSpec.describe Card do
  describe "#face_card?" do
    it "returns true if a card is a face card" do
      expect(Card.new('♠', 'K').face_card?).to eq true
    end
    it "returns false if a card is not a face card" do
      expect(Card.new('♠', '6').face_card?).to eq false
    end
  end

  describe "#ace?" do
    it "returns true if a card is an ace" do
      expect(Card.new('♠', 'A').ace?).to eq true
    end
    it "returns false if a card is not an ace" do
      expect(Card.new('♠', '6').ace?).to eq false
    end
  end
end
