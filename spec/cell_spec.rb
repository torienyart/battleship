require './lib/cell'
require './lib/ship'
require 'rspec'

describe Cell do

    #A Cell object is a single cell on our board. A Cell can either contain a Ship or nothing.
    it 'can initialize new cell object' do

        cell = Cell.new("B4")

        expect(cell).to be_an_instance_of(Cell)

    end

    it 'has readable attributes' do

        cell = Cell.new("B4")

        expect(cell.coordinate).to eq("B4")
        expect(cell.ship).to be nil
        expect(cell.empty?).to be true

    end

    it 'can place a ship' do

        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)

        expect(cell.ship).to eq(cruiser)
        expect(cell.empty).to be false
    end

    #Additionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:

    xit 'can adjust fire upon and update ship health' do

        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)

        expect(cell.fired_upon?).to be false
        
        cell.fired_upon

        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to be true

    end

    #Finally, a Cell will have a method called render which returns a String representation of the Cell for when we need to print the board.


    xit 'can render a cell as M' do
        
        cell_1 = Cell.new("B4")

        expect(cell_1.render).to eq(".")

        cell_1.fire_upon

        expect(cell_1.render).to eq("M")

    end

    xit 'can render with an argument' do
        
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        cell_2.place_ship(cruiser)

        expect(cell_2.render).to eq(".")

        # Indicate that we want to show a ship with the optional argument

        expect(cell_2.render(true)).to eq("S")

    end

    xit 'can render after a hit' do
        
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        cell_2.place_ship(cruiser)

        expect(cell_2.render).to eq(".")

        cell_2.fire_upon

        expect(cell_2.render).to eq("H")
        expect(cruiser.sunk?).to be false
        
        cruiser.hit
        cruiser.hit

        expect(cruiser.sunk?).to be true
        expect(cell_2.render).to eq("X")

    end

end