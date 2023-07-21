require 'spec_helper'

RSpec.describe Player  do 
  before do 
    @player_1 = Player.new
  end

  describe "#initialize" do 
    it "can exist" do 
      expect(@player_1).to be_a Player
    end
  end
end