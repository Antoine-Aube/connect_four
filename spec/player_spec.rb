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
  
  describe "#winner" do
    it "can be marked as a winner" do
      expect(@player_1.winner).to be false
    end

    it "can be set to true" do
      @player_1.winner = true

      expect(@player_1.winner).to be true
    end
  end
end