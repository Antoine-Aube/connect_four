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
      
      turn.move = "a"
      expect(board.board_grid[5][0].state).to eq(".")
      turn.set_cell

      expect(board.board_grid[5][0].state).to eq("x")
    end
  end

  describe "#validate_player_move" do
    # can't really test sad paths on these as they would repeat user inputs
    it "validates the player move against valid columns" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      
      expect(turn.validate_player_move("a")).to eq("a")
      expect(turn.validate_player_move("g")).to eq("g")
    end

    it "only validates if the column is not full" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      board.board_grid[0][1].set_state('x')
      
      expect(turn.validate_player_move("a")).to eq("a")
      expect(turn.validate_player_move("g")).to eq("g")
    end
  end

  describe "#column_is_full?" do
    it "returns true/false if a column is currently full (top row has a piece)" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      board.board_grid[0][0].set_state("x")
      
      expect(turn.column_is_full?("a")).to be true
      expect(turn.column_is_full?("b")).to be false
    end
  end
  
  describe "#validate_computer_move" do 
    it "validates the computers random move" do 
      computer = Computer.new
      board = Board.new
      turn = Turn.new(computer, board)
      
      expect(turn.validate_cpu_move("b")).to eq("b")
    end
    
    it "returns invalid if the column is full" do 
      computer = Computer.new
      board = Board.new
      turn = Turn.new(computer, board)
      
      board.board_grid[0][0].set_state("x")
      expect(turn.validate_cpu_move("a")).to eq("invalid")
    end
  end 
  
  describe "#find_lowest_cell_in_column" do 
    it "can find the lowest cell and set_player piece" do 
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      turn.move = "a"
      expect(turn.find_lowest_cell_in_column).to eq([5, 0])

      turn.move = "b"
      board.board_grid[5][1].set_state("x")
      
      expect(turn.find_lowest_cell_in_column).to eq([4, 1])
    end
  end

  describe "#check_horizontal_win" do
    it "sets the current player as the winner if 4 pieces exist in a row horizontally" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      turn.check_horizontal_win
      expect(player.winner).to be false

      board.board_grid[5][0].set_state("x")
      board.board_grid[5][1].set_state("x")
      board.board_grid[5][2].set_state("x")
      board.board_grid[5][3].set_state("x")
      turn.check_horizontal_win

      expect(player.winner).to be true
    end
  end

  describe "#check_vertical_win" do
    it "sets the current player as the winner if 4 pieces exist in a row vertically" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      turn.move = "b"

      turn.check_vertical_win
      expect(player.winner).to be false

      board.board_grid[2][1].set_state("x")
      board.board_grid[3][1].set_state("x")
      board.board_grid[4][1].set_state("x")
      board.board_grid[5][1].set_state("x")
      turn.check_vertical_win
    
      expect(player.winner).to be true
    end
  end

  describe "#check_win_conditions" do
    it "checks for horizontal wins" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      turn.move = "b"

      board.board_grid[4][0].set_state("x")
      board.board_grid[4][1].set_state("x")
      board.board_grid[4][2].set_state("x")
      board.board_grid[4][3].set_state("x")

      turn.check_win_conditions

      expect(player.winner).to be true
    end

    it "checks for vertical wins" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)
      turn.move = "c"

      board.board_grid[2][2].set_state("x")
      board.board_grid[3][2].set_state("x")
      board.board_grid[4][2].set_state("x")
      board.board_grid[5][2].set_state("x")

      turn.check_win_conditions

      expect(player.winner).to be true
    end
  end

  describe "#board_as_state" do
    it "get the current board with all cell states" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      expect(turn.get_board_as_states).to all be_an Array
      expect(turn.get_board_as_states[0]).to all eq(".")
    end

    it "accounts for cells not in their default state" do
      player = Player.new
      board = Board.new
      turn = Turn.new(player, board)

      board.board_grid[2][2].set_state("x")

      expect(turn.get_board_as_states[2]).to include('x')
    end
  end
end