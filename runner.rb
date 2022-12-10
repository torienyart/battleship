require 'rspec'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

p_board = Board.new
c_board = Board.new
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
player_1 = Player.new("Tori", p_board, cruiser, submarine, "human")
computer = Player.new("Computer Lord", c_board , cruiser, submarine, "computer")


player_1.player_setup