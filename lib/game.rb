class Game
    attr_reader :p_board,
                :p_cruiser,
                :p_submarine,
                :c_board, 
                :c_cruiser,
                :c_submarine

    def initialize()
        @p_board = Board.new
        @p_cruiser = Ship.new("Cruiser", 3)
        @p_submarine = Ship.new("Submarine", 2)

        @c_board = Board.new
        @c_cruiser = Ship.new("Cruiser", 3)
        @c_submarine = Ship.new("Submarine", 2) 
    end

# require 'pry'; binding.pry

### MAIN MENU

    def start
            puts "Welcome to BATTLESHIP\n" +
            "Enter p to play. Enter q to quit.\n"

        loop do
            user_choice = gets.chomp.downcase

            if user_choice == "p"
                setup
            elsif user_choice == "q"
                break
            else 
                puts "Didn't understsand that.\n"
                "Enter p to play. Enter q to quit.\n"
            end
        end

    end


### GAME SETUP

    def setup
        puts "I have laid out my ships on the grid.\n"
        "You now need to lay out your two ships.\n"
        "The Cruiser is three units long and the Submarine is two units long.\n"
        
        puts @p_board.render(false)
        
        c_ship_placement
        p_ship_placement
    end

    def c_ship_placement
        
        loop do 
            comp_input = @c_board.cells.keys.sample(3)

            if  c_board.valid_placement?(c_cruiser, comp_input) == true
                c_board.place(c_cruiser, comp_input)
                break 
            else
                false
            end
        end
        
        loop do
            comp_input = @c_board.cells.keys.sample(2)

            if c_board.valid_placement?(c_submarine, comp_input) == true
                c_board.place(c_submarine, comp_input) 
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
            user_input = gets.chomp.upcase.split(" ")

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(p_cruiser, user_input) == true
                p_board.place(p_cruiser, user_input)
                break 
            else
                puts "Those are invalid coordinates. Please try again:\n> "
            end
        end
        
        puts p_board.render(true)
    
    #Sumbarine_placement
        puts "Enter the squares for the Submarine (2 spaces):\n> "
            
        loop do
            user_input = gets.chomp.upcase.split(" ")

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(p_submarine, user_input) == true
                p_board.place(p_submarine, user_input) 
                break
            else
                puts "Those are invalid coordinates. Please try again:\n> "
            end
        end

        puts p_board.render(true)
        puts "You've placed all your ships! Let's begin:\n"
        turn
    end

### TURN

    def turn
        puts "=============COMPUTER BOARD=============\n"
        c_board.render(false)
            "==============PLAYER BOARD==============\n"
        p_board.render(true)

    # Player Shot
        puts "Enter the coordinate for your shot:\n> "
        
        loop do
            user_input = gets.chomp.upcase
            if c_board.valid_coordinate?(user_input) == true 

               c_board.cell.fire_upon(user_input) 

                    if c_board.cell.fired_upon?(user_input) == true
                        champion?
                        break
                    else 
                        puts "Your shot on #{user_input} was a miss."
                        break
                    end

            else
                puts "Please enter a valid coordinate:\n> "
            end
        end

    # Computer Shot
        loop do
            comp_input = @c_board.cells.keys.sample
            #issue here maybebecause its NOT only submarine ship... but also cruiser??
            if p_board.valid_coordinate?(comp_input) == true && p_board.valid_placement?(p_submarine, comp_input) == true
                p_board.cell.fire_upon(comp_input) 
                champion?
                break
            else
                puts "My shot on #{comp_input} was a miss."
            end
        end

        turn
    end

## END GAME
    def champion?

        if p_cruiser.sunk? == true && p_submarine.sunk? == true 
            puts "I won!"
            start
        elsif c_cruiser.sunk? == true && c_submarine.sunk? == true
            puts "You won!"
            start
        else
            ###return to player or computer shot
        end

    end


end
