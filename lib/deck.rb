require_relative "card"
require_relative "hand"

class Deck
  def initialize
    @collection = []
      SUITS.each do |suit|
        VALUES.each do |value|
        @collection << Card.new(suit, value)
      end
    end
    @collection.shuffle!
  end

  def deal!
    @collection.pop
  end
end
#
# deck = Deck.new
# require 'pry'
# binding.pry
