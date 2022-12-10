require 'rspec'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
# require "./lib/player"
# require "./lib/turn"
require "./lib/game"

RSpec.describe Game do
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}

    let(:p_board) {Board.new}
    let(:c_board) {Board.new}


    describe "Setup" do

        it "can initialize" do
            expect(p_board).to be_an_instance_of(Board)
            expect(c_board).to be_an_instance_of(Board)
        end

        xit "can randomly place ships on computer's board" do
            c_board.random_placement
        
            expect(c_board).to be_an_instance_of(Board)
        end

        xit "can accept user input to place ships on boards" do
        end

    end

    describe "Turn" do

        xit "should do sometihng" do  
            expect().to eq()
        end

    end

    describe "End Game" do

        xit "should do sometihng" do  
            expect().to eq()
        end

    end

end