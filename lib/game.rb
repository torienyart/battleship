class Game
    attr_reader :champion

    def initialize()
        @p_board = Board.new
        @p_cruiser = Ship.new("Cruiser", 3)
        @p_submarine = Ship.new("Submarine", 2)

        @c_board = Board.new
        @c_cruiser = Ship.new("Cruiser", 3)
        @c_submarine = Ship.new("Submarine", 2) 

        @champion = false
    end

    def start
        puts "*======================================================*"
        puts
        puts
        puts "Yarrgggg.... you're brave enough to walk the plank and battle the Computer Pirate are ye?"
        puts "Let's begin..."
        setup
    end
    
    def welcome
        
    end

    def setup
        puts
        puts "*======================================================*"
        puts
        puts
        puts "I, Computer Pirate, have arranged me ships for battle.\n" +
        "I hope you have your sea legs, time to arrange your two ships.\n"
        puts
        puts "The Cruiser is three units long and the Submarine is two units long.\n"
        puts
        puts @p_board.render(false)
        c_ship_placement
        p_ship_placement
    end

    def c_ship_placement
        loop do 
            comp_input = @c_board.cells.keys.sample(3)
            if  @c_board.valid_placement?(@c_cruiser, comp_input) == true
                @c_board.place(@c_cruiser, comp_input)
                break 
            else
                false
            end
        end
        
        loop do
            comp_input = @c_board.cells.keys.sample(2)
            if @c_board.valid_placement?(@c_submarine, comp_input) == true
                @c_board.place(@c_submarine, comp_input) 
                break
            else
                false
            end
        end
    end


    def p_ship_placement
        puts
        puts "Enter the squares for the Cruiser (3 spaces like this Z1 Z2 Z3):\n> "

        loop do 
            user_input = gets.chomp.upcase.split(" ")

            if@p_board.valid_coordinate?(user_input) == true && @p_board.valid_placement?(@p_cruiser, user_input) == true
                @p_board.place(@p_cruiser, user_input)
                break 
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p_board.render(true)
        puts
        puts "Enter the squares for the Submarine (2 spaces like this Z1 Z2):\n> "
            
        loop do
            user_input = gets.chomp.upcase.split(" ")
            if @p_board.valid_coordinate?(user_input) == true && @p_board.valid_placement?(@p_submarine, user_input) == true
                @p_board.place(@p_submarine, user_input) 
                break
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p_board.render(true)
        puts
        puts "*======================================================*"
        puts 
        puts "*Shiver me timbers* ...You've placed all your ships! FIRE!"
        puts
        turn
    end

    def turn 
        while @champion == false
            start_turn_statement
            player_shot
            champion?
            if @champion == false
                computer_shot
                champion?
            end
        end
    end

    def start_turn_statement
        puts "=============COMPUTER BOARD=============\n"
        puts @c_board.render(false)
        puts "==============PLAYER BOARD==============\n"
        puts @p_board.render(true)
    end

    def player_shot
        shot_fired = false

        while shot_fired == false
            puts "Enter the coordinate for your shot:\n> "
            @user_shot = gets.chomp.upcase
            if @c_board.valid_coordinate?([@user_shot]) == true && @c_board.cells[@user_shot].fired_upon? == false
                @c_board.cells[@user_shot].fire_upon 
                shot_fired = true
            else
                puts "You CHEATER! Try attacking with a valid coordinate you haven't already fired at."
            end
        end

        puts
        puts "*======================================================*"
        puts
        puts "Your shot on #{@user_shot} was a #{p_render_status}"
    end

    def computer_shot
        shot_fired = false

        while shot_fired == false
            @comp_shot = @p_board.cells.keys.sample
            if @p_board.cells[@comp_shot].fired_upon? == false
                @p_board.cells[@comp_shot].fire_upon 
                shot_fired = true
            else
                shot_fired = false
            end
        end

        puts "My shot on #{@comp_shot} was a #{c_render_status}"
        puts
        puts
    end

    def p_render_status
        if @c_board.cells[@user_shot].render == "M"
           'miss... better luck next time loser.' 
        elsif @c_board.cells[@user_shot].render == "H"
            'hit. *;*OUch*;*'
        elsif @c_board.cells[@user_shot].render == "X"
            'hit. Blimey, you sunk my ship you pillaging sea scum!'
        end
    end

    def c_render_status
        if @p_board.cells[@comp_shot].render == "M"
           'miss... Ill get you next time....' 
        elsif @p_board.cells[@comp_shot].render == "H"
            'hit. Feels good, doesnt it......'
        elsif @p_board.cells[@comp_shot].render == "X"
            'hit. Take that you scabby sea bass!'
        end
    end

    def champion?
        if @p_cruiser.sunk? == true && @p_submarine.sunk? == true 
            @champion = true
            puts "*=======================GAME-OVER=======================*"
            puts
            puts
            puts "I won! I hope you rot for eternity in Davy Jones's Locker!"
            puts
            puts
        elsif @c_cruiser.sunk? == true && @c_submarine.sunk? == true
            @champion = true
            puts "*=======================GAME-OVER=======================*"
            puts
            puts
            puts "You've *plundered* my fleet. :( Command the seas wisely you rapscallion!"
            puts
            puts
        else
            false
        end
        @quit = false
    end
end
