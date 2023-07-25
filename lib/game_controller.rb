require_relative 'board'
require_relative 'turn'
require_relative 'player'
require_relative 'computer'
require_relative 'player_two'

class GameController
  def choose_game_type
    puts "Welcome to Connect 4!!!"
    puts "Enter 1 for one player and 2 for two players"
    user_input = gets.chomp.downcase
    while user_input != "1" && user_input != "2"
      "Enter 1 for one player and 2 for two players"
      user_input = gets.chomp.downcase
    end
    
    if user_input == "1"
      start_game_one_player
    else
      start_game_two_players
    end
  end

  def start_game_one_player
    board = Board.new
    player = Player.new
    computer = Computer.new
    # puts "Welcome to Connect 4!!!"
    puts "Enter Player 1 name"
    player_one_name = gets.chomp
    player.get_player_name(player_one_name)
    puts 
    puts "Enter P to start a game, or Q to quit."
    user_input = gets.chomp.downcase
    while user_input != "p" && user_input != "q"
      "Please enter P to start a game, or Q to quit."
      user_input = gets.chomp.downcase
    end
    if user_input == "p"
      puts
      board.render_board
    else
      exit()
    end
    turn_counter = 1
    while !board.board_is_full? && !player.winner && !computer.winner
      if turn_counter % 2 == 0
        turn = Turn.new(computer, board)
        turn.get_move
        turn.set_cell
        turn.check_win_conditions
      else
        turn = Turn.new(player, board)
        turn.get_move
        turn.set_cell
        turn.check_win_conditions
      end
      board.render_board
      turn_counter += 1
    end
    if player.winner
      puts "#{player.name} wins!"
    elsif computer.winner
      puts "Computer wins!"
    elsif board.board_is_full?
      puts "Draw!"
    end
  end


  def start_game_two_players
    board = Board.new
    player_1 = Player.new
    player_2 = PlayerTwo.new
    # puts "Welcome to Connect 4!!!"
    puts "Enter Player 1 name"
    player_one_name = gets.chomp
    player_1.get_player_name(player_one_name)
    puts 
    puts "Enter Player 2 name"
    player_two_name = gets.chomp
    player_2.get_player_name(player_two_name)
    puts 
    puts "Enter P to start a game, or Q to quit."
    user_input = gets.chomp.downcase
    while user_input != "p" && user_input != "q"
      puts
      "Please enter P to start a game, or Q to quit."
      user_input = gets.chomp.downcase
    end
    if user_input == "p"
      puts
      puts "#{player_1.name} goes first!"
      board.render_board
    else
      exit()
    end
    turn_counter = 1
    while !board.board_is_full? && !player_1.winner && !player_2.winner
      if turn_counter % 2 == 0
        turn = Turn.new(player_2, board)
        turn.get_move
        turn.set_cell
        turn.check_win_conditions
        board.render_board
        turn_counter += 1
      else
        turn = Turn.new(player_1, board)
        turn.get_move
        turn.set_cell
        turn.check_win_conditions
        board.render_board
        turn_counter += 1
      end
    end
    if player_1.winner
      puts "#{player_1.name} wins!"
    elsif player_2.winner
      puts "#{player_2.name} wins!"
    elsif board.board_is_full?
      puts "Draw!"
    end
  end
end 