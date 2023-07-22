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

  describe "#board_is_full" do 
    it "returns true if the first row is full" do 
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      
      expect(board.board_is_full?).to eq(false)
      
      board.board_grid[0][0].set_state("x")
      board.board_grid[0][1].set_state("x")
      board.board_grid[0][2].set_state("x")
      board.board_grid[0][3].set_state("x")
      board.board_grid[0][4].set_state("x")
      board.board_grid[0][5].set_state("x")

      expect(board.board_is_full?).to eq(false)

      board.board_grid[0][6].set_state("x")
            
      expect(board.board_is_full?).to eq(true)
    end
  end
end
