class Game
    attr_reader :p_board,
                :p_cruiser,
                :p_sub,
                :c_board, 
                :p_cruiser,
                :p_sub

    def initialize()
        @p_board = Board.new
        @p_cruiser = Ship.new("Cruiser", 3)
        @p_sub = Ship.new("Submarine", 2)

        @c_board = Board.new
        @c_cruiser = Ship.new("Cruiser", 3)
        @c_sub = Ship.new("Submarine", 2) 
    end

# require 'pry'; binding.pry

    def start
        puts "I have laid out my ships on the grid.\n"
        "You now need to lay out your two ships.\n"
        "The Cruiser is three units long and the Submarine is two units long.\n"
        
        # puts @p_board.render(false)
        
        c_ship_placement
        puts c_board.render(true)

        p_ship_placement
    end

    def c_ship_placement
        
        loop do 
            comp_input = @c_board.cells.keys.sample(3)

            if c_board.valid_coordinate?(comp_input) == true && c_board.valid_placement?(cruiser, comp_input) == true
                c_board.place(cruiser, comp_input)
                break 
            else
                false
            end
        end
        
        loop do
            comp_input = @c_board.cells.keys.sample(2)

            if c_board.valid_coordinate?(comp_input) == true && c_board.valid_placement?(submarine, comp_input) == true
                c_board.place(submarine, comp_input) 
                break
            else
                false
            end
        end
    end


    def p_ship_placement
    #Cruiser_Placement
        puts "Enter the squares for the Cruiser (3 spaces):\n> "
        
        #<while true do> would also work here (this is hard coding)
       loop do 
            user_input = gets.chomp.upcase

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(cruiser, user_input) == true
                p_board.place(cruiser, user_input)
                break 
            else
                puts "Those are invalid coordinates. Please try again:\n> "
            end
        end
        
        puts p_board.render(true)
    
    #Sumbarine_placement
        puts "Enter the squares for the Submarine (2 spaces):\n> "
            
        loop do
            user_input = gets.chomp.upcase

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(submarine, user_input) == true
                p_board.place(submarine, user_input) 
                break
            else
                puts "Those are invalid coordinates. Please try again:\n> "
            end
        end

        puts p_board.render(true)
    end

end



# PseudoCode for ship_placement:
        # comp accepts user input: coordinates
        # when those coord are BOTH are .valid_coordinate? .valid_placement? are TRUE
            #if TRUE: .place the ship
            #if FALSE: print try again screen
        #Then, repeate for other ship