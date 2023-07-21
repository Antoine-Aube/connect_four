require 'spec_helper'

RSpec.describe Cell do 
  describe "#initialize" do 
    it "it can exist" do 
      cell = Cell.new

      expect(cell).to be_a Cell
    end
  end
end