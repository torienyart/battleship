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

        @champion = nil
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
        puts "Enter the squares for the Cruiser (3 spaces like this Z1 Z2 Z3):\n> "
        
        #<while true do> would also work here (this is hard coding)
       loop do 
            user_input = gets.chomp.upcase.split(" ")

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(p_cruiser, user_input) == true
                p_board.place(p_cruiser, user_input)
                break 
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end
        
        puts p_board.render(true)
    
    #Sumbarine_placement
        puts "Enter the squares for the Submarine (2 spaces like this Z1 Z2):\n> "
            
        loop do
            user_input = gets.chomp.upcase.split(" ")

            if p_board.valid_coordinate?(user_input) == true && p_board.valid_placement?(p_submarine, user_input) == true
                p_board.place(p_submarine, user_input) 
                break
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts p_board.render(true)
        puts 
        puts "---------You've placed all your ships! Let's begin:---------\n"
        puts
        turn
    end

### TURN

    def turn # needs to be a loop until winner is true
        while champion? == false
            start_turn_statement
            player_shot
            computer_shot
        end
    end

    def start_turn_statement
        puts "=============COMPUTER BOARD=============\n"
        puts c_board.render(false)
        puts "==============PLAYER BOARD==============\n"
        puts p_board.render(true)
    end

    def player_shot
        puts "Enter the coordinate for your shot:\n> "
        @user_shot = gets.chomp.upcase
        shot_fired = false
        while shot_fired == false
            if c_board.valid_coordinate?([@user_shot]) == true && c_board.cells[@user_shot].fired_upon? == false
                c_board.cells[@user_shot].fire_upon 
                shot_fired = true
            else
                puts "You CHEATER! Try attacking with a valid coordinate you haven't already fired at."
            end
        end
        puts "Your shot on #{@user_shot} was a #{p_render_status}"
    end

    def computer_shot
        shot_fired = false
        while shot_fired == false
            @comp_shot = @p_board.cells.keys.sample

            if p_board.cells[@comp_shot].fired_upon? == false
                p_board.cells[@comp_shot].fire_upon 
                shot_fired = true
            else
                shot_fired = false
            end

        end
        puts "My shot on #{@comp_shot} was a #{c_render_status}"
    end

    def p_render_status
        if c_board.cells[@user_shot].render == "M"
           'miss... better luck next time loser.' 
        elsif c_board.cells[@user_shot].render == "H"
            'hit. *;*OUch*;*'
        elsif c_board.cells[@user_shot].render == "X"
            'hit. Blimey, you sunk my ship you pillaging sea scum!'
        end
    end

    def c_render_status
        if p_board.cells[@comp_shot].render == "M"
           'miss... Ill get you next time....' 
        elsif p_board.cells[@comp_shot].render == "H"
            'hit. Feels good, doesnt it......'
        elsif p_board.cells[@comp_shot].render == "X"
            'hit. Take that you unprepared sea scum!'
        end
    end

    ## END GAME
    def champion?
        if p_cruiser.sunk? == true && p_submarine.sunk? == true 
            puts "I won! Better take your battles on land from now on you scabby sea bass!!!"
            start
        elsif c_cruiser.sunk? == true && c_submarine.sunk? == true
            puts "You've plundered my fleet. The gold is yours, command the seas wisely you rapscallion!"
            start
        else
            false
        end
    end
end
