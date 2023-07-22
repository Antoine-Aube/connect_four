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

    it "has columns that is an array a-g" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      expect(turn.columns).to eq(["a", "b", "c", "d", "e", "f", "g"])
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
    # can't really test sad paths on these as they would repeat user inputs
    it "validates the player move against valid columns" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      columns = ["a", "b", "c", "d", "e", "f", "g"]
      
      expect(turn.validate_move("a", columns)).to eq("a")
      expect(turn.validate_move("g", columns)).to eq("g")
    end

    it "only validates if the column is not full" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      columns = ["a", "b", "c", "d", "e", "f", "g"]
      board.board_grid[0][1].set_state('x')
      
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
  
  describe "#validate_computer move" do 
    it "validates if computers random move" do 
      computer = Computer.new
      board = Board.new
      turn = Turn.new(computer, board)
      columns = ["a", "b", "c", "d", "e", "f", "g"]
      
      
      expect(turn.validate_cpu_move("b", columns)).to eq("b")
    end
    
    it "returns invalid if the column is full" do 
      computer = Computer.new
      board = Board.new
      turn = Turn.new(computer, board)
      columns = ["a", "b", "c", "d", "e", "f", "g"]
      
      board.board_grid[0][0].set_state("x")
      expect(turn.validate_cpu_move("a", columns)).to eq("invalid")
    end
  end 
  
  describe "#find_lowest_cell_in_column" do 
    it "can find the lowest cell and set_player piece" do 
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      move = "a"
      
      # require 'pry';binding.pry
      turn.find_lowest_cell_in_column(move, turn.columns)
      expect(board.board_grid[4][0].state).to eq(".")
      expect(board.board_grid[5][0].state).to eq("x")
    end
  end 
end