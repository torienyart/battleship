require 'rspec'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

describe Player do
    let(:p_board) {Board.new}
    let(:c_board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}
    let(:player_1) {Player.new("Tori", p_board, cruiser, submarine, "human")}
    let(:computer) {Player.new("Computer Lord", c_board, cruiser, submarine, "computer")}

    it 'can initialize players' do

        expect(player_1.name).to eq("Tori")
        expect(player_1.board).to eq(p_board)
        expect(player_1.ships).to match([cruiser, submarine])
        expect(player_1.player_type).to eq("human")
        expect(player_1.ships_placed).to eq([])
        expect(player_1.has_lost).to be(false)

        expect(computer.name).to eq("Computer Lord")
        # expect(computer.player_type).to eq(computer)
        expect(computer.board).to eq(c_board)
        expect(computer.ships).to match([cruiser, submarine])
        expect(computer.player_type).to eq("computer")
        expect(computer.ships_placed).to eq([])
        expect(computer.has_lost).to be(false)

    end

    xit 'can place player ships with input' do #I think we can't really test this since it needs input, but we can pretend to give it the input
        
        player_1.ship_placement(cruiser, ["A1", "A2", "A3"])
        player_1.ship_placement(cruiser, ["C4", "D4"])

        #could test valid placement here.... but probably don't need to - the method needs to do this
        expect(player_1.ships_placed?).to be true

    end

    xit 'can place computer ships' do #want to test that ships are in valid placement, there are two of them
       
        computer.ship_placement_rand(cruiser)
        computer.ship_placement_rand(submarine)

        #need to create helper method to find random cells in groups to place the ships
        expect(computer.board.keys).to include(computer.rand_adj_cells)
        expect(computer.ships_placed?).to be true
        # expect(computer.board.valid_placement?).to be true
        
    end

    xit 'can determine if player has lost' do
        
        player_1.ship_setup(cruiser, ["A1", "A2", "A3"])
        player_1.ship_setup(cruiser, ["C4", "D4"])
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"] 
        cell_4 = board.cells["C4"]
        cell_5 = board.cells["D4"]


        expect(player_1.has_lost?).to eq(false)
        
        cell_1.fire_upon
        cell_2.fire_upon
        cell_3.fire_upon

        expect(player_1.has_lost?).to eq(false)
        
        cell_4.fire_upon
        cell_5.fire_upon

        expect(player_1.has_lost?).to eq(true)
    end
end