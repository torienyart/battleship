require 'rspec'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/game"

RSpec.describe Game do
    let(:game) {Game.new}

    describe "Setup" do

        it "can initialize a new instance of a game" do
            expect(game).to be_an_instance_of(Game)
        end

        it "can start the game" do
            game.start
        end


        xit "can randomly place ships on computer's board" do
            c_board.c_ship_placement
        end


        xit "can accept user input to place ships on boards" do
            p_board.p_ship_placement
            p_board.p_ship_placement
        end

    end

    describe "Turn" do

        xit "can display both boards [c_board(false) & p_board(true)]" do
            display_boards(false)
        end

        xit "can accept user_input to fire_upon a cell" do
            c_board.cell.fire_upon
        end

        xit "computer can randomly fire_upon a cell" do
            p_board.cell.fire_upon
        end

        # xit "can determine if a cell has already been fired upon" do
        #     #???
        # end

        xit "can render the boards to show player's shot" do
            c_board.cell.fire_upon
            display_boards(true)
        end

        xit "can render the boards to show computer's shot" do
            p_board.cell.fire_upon
            display_boards(true)
        end

        xit "can display the results of the turn" do
            print_results
        end
    end

    describe "End Game" do

        xit "can determine a winner once player/computer have all ships sunk" do  
            champion
        end

    end

end