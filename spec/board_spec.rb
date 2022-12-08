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
            expect(board.cells).to be_an_instance_of(Hash)
        end
    end

    describe "Validating Coordinates" do
        xit "can validate a coordinate" do
            expect(board.valid_coordinate?("A1")).to eq(true)
            expect(board.valid_coordinate?("D4")).to eq(true)
            expect(board.valid_coordinate?("A5")).to eq(false)
            expect(board.valid_coordinate?("E1")).to eq(false)
            expect(board.valid_coordinate?("A22")).to eq(false)
        end
    end 

    describe "Validating Placements" do
        xit "determines if the placement of the ship is on the correct length of cells" do
            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        end

        xit "ensures the placement of the ship is on consecutive cells" do
            expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
            expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
        end

        xit "ensures the placement of the ship is down or across (not diagonal)" do
            expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
            expect(board.valid_placement?(submarine, ["C2", "D3"])).to equal(false)
        end

        xit "can determine a valid placement" do
            expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
            expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
        end
    end

    describe "Placing Ships" do
        xit "can recognize one individual cell" do
            board.place(cruiser, ["A1", "A2", "A3"])

            expect(cell_1 = board.cells["A1"]).to be_an_instance_of(Cell)
            expect(cell_2 = board.cells["A2"]).to be_an_instance_of(Cell)
            expect(cell_3 = board.cells["A3"]).to be_an_instance_of(Cell)
        end
        
        xit "can place a ship in multiple cells" do
            board.place(cruiser, ["A1", "A2", "A3"])
        
            expect(cell_1.ship).to eq(cruiser)
            expect(cell_2.ship).to eq(cruiser)
            expect(cell_3.ship).to eq(cruiser)
        end

        xit "confirms same ship can be in multiple cells at once" do
            board.place(cruiser, ["A1", "A2", "A3"])
            cell_1 = board.cells["A1"]
            cell_2 = board.cells["A2"]
            cell_3 = board.cells["A3"] 
            
            expect(cell_3.ship == cell_2.ship).to eq(true)
        end

    end 

    describe "Overlapping Ships" do
        xit "can identify if ship is already on a cell" do
            board.place(cruiser, ["A1", "A2", "A3"])
        
            expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
        end
    end 

    describe "Rendering the Board" do
        xit "renders a 'string' representation of itself for the other player" do
            board.place(cruiser, ["A1", "A2", "A3"])    

            expect(board.render).to eq("  1 2 3 4 \n
                                        A . . . . \n 
                                        B . . . . \n
                                        C . . . . \n
                                        D . . . . \n")
        end

        xit "renders a TRUE 'string' representation of itself for player's own board" do
            board.place(cruiser, ["A1", "A2", "A3"])    

            expect(board.render(true)).to eq("  1 2 3 4 \n
                                              A S S S . \n
                                              B . . . . \n
                                              C . . . . \n
                                              D . . . . \n")
        end
    end 

end