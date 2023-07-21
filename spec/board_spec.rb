require 'spec_helper'

RSpec.describe Board do 
  describe "intialize" do 
    it "exists" do 
      board = Board.new

      expect(board).to be_a Board
    end
  end
end
