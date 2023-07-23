class Turn
  attr_reader :player, :board, :columns

  def initialize(player, board)
    @player = player
    @board = board
    @columns = ["a", "b", "c", "d", "e", "f", "g"]
  end

  def get_move
    move = validate_move(gets.chomp.downcase, @columns)
    find_lowest_cell_in_column(move, @columns)
  end
  
  def validate_move(move, valid_columns)
    while !valid_columns.include?(move) || column_is_full?(move, valid_columns)
      puts "Oops, that's an invalid move, or a full column. Please select column A-G!"
      move = gets.chomp.downcase
    end
    move
  end
  
  def get_computer_move
    computer_move = @columns.sample
    while validate_cpu_move(computer_move, columns) == "invalid"
      computer_move = @columns.sample
    end
    find_lowest_cell_in_column(computer_move, @columns)
  end

  def validate_cpu_move(move, valid_columns)
    if column_is_full?(move, valid_columns)
      return "invalid"
    else 
      move
    end
  end

  def find_lowest_cell_in_column(move, valid_columns)
    @board.board_grid.reverse.each do |row|
      if row[(valid_columns.index(move))].state == "."
        set_cell(@board.board_grid.index(row), valid_columns.index(move))
        check_horizontal_win(@board.board_grid.index(row), valid_columns.index(move))
        break
      end
    end
  end

  def column_is_full?(move, columns)
    column_index = @columns.index(move)
    @board.board_grid[0][column_index].state != "."
  end

  def set_cell(index_1, index_2)
    @board.board_grid[index_1][index_2].set_state(@player.piece)
  end

  def check_horizontal_win(index_1, index_2)
    current_pos = @board.board_grid[index_1][index_2]
    current_index = 0 + index_2
    pieces_in_a_row = 1
    until current_index < 0 || (current_pos.state != @player.piece)
      pieces_in_a_row += 1 if current_index < index_2
      current_index -= 1
      current_pos = @board.board_grid[index_1][current_index]
    end
    current_pos = @board.board_grid[index_1][index_2]
    current_index = 0 + index_2
    until current_index > 6 || (current_pos.state != @player.piece)
      pieces_in_a_row += 1 if current_index > index_2
      current_index += 1
      current_pos = @board.board_grid[index_1][current_index]
    end
    @player.winner = true if pieces_in_a_row >= 4
  end
end