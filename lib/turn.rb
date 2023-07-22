class Turn
  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def get_move
    columns = ["a", "b", "c", "d", "e", "f", "g"]
    move = validate_move(gets.chomp.downcase, columns)
    @board.board_grid.reverse.each do |row|
      # require 'pry';binding.pry
      if row[(columns.index(move))].state == "."
        index_1 = @board.board_grid.index(row)
        index_2 = columns.index(move)
        set_cell(index_1, index_2)
        break
      end
    end
  end

  def validate_move(move, valid_columns)
    while !valid_columns.include?(move)
      puts "Oops, that's an invalid move. Please select column A-G!"
      move = gets.chomp.downcase
    end
    move
  end

  def set_cell(index_1, index_2)
    @board.board_grid[index_1][index_2].set_state(@player.piece)
  end
end