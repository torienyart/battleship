class Player
    attr_reader :name, 
                :board,
                :ships,
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

def ship_placement(ship, coord)

    if board.valid_placement?(ship, coord) == true

        p_board.place(ship, coord)
        p_board.cells.render(true)
    else