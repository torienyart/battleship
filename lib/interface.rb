class Interface

    def initialize
        @normal_game = Game.new
        @two_player_game = TwoPlayerGame.new
        @quit = false
    end

    def run_game
        until @quit == true
            choose
        end

    end
    def welcome
        puts "*======================================================*"
        puts
        puts
        puts "Ahoy mateys! Test your wits at BATTLESHIP — a game of the seven seas.\n" +
        "Enter 1 to play against the computer, enter 2 to play against a partner, or enter q to quit"
    end

    def choose
    
        loop do
            welcome
            game_type = gets.chomp
            if game_type == '1' || game_type.downcase == "one"
                @normal_game.start
            elsif game_type == '2' || game_type.downcase == "two"
                @two_player_game.start
            elsif game_type.downcase == 'q'
                @quit = true
                break
            else
                puts "Yargh, I didn't understsand that. Make up your mind! I'm a very busy pirate!\n"
            end
        end
    end
end