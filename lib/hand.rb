require_relative "card"
require_relative "deck"

class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def calculate_score
    aces = 0
    score = 0
    @cards.each do |card|
      if card.face_card? == true
        score += 10
      elsif card.ace? == true
        score += 11
        aces += 1
      else
        score += card.value.to_i
      end
    end

    while aces > 0 && score > 21 do
      score -= 10
      aces -= 1
    end

    return score

  end
end


# card1 = Card.new('♠', '8')
# card2 = Card.new('♠', '6')
# hand = Hand.new
# hand.cards << card1
# hand.cards << card2
# require 'pry'
# binding.pry
