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
        @taken_fire = true
        if @ship != nil
            @ship.hit
        end
    end

    def render(boolean = false)

        if @taken_fire == true && @ship == nil
            @render_state = "M"
        elsif @taken_fire == false
            @render_state = "."
        end
        @render_state
    end
end