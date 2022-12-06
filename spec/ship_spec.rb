require 'rspec'
require './lib/ship'


#A Ship object will represent a single ship on the board. It will be able to keep track of how much health it has, take hits, and report if it is sunk or not. A ship should start off with health equal to it’s length.

describe Ship do
    
    it 'can initialize new ship object'do

        cruiser = Ship.new("Cruiser", 3)

        expect(cruiser).to be_an_instance_of(Ship)

    end

    it 'has readable attributes' do

        cruiser = Ship.new("Cruiser", 3)

        expect(cruiser.name).to eq("Cruiser")
        expect(cruiser.length).to eq(3)
        expect(cruiser.health).to eq(3)
        expect(cruiser.sunk?).to be false

    end

    xit 'can take hits' do

        cruiser = Ship.new("Cruiser", 3)
        cruiser.hit

        expect(cruiser.health).to eq(2)
        
        cruiser.hit

        expect(cruiser.health).to eq(1)
        expect(cruiser.sunk?).to be false

        cruiser.hit

        expect(cruiser.sunk?).to be true
    
    end

end




