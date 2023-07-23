class Turn
  attr_reader :player,
              :board,
              :columns

  attr_accessor :move

  def initialize(player, board)
    @player = player
    @board = board
    @columns = ["a", "b", "c", "d", "e", "f", "g"]
    @move = nil
  end

  def get_move
    if @player.instance_of?(Player)
      move = validate_player_move(gets.chomp.downcase)
    else
      move = get_computer_move
    end
    @move = move
  end
  
  def validate_player_move(move)
    while !@columns.include?(move) || column_is_full?(move)
      puts "Oops, that's an invalid move, or a full column. Please select column A-G!"
      move = gets.chomp.downcase
    end
    move
  end

  def column_is_full?(move)
    column_index = @columns.index(move)
    @board.board_grid[0][column_index].state != "."
  end
  
  def get_computer_move
    computer_move = @columns.sample
    while validate_cpu_move(computer_move) == "invalid"
      computer_move = @columns.sample
    end
    computer_move
  end

  def validate_cpu_move(move)
    if column_is_full?(move)
      return "invalid"
    else 
      move
    end
  end
  
  def set_cell
    find_lowest_cell_in_column.set_state(@player.piece)
  end
  
  def find_lowest_cell_in_column
    lowest_cell = nil
    @board.board_grid.reverse.each do |row|
      if row[(@columns.index(@move))].state == "."
        lowest_cell = @board.board_grid[@board.board_grid.index(row)][@columns.index(@move)]
        break
      end
    end
    lowest_cell
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
      # require 'pry';binding.pry
      pieces_in_a_row += 1 if current_index > index_2
      current_index += 1
      current_pos = @board.board_grid[index_1][current_index]
      # require 'pry';binding.pry
    end
    @player.winner = true if pieces_in_a_row >= 4
  end

  def check_vertical_win(index_1, index_2)
    current_pos = @board.board_grid[index_1][index_2]
    current_index = 0 + index_1
    pieces_in_a_row = 1
    until current_index < 0 || (current_pos.state != @player.piece)
      pieces_in_a_row += 1 if current_index < index_1
      current_index -= 1
      current_pos = @board.board_grid[current_index][index_2]
    end
    current_pos = board.board_grid[index_1][index_2]
    current_index = 0 + index_1
    until current_index > 5 || (current_pos.state != @player.piece)
      pieces_in_a_row += 1 if current_index > index_1
      current_index += 1
      current_pos = @board.board_grid[current_index][index_2] if current_index < 6
      # require 'pry';binding.pry
    end
    @player.winner = true if pieces_in_a_row >= 4
  end
end