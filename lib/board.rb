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
    

    # placements is valid if cells passed are equal to the ship's length AND [&&] if the cells passed are consecutive(and not diagonal)
    def valid_placement?(ship, placment_attempt_array)
        # I know the if method is redundant... how do I NOT use the if method? just line 33?
        if correct_length? && consecutive_cells?
            true
        elsif
            false
        end
    end
       
    # ensures the number of cells passed are equal to the length of a ship
    def correct_length?
        if array_of_cells.size == ship.length 
            true
        elsif array_of_cells.size != ship.length
            false
        end
    end
            

    def consecutive_cells?
        Letters = []
        Numbers = []

        placement_attempt_array.each do |indv_coordinate|
            Letters << indv_coordinate.index[0].ord
            Numbers << indv_coordinate.index[-1].to_i

            # This line is ensuring the coordinates are NOT diagonal
            #if Letters != same || Numbers != same
                #false

            #elsif Letters == same?
                # Numbers == consecutive
                #     true
                # Numbers != consecutive
                #     false
                
            #elsif Numbers == same? 
                # Letters == consecutive
                #     true
                # Letters != consecutive
                #     false
            #end    
        end
    end



    #PseudoCode for Valid Placement Method (try to use "helper methods"):
        # 1 - the number of cells passed must be equal to the length of a ship
        # 2 - check if coordinates are consecutive
            # look at each element of array (use [.each] or [.map] method?)
                
            # SKIP THIS AND SEE NEXT STEP: split each element in half - ?? use the [.split] method? 
                
            # put <index0/Letters> in one array AND <index-1/Numbers> into one array

                # check if Letters Array are all same OR if Number Array are all same
                # IF N or [||] L NOT ALL SAME: => false

                # IF L ARE ALL SAME: 
                    # N should be consecutive (ie. 1-2-3-) (ie. NOT the same) - need to change to [.to_i] integers
                        # if N consecutive => true
                        # if N not consecutive => false

                # IF N ARE ALL SAME:
                # L should be consecutive (A-B-C-) - ?? use [.ord] to see ordinal number of the letters so they can be compaired/ranked??
                    #if L are consecutive: => true
                    #if L are NOT consecutive: => false

            # 3 - ensure A1 A1 A1 will NOT pass the test

    # OLD Pseudocode:
        # If L are same check #, if # are same check L
        # need to look at horizonal and vertical order
        # .uniq to see each element in an array is unique (avoid A1, A1, A1)
        # if the letter is unique (all As) then check the numbers.
        # L - group then into an array see if each letter is same IF yes then check order of #s
        # Numb - check they are same/different && [1,2,3]consecutive


end