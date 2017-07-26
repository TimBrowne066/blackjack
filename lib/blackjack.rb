require 'pry'
require_relative "card"
require_relative "deck"
require_relative "hand"

player = Hand.new
computer = Hand.new
deck = Deck.new
# Your code here...
puts "Welcome to ruby blackjack, press 'd' to deal."
input = gets.chomp
until input == "d"
  puts "Invalid key.  Press 'd' to deal."
  input = gets.chomp
end

puts "YOU HAVE:\n"
2.times do player.cards << deck.deal!
  puts player.cards[-1].suit + player.cards[-1].value
end

player.calculate_score
if player.calculate_score == 21
  puts "BLACKJACK!!!"
end

if player.calculate_score < 21
  puts "YOUR SCORE: #{player.calculate_score}\n\n"
end

puts "DEALER HAS:\n"
2.times do computer.cards << deck.deal!
end
puts computer.cards[-1].suit + computer.cards[-1].value
puts "\n"

puts "Press 'h' to hit or 's' to stay.\n"
input = gets.chomp

while input == 'h' do
  player.cards << deck.deal!
  puts player.cards[-1].suit + player.cards[-1].value
  player.calculate_score
  if player.calculate_score > 21
    puts "YOU BUSTED!"
    break
  else
    puts "YOUR SCORE: #{player.calculate_score}\n\n"
    puts "Press 'h' to hit or 's' to stay.\n"
    input = gets.chomp
  end
end

if input == 's'
  puts "YOUR TOTAL SCORE #{player.calculate_score}\n\n"

  while computer.calculate_score < 17
    computer.cards << deck.deal!
  end

  puts "DEALER HAS"
  computer.cards.each do |card|
    puts card.suit + card.value
  end
  puts "\nDEALER SCORE: #{computer.calculate_score}\n\n"

  if player.calculate_score > 21 && computer.calculate_score <= 21
    puts "YOU BUSTED!  DEALER WINS!"
  elsif computer.calculate_score > 21 && player.calculate_score <= 21
    puts "DEALER BUSTED!  YOU WIN!"
  elsif player.calculate_score > computer.calculate_score && player.calculate_score <= 21
    puts "YOU WIN!"
  elsif computer.calculate_score > player.calculate_score && computer.calculate_score <= 21
    puts "DEALER WINS!"
  else
    puts "PUSH!"
  end
end
