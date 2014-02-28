require File.expand_path("../game.rb", __FILE__)
require File.expand_path("../player.rb", __FILE__)

puts "What is player 1's name?"
player1 = Player.new gets.strip
puts "What is player 2's name?"
player2 = Player.new gets.strip
