require 'spec_helper'

RSpec.describe Board do 
  describe "intialize" do 
    it "exists" do 
      board = Board.new
      
      expect(board).to be_a Board
    end
    
    it "it has a board grid" do 
      board = Board.new

      expect(board.board_grid).to be_a Array 
      # require 'pry';binding.pry
    end
  end
end
