class Board
    attr_reader :board, :cells

    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4"),
        }   
    end

    def valid_coordinate?(location)
       @cells.include?(location)
    end
    

    def valid_placement?(ship, array_of_cells)
        if array_of_cells.size == ship.length 
            if 
            elsif
            end
            # either first characters need to match OR last characters of coordinate
            # ship.length == range of cells 
            # ensure A1 A1 A1 will NOT pass the test
            true
        elsif array_of_cells.size != ship.length
            false
        end


    end

    # def place(ship, [array?])
    # end


end