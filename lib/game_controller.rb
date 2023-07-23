require_relative 'board'
require_relative 'turn'
require_relative 'player'
require_relative 'computer'

class GameController
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
    # currently player 1 just goes forever - we can do something like make the computer a player 2
    # that just has random inputs, or make an entirely separate computer class, etc
    # I'm game for whatever seems more fun!
    # funny enough we could actually make this work with a second player if we just
    # made their piece an O or something :)

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