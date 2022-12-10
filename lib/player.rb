class Player
        attr_reader :name, 
                    :board,
                    :ships,
                    # :cruiser,
                    # :submarine,
                    :player_type,
                    :ships_placed,
                    :has_lost

    def initialize(name, board, cruiser, submarine, player_type)
        @name = name
        @board = board
        @ships = [cruiser, submarine]
        @player_type = player_type
        @ships_placed = []
        @has_lost = false
    end


end