class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def face_card?
    ['J','Q','K'].include?(@value)
  end

  def ace?
    ['A'].include?(@value)
  end
end

SUITS = ['♠', '♣', '♦', '♥']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
