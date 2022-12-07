require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

describe Board do
 let(:board) {Board.new}

 it "can initialize a new board object" do
    expect(board).to be_an_instance_of(Board)
 end 


end