require 'spec_helper'

RSpec.describe Cell do 
  describe "#initialize" do 
    it "it can exist" do 
      cell = Cell.new
      
      expect(cell).to be_a Cell
    end
  end
  
  describe "#set_state" do 
    it "has a starting state of a dot(period)" do 
      cell = Cell.new
      
      expect(cell.state).to eq(".")
    end   
  end
end