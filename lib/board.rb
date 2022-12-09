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
        # I know the if method is redundant... do I just leave the line of text by itself? 
        if correct_length? && consecutive_cells?
            true
        elsif
            false
        end
    end
       
    # ensures the amount of cells passed are equal to the length of a ship
    # How do we call the placement_attempt_array in this helper method? 
    def correct_length?
        if placement_attempt_array.size == ship.length 
            true
        elsif placement_attempt_array.size != ship.length
            false
        end
    end
            
    # ensures the placement attempt elements passed are consecutive
    # How do we call the placement_attempt_array in this helper method? 
    def consecutive_cells?
        letters = []
        numbers = []

        placement_attempt_array.each do |indv_coordinate|
            letters << indv_coordinate.index[0] #.ord
            numbers << indv_coordinate.index[-1] #.to_i
        end
 
        if letters.all? != true || numbers.all? != true
            false
                
        elsif letters.all? == true
            # maybe I need to order the numbers? => numbers.sort ?
            # again, I'm being redundant with If conditional... do I just leave the line of text by itself?
            if numbers.each_cons(ship.length.size) == true
                true
            else
                false
        end
                
        elsif numbers.all? == true 
            if letters.each_cons(ship.length.size) == true
                true
            else
                false
            end    
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