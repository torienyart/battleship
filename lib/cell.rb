class Cell

    attr_reader :coordinate,
                :ship,
                :empty,
                :taken_fire

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true
        @taken_fire = false
        @render_state = nil
    end

    def empty?
        if @empty == true
            true
        elsif @empty == false
            false
        end
    end

    def place_ship(ship)
        @ship = ship
        @empty = false
    end

    def fired_upon?
        if @taken_fire == false
            false
        elsif @taken_fire == true
            true
        end
    end

    def fire_upon
        if @ship != nil
            @ship.hit
            @taken_fire = true
        elsif @ship == nil
            @taken_fire = true
        end
    end

    #okay so i realized a bug here where a cell doesn't stop you from hitting it if it has already been hit... which damages the ship again incorrectly.  need to fix in fire_upon
    def render(boolean = false)
        if boolean == false
            if @taken_fire == true && @ship == nil
                @render_state = "M"
            elsif @taken_fire == true && @ship != nil && @ship.sunk? == false
                @render_state = "H"
            elsif @taken_fire == true && @ship != nil && @ship.sunk? == true
                @render_state = "X"
            elsif @taken_fire == false
                @render_state = "."
            end
        elsif boolean == true
            if @ship != nil && @taken_fire == false
                @render_state = "S"
            elsif @taken_fire == true && @ship == nil
                @render_state = "M"
            elsif @taken_fire == true && @ship != nil && @ship.sunk? == false
                @render_state = "H"
            elsif @taken_fire == true && @ship != nil && @ship.sunk? == true
                @render_state = "X"
            elsif @ship == nil && @taken_fire == false
                @render_state = "."
            end
        end
        @render_state
    end
end