require_relative 'board'

class GameController
  def start_game
    board = Board.new
    puts "Welcome to Connect 4!!!"
    puts "Enter P to start a game, or Q to quit."
    user_input = gets.chomp
    while user_input != "p" && "q"
      "Please enter P to start a game, or Q to quit."
      user_input = gets.chomp
    end
    if user_input == "p"
      board.render_board
    else
      exit()
    end
  end
end