#!/usr/bin/env ruby
class Player
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def to_s
    name
  end
end

class Game
  attr_accessor :server
  attr_accessor :scores

  def initialize(player1, player2)
    @scores = { player1 => 0, player2 => 0 }
    @server = player1
    @non_server = player2
    if rand(2) == 0
      swap_server
    end
  end

  def run
    while true
      5.times do
        rally
        return if winner
      end
      swap_server
    end
  end

  def swap_server
    @server, @non_server = @non_server, @server
    puts "#@server now is the server!"
  end

  def winner
    high = @scores.values.max
    return if high < 21
    return if high - @scores.values.min < 2
    return @scores.keys.select { |x| @scores[x] == high }.first
  end

  def rally
    puts "#@server winds up for a serve."
    while rand(5) == 0
      puts " There has been a let serve.   Trying again!"
    end
    puts "Serve successful!"
    point_winner = @server
    if rand(2) == 0
      point_winner = @non_server
    end
    @scores[point_winner] += 1
    puts "#{point_winner} has scored a point! The current score is #{@scores.values.join(" - ")}."
  end
end

puts "What is the first player's name?"
name = STDIN.gets.chomp
player1 = Player.new(name)
puts "What is the second player's name?"
name = STDIN.gets.chomp
player2 = Player.new(name)
game = Game.new(player1, player2)
puts "#{game.server} has won the coin toss.  The game is ready to start!"
game.run
puts "#{game.winner} has won the game!  The score was #{game.scores.values.join(" - ")}"
