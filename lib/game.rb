class Game
    attr_reader :board,
                :ships, 
                :ships_placed

    def initialize
        @board = board
        @ships = [cruiser, submarine]
        @ships_placed = []
    end

end