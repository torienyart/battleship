require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

describe Board do
    let(:board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}

    describe "The Cells" do
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

    describe "Validating Coordinates" do
        it "can validate a coordinate" do
            expect(board.valid_coordinate?("A1")).to eq(true)
            expect(board.valid_coordinate?("D4")).to eq(true)
            expect(board.valid_coordinate?("A5")).to eq(false)
            expect(board.valid_coordinate?("E1")).to eq(false)
            expect(board.valid_coordinate?("A22")).to eq(false)
        end
    end 

    describe "Validating Placements" do
        it "determines if the placement of the ship is on the correct length of cells" do
            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        end

        it "ensures the placement of the ship is on consecutive cells" do
            expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
            expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
        end

        it "ensures the placement of the ship is down or across (not diagonal)" do
            expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
            expect(board.valid_placement?(submarine, ["C2", "D3"])).to equal(false)
        end

        it "can determine a valid placement" do
            expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
            expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
        end
    end

    describe "Placing Ships" do
        it "Does something RENAME!" do
            #code here
        end
    end 

    describe "Overlapping Ships" do
        it "Does something RENAME!" do
            #code here
        end
    end 

    describe "Rendering the Board" do
        it "Does something RENAME!" do
            #code here
        end
    end 

end