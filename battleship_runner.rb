require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/game"
require "./lib/2_player_game"
require "./lib/interface"

interface = Interface.new

interface.run_game
# game = Game.new
# two_player = TwoPlayerGame.new
# puts "*======================================================*"
# puts
# puts
# puts "Ahoy mateys! Test your wits at BATTLESHIP — a game of the seven seas.\n" +
# "Enter 1 to play against the computer, enter 2 to play against a partner, or enter q to quit"

# game_type = gets.chomp

# loop do
#     if game_type == '1' || game_type.downcase == "one"
#         game.start
#     elsif game_type == '2' || game_type.downcase == "two"
#         two_player.start
#     elsif game_type.downcase == 'q'
#         break
#     else
#         puts "Yargh, I didn't understsand that. Make up your mind! I'm a very busy pirate!\n" +
#         "Enter 1 to play against the computer, enter 2 to play against a partner, or enter q to quit"
#     end
# end