require 'spec_helper'

RSpec.describe Player  do 
  before do 
    @player_1 = Player.new
  end

  describe "#initialize" do 
    it "can exist" do 
      expect(@player_1).to be_a Player
    end

    it "has a piece to play that is x" do 
      expect(@player_1.piece).to eq("x")
    end
  end
end