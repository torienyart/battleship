require 'rspec'
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/game"

RSpec.describe Game do
    let(:game) {Game.new}

    describe "Setup" do

        it "can initialize a new instance of a game" do
            expect(game).to be_an_instance_of(Game)
        end

        it 'can check champion status' do
            expect(game.champion).to be false
        end

    end
end