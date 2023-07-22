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

      expect(@computer.piece).to eq("o")
    end 
  end 
end