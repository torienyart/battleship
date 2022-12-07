class Cell

    attr_reader :coordinate,
                :ship,
                :empty

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true
    end

    def empty?
        if @empty == true
            true
        elsif @empty == false
            false
        end
    end



end