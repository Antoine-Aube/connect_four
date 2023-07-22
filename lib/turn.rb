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
      if row[(columns.index(move))].state == "."
        set_cell(@board.board_grid.index(row), columns.index(move))
        break
      end
    end
  end
  
  def validate_move(move, valid_columns)
    while !valid_columns.include?(move) || column_is_full?(move, valid_columns)
      puts "Oops, that's an invalid move, or a full column. Please select column A-G!"
      move = gets.chomp.downcase
    end
    move
  end
  
  def get_computer_move
    columns = ["a", "b", "c", "d", "e", "f", "g"]
    computer_move = columns.sample
    while validate_cpu_move(computer_move, columns) == "invalid"
      computer_move = columns.sample
    end
    @board.board_grid.reverse.each do |row|
      if row[(columns.index(computer_move))].state == "."
        set_cell(@board.board_grid.index(row), columns.index(computer_move))
        break
      end
    end
  end

  def validate_cpu_move(move, valid_columns)
    if column_is_full?(move, valid_columns)
      return "invalid"
    else 
      move
    end
  end

  

  def column_is_full?(move, columns)
    column_index = columns.index(move)
    @board.board_grid[0][column_index].state != "."
  end

  def set_cell(index_1, index_2)
    @board.board_grid[index_1][index_2].set_state(@player.piece)
  end
end