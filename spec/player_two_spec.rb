require 'spec_helper'

RSpec.describe PlayerTwo  do 
  before do 
    @player_2 = PlayerTwo.new
  end

  describe "#initialize" do 
    it "can exist" do 
      expect(@player_2).to be_a PlayerTwo
    end

    it "has a piece to play that is x" do 
      expect(@player_2.piece).to eq("@")
    end

  end
  
  describe "#winner" do
    it "can be marked as a winner" do
      expect(@player_2.winner).to be false
    end

    it "can be set to true" do
      @player_2.winner = true

      expect(@player_2.winner).to be true
    end
  end
end