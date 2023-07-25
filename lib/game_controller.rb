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
    while user_input != "1" && "2"
      "Enter 1 for one player and 2 for two players"
      user_input = gets.chomp.downcase
    end
    
    if user_input == "1"
      start_game
    else
      start_game_two_players
    end
  end

  def start_game
    board = Board.new
    player = Player.new
    computer = Computer.new
    puts "Welcome to Connect 4!!!"
    puts "Enter P to start a game, or Q to quit."
    user_input = gets.chomp.downcase
    while user_input != "p" && "q"
      "Please enter P to start a game, or Q to quit."
      user_input = gets.chomp.downcase
    end
    if user_input == "p"
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
      puts "Player wins!"
    elsif computer.winner
      puts "Computer wins!"
    elsif board.board_is_full?
      puts "Draw!"
    end
  end
end