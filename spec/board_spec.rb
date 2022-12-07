require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

describe Board do
    let(:board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}

    describe "The Cells Interaction Pattern" do
        
        it "can initialize a new board object" do
            expect(board).to be_an_instance_of(Board)
        end 

        it "has cells" do
            expect(board.cells).to eq("A1", "A2", "A3", "A4", 
                                    "B1", "B2", "B3", "B4", 
                                    "C1", "C2", "C3", "C4", 
                                    "D1", "D2", "D3", "D4")
        end

    end

    describe "Validating Coordinates Interaction Pattern" do
        
        it "can validate a coordinate" do
            expect(board.valid_coordinate?("A1")).to eq(true)
            expect(board.valid_coordinate?("D4")).to eq(true)
            expect(board.valid_coordinate?("A5")).to eq(false)
            expect(board.valid_coordinate?("E1")).to eq(false)
            expect(board.valid_coordinate?("A22")).to eq(false)
        end

    end 




    end
end