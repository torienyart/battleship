class Player

    attr_reader :name,
                :ships,
                :player_type,
                :board,
                :ships_placed,
                :has_lost

    def initialize(name, board, ship_1, ship_2, player_type)
        @name = name
        @ships = [ship_1, ship_2]
        @player_type = player_type
        @board = board
        @ships_placed = []
        @has_lost = false
    end

    def player_setup
        if @player_type == "human"
            puts setup_message
            ship_placement
        elsif @player_type == "computer"
            ship_placement_rand
        end
    end

    def setup_message
        "I, Computer Lord, have arranged my ships for battle.
            I'll allow you to arrange your two ships before I attack.
            Your Cruiser is three units long and your Submarine is two units long.
              1 2 3 4
            A . . . .
            B . . . .
            C . . . .
            D . . . .
            Enter the coordinates for your Cruiser (3 spaces like this: A1 A2 A3):"
    end

    def ship_placement
        crsr_placement
        sub_placement
    end

    def crsr_placement
        cruiser = Ship.new("Cruiser", 3)
        valid_cruiser_placement = false

        while valid_cruiser_placement == false
            user_input = gets.to_s.chomp
            coordinates = user_input.split

            if board.valid_placement?(cruiser, coordinates) == true
                board.place(cruiser, coordinates)
                valid_cruiser_placement = true
            else
                p "Nice try you scumbag... that placement would be cheating — try again"
            end
        end
    end

    def sub_placement
        submarine = Ship.new("Submarine", 2)
        p "Now enter the coordinates for your Submarine (2 spaces like this: A1 A2)"
        valid_sub_placement = false

        while valid_sub_placement == false 
            user_input = gets.to_s.chomp
            coordinates = user_input.split
            
            if board.valid_placement?(submarine, coordinates) == true
                board.place(submarine, coordinates)
                valid_sub_placement = true
            else
                p "Nice try you scumbag... that placement would be cheating — try again"
            end
        end

    end

#     def ship_placement_rand_crsr
#         cruiser = Ship.new("Cruiser", 3)
#         rand_adj_cells_crsr
#         until board.valid_placement?(cruiser, rand_adj_cells_crsr) == true
# require 'pry'; binding.pry
#         end
#     end
    
#     def ship_placement_rand_sub
#         until board.valid_placement?(submarine, rand_adj_cells) == true

#         end
#     end

#     def rand_adj_cells_crsr
#         coord1 = @board.cells.values.sample
#         coord2 = @board.cells.values.sample
#         coord3 = @board.cells.values.sample
#         rand_adj_cells = [coord1, coord2, coord3]
#     end

#     def rand_adj_cells_sub
#         coord1 = @board.cells.values.sample
#         coord2 = @board.cells.values.sample
#         rand_adj_cells = [coord1, coord2]
#     end

end