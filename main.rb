require_relative 'player'
require_relative 'math'

# Get player names
puts "Enter Player 1 name:"
player1_name = gets.chomp

puts "Enter Player 2 name:"
player2_name = gets.chomp

# player instances
player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

# MathGame instance
game = MathGame.new(player1, player2)

# run game
game.play
