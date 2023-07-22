require 'spec_helper'

RSpec.describe Turn do
  describe "#initialize" do
    it "exists" do
      turn = Turn.new("player", "Board")

      expect(turn).to be_a Turn
    end

    it "has a player" do
      player = Player.new
      turn = Turn.new(player, "Board")

      expect(turn.player).to eq(player)
    end

    it "has a board" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      expect(turn.board).to eq(board)
    end
  end

  describe "#set_cell" do
    it "tells a cell to change state" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      
      expect(board.board_grid[0][0].state).to eq(".")
      turn.set_cell(0, 0)

      expect(board.board_grid[0][0].state).to eq("x")
    end
  end

  describe "#validate_move" do
    it "validates the player move against valid columns" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      columns = ["a", "b", "c", "d", "e", "f", "g"]
      
      expect(turn.validate_move("a", columns)).to eq("a")
      expect(turn.validate_move("g", columns)).to eq("g")
    end
  end

  describe "#column_is_full?" do
    it "returns true/false if a column is currently full (top row has a piece)" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      columns = ["a", "b", "c", "d", "e", "f", "g"]
      board.board_grid[0][0].set_state("x")

      expect(turn.column_is_full?("a", columns)).to be true
      expect(turn.column_is_full?("b", columns)).to be false
    end
  end
end