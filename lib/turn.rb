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
      puts "Place a piece in column A-G"
      move = validate_player_move(gets.chomp.downcase)
    elsif @player.instance_of(PlayerTwo)
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
    index_array = find_lowest_cell_in_column
    @board.board_grid[index_array[0]][index_array[1]].set_state(@player.piece)
  end
  
  def find_lowest_cell_in_column
    index_1 = nil
    index_2 = nil
    @board.board_grid.reverse.each do |row|
      if row[(@columns.index(@move))].state == "."
        index_1 = @board.board_grid.index(row)
        index_2 = @columns.index(@move)
        break
      end
    end
    [index_1, index_2]
  end

  def check_win_conditions
    check_horizontal_win
    check_vertical_win
    check_diagonal_win
  end

  def get_board_as_states
    @board.board_grid.map do |row|
      row.map do |cell|
        cell.state
      end
    end
  end
  
  def check_horizontal_win
    winning_string = ""
    4.times { winning_string += "#{@player.piece}" }
    board_as_states = get_board_as_states
    board_as_states.each do |row|
      @player.winner = true if row.join.include?(winning_string)
    end
  end

  def check_vertical_win
    winning_string = ""
    4.times { winning_string += "#{@player.piece}" }
    board_as_states = get_board_as_states
    column_as_array = board_as_states.map { |row| row[@columns.index(@move)] }
    @player.winner = true if column_as_array.join.include?(winning_string)
  end

  #range is acting as way to create index positions to check index positions on our board
  def diag_offset_columns(board, range)
    range.map do |outer_int|
      (outer_int..(board[0].size - 1)).collect {|inner_int| board[inner_int - outer_int][inner_int]}
    end
  end

  def diag_offset_rows(board, range)
    range.map do |outer_int|
      (outer_int..(board.size - 1)).collect {|inner_int| board[inner_int][inner_int - outer_int]}
    end
  end

  def check_diagonal_win
    winning_string = ""
    4.times { winning_string += "#{@player.piece}" }
    board_states = get_board_as_states
    board_rotated = board_states.transpose.reverse
    diag_offset_columns(board_states, (1..3)).each do |array|
      @player.winner = true if array.join.include?(winning_string)
    end
    diag_offset_rows(board_states, (0..2)).each do |array|
      @player.winner = true if array.join.include?(winning_string)
    end
    diag_offset_columns(board_rotated, (0..2)).each do |array|
      @player.winner = true if array.join.include?(winning_string)
    end
    diag_offset_rows(board_rotated, (1..3)).each do |array|
      @player.winner = true if array.join.include?(winning_string)
    end
  end
end