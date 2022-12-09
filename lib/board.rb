class Board
    attr_reader :cells

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
         @placement_attempt_array = nil
         @ships = []

    end

    def valid_coordinate?(location)
       @cells.include?(location)
    end
    
    def valid_placement?(ship, placement_attempt_array)
        @placement_attempt_array = placement_attempt_array
        @ships << ship
        if check_coord_length == true && unq_cells? == true && correct_length?(ship) == true && lined_up? == true && adjacent? == true && overlap? == true
            true
        else
            false
        end
    end

    def check_coord_length
        @placement_attempt_array.all? do |coord|
            coord.length == 2
        end
    end
       
    def unq_cells?
        if @placement_attempt_array.uniq.size == @placement_attempt_array.size
            true
        else
            false
        end
    end

    def correct_length?(ship)
        if @placement_attempt_array.size == ship.length 
            true
        elsif @placement_attempt_array.size != ship.length
            false
        end
    end
            
    def cell_first_character
        cell_first_character = @placement_attempt_array.map do |cell|
            cell[0]
        end
    end

    def cell_second_character
        cell_second_character = @placement_attempt_array.map do |cell|
            cell[-1]
        end
    end

    def lined_up?
        if cell_first_character.first > cell_first_character.last || cell_second_character.first > cell_second_character.last
            false
        elsif cell_first_character.uniq.size == 1 || cell_second_character.uniq.size == 1
            true
        else
            false
        end
    end

    def range1_size
        sorted_f_chars = cell_first_character.sort
        range1_start = sorted_f_chars.first
        range1_end = sorted_f_chars.last

        (range1_start .. range1_end).to_a.size 
    end

    def range2_size
        sorted_s_chars = cell_second_character.sort
        range2_start = sorted_s_chars.first
        range2_end = sorted_s_chars.last

        (range2_start .. range2_end).to_a.size 
    end

    def adjacent?
        if range1_size == @placement_attempt_array.size || range2_size == @placement_attempt_array.size
            true
        else
            false
        end
    end

    def overlap?
        @placement_attempt_array.all? do |cell|
            @cells[cell].empty?
        end
    end

    def place(ship, cells)
        cells.each do |cell|
            @cells[cell].place_ship(ship)
        end
    end

    def render(boolean = false)
        rendered = "  1 2 3 4 \nA "

        rendered += rendered_cells(boolean)

        rendered.insert(21, "\nB ")
        rendered.insert(32, "\nC ")
        rendered.insert(43, "\nD ")
        rendered.insert(53, " \n")
    end

    def rendered_cells(boolean)
        @cells.each_value.map do |cell|
            cell.render(boolean)
        end.join(' ')
    end
end