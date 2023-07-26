require 'spec_helper'

RSpec.describe Computer do 
  before do 
    @computer = Computer.new
  end
  describe "#initialize" do 
    it "exists" do 
    
      expect(@computer).to be_a Computer
    end

    it "has a piece that is o" do 

      expect(@computer.piece).to eq("O")
    end 
  end 

  describe "#winner" do
    it "can be marked as a winner" do
      expect(@computer.winner).to be false
    end

    it "can be set to true" do
      @computer.winner = true

      expect(@computer.winner).to be true
    end
  end
end