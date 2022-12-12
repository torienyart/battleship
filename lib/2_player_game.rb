class TwoPlayerGame
    attr_reader :champion

    def initialize
        @p1_name = ''
        @p1_board = Board.new
        @p1_cruiser = Ship.new("Cruiser", 3)
        @p1_submarine = Ship.new("Submarine", 2)

        @p2_name = ''
        @p2_board = Board.new
        @p2_cruiser = Ship.new("Cruiser", 3)
        @p2_submarine = Ship.new("Submarine", 2) 

        @champion = false
    end

    def start
        puts "*======================================================*"
        puts
        puts
        puts "Yo Ho! Wonderful choice. What be yer names? "
        puts "Enter Player1s name:"

        @p1_name = 'Captain ' + gets.chomp

        puts
        puts
        puts "Ahoy #{@p1_name}, welcome aboard."
        puts "Enter Player2s name:"

        @p2_name = 'Captain ' + gets.chomp

        puts
        puts
        puts "Aye aye #{@p2_name}, welcome aboard."
        
        setup
    end

    def setup
        puts
        puts "*======================================================*"
        puts
        puts
        puts "Alright, #{@p1_name}, you're up — #{@p2_name}, look away for this part or yer a cheater.\n" +
        "I hope you have your sea legs, time to arrange your two ships.\n"
        puts
        puts "The Cruiser is three units long and the Submarine is two units long.\n"
        puts
        puts @p1_board.render(false)
        p1_ship_placement
        puts "Shiver me timbers, #{@p2_name}, it's you're turn — #{@p1_name} look away for this part or you'll walk the plank! \n" +
        "I hope you have your sea legs, time to arrange your two ships.\n"
        puts
        puts "The Cruiser is three units long and the Submarine is two units long.\n"
        puts
        puts @p2_board.render(false)
        p2_ship_placement
        turn
    end

    def p1_ship_placement
        puts
        puts "Enter the squares for the Cruiser (3 spaces like this Z1 Z2 Z3):\n> "

        loop do 
            user_input = gets.chomp.upcase.split(" ")

            if @p1_board.valid_coordinate?(user_input) == true && @p1_board.valid_placement?(@p1_cruiser, user_input) == true
                @p1_board.place(@p1_cruiser, user_input)
                break 
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p1_board.render(true)
        puts
        puts "Enter the squares for the Submarine (2 spaces like this Z1 Z2):\n> "
            
        loop do
            user_input = gets.chomp.upcase.split(" ")
            if @p1_board.valid_coordinate?(user_input) == true && @p1_board.valid_placement?(@p1_submarine, user_input) == true
                @p1_board.place(@p1_submarine, user_input) 
                break
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p1_board.render(true)
        15.times do
            puts
        end
        puts "*======================================================*"
        puts 
        puts "*Yo ho ho* ...You've placed all your ships! I'd suggest writing down their coordinates where #{@p2_name} can't see!"
        15.times do
            puts
        end
    end

    def p2_ship_placement
        puts
        puts "Enter the squares for the Cruiser (3 spaces like this Z1 Z2 Z3):\n> "

        loop do 
            user_input = gets.chomp.upcase.split(" ")

            if @p2_board.valid_coordinate?(user_input) == true && @p2_board.valid_placement?(@p2_cruiser, user_input) == true
                @p2_board.place(@p2_cruiser, user_input)
                break 
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p2_board.render(true)
        puts
        puts "Enter the squares for the Submarine (2 spaces like this Z1 Z2):\n> "
            
        loop do
            user_input = gets.chomp.upcase.split(" ")
            if @p2_board.valid_coordinate?(user_input) == true && @p2_board.valid_placement?(@p2_submarine, user_input) == true
                @p2_board.place(@p2_submarine, user_input) 
                break
            else
                puts "Nice try you cheating privy rat — try again with valid coordinates!:\n> "
            end
        end

        puts @p2_board.render(true)
        15.times do
            puts
        end
        puts "*======================================================*"
        puts 
        puts "*Yo ho ho* ...You've placed all your ships! I'd suggest writing down their coordinates where #{@p1_name} can't see!"
        puts "LET'S BEGIN"
        15.times do
            puts
        end
        turn
    end

    def turn 
        while @champion == false
            start_turn_statement
            player1_shot
            champion?
            if @champion == false
                player2_shot
                champion?
            end
        end
    end

    def start_turn_statement
        puts "*======================================================*"
        puts
        puts "=============#{@p1_name.upcase} BOARD=============\n"
        puts @p1_board.render(false)
        puts "==============#{@p2_name.upcase} BOARD==============\n"
        puts @p2_board.render(false)
    end

    def player1_shot
        shot_fired = false

        while shot_fired == false
            puts "*======================================================*"
            puts
            puts "Arlighty then #{@p1_name} — enter the coordinate for your shot:\n> "
            @p1_shot = gets.chomp.upcase
            if @p2_board.valid_coordinate?([@p1_shot]) == true && @p2_board.cells[@p1_shot].fired_upon? == false
                @p2_board.cells[@p1_shot].fire_upon 
                shot_fired = true
            else
                puts "You CHEATER! Try attacking with a valid coordinate you haven't already fired at."
                shot_fired = false
            end
        end

        puts
        puts "*======================================================*"
        puts
        puts "Your shot on #{@p1_shot} was a #{p1_render_status}"
    end

    def player2_shot
        shot_fired = false

        while shot_fired == false
            puts "*======================================================*"
            puts
            puts "Arlighty then #{@p2_name} enter the coordinate for your shot:\n> "
            @p2_shot = gets.chomp.upcase
            if @p1_board.valid_coordinate?([@p2_shot]) == true && @p1_board.cells[@p2_shot].fired_upon? == false
                @p1_board.cells[@p2_shot].fire_upon 
                shot_fired = true
            else
                puts "You CHEATER! Try attacking with a valid coordinate you haven't already fired at."
            end
        end

        puts
        puts "*======================================================*"
        puts
        puts "Your shot on #{@p2_shot} was a #{p2_render_status}"
    end

    def p1_render_status
        if @p2_board.cells[@p1_shot].render == "M"
           "miss... better luck next time #{@p1_name}."
        elsif @p2_board.cells[@p1_shot].render == "H"
            "hit. *;*OUch*;*, that looks like it hurt #{@p2_name}"
        elsif @p2_board.cells[@p1_shot].render == "X"
            "hit. Blimey, you sunk #{@p2_name}'s ship!"
        end
    end

    def p2_render_status
        if @p1_board.cells[@p2_shot].render == "M"
           "miss... better luck next time #{@p2_name}."
        elsif @p1_board.cells[@p2_shot].render == "H"
            "hit. *;*OUch*;*, that looks like it hurt #{@p1_name}"
        elsif @p1_board.cells[@p2_shot].render == "X"
            "hit. Blimey, you sunk #{@p1_name}'s ship!"
        end
    end

    def champion?
        if @p1_cruiser.sunk? == true && @p1_submarine.sunk? == true 
            @champion = true
            puts "*=======================GAME-OVER=======================*"
            puts
            puts "=============#{@p1_name.upcase} BOARD=============\n"
            puts @p1_board.render(true)
            puts "==============#{@p2_name.upcase} BOARD==============\n"
            puts @p2_board.render(true)
            puts
            puts "#{@p2_name} rules the seven seas! #{@p1_name} will rot for eternity in Davy Jones's Locker!"
            puts
            puts
        elsif @p2_cruiser.sunk? == true && @p2_submarine.sunk? == true
            @champion = true

            puts "*=======================GAME-OVER=======================*"
            puts
            puts "=============#{@p1_name.upcase} BOARD=============\n"
            puts @p1_board.render(true)
            puts "==============#{@p2_name.upcase} BOARD==============\n"
            puts @p2_board.render(true)
            puts
            puts "#{@p1_name} rules the seven seas! #{@p2_name} will rot for eternity in Davy Jones's Locker!"
            puts
            puts
        else
            false
        end
    end
end
