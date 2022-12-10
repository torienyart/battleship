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

    
end