require_relative 'cell'

class Board
  attr_reader :board_grid

  def initialize
    @board_grid = generate_board
  end

  def generate_board
    board = [
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new]
  ]
  end

  
  def render_board
    puts "ABCDEFG"
    
    @board_grid.each do |row|
      row.each do |cell|
        print "."
      end
      puts "\n"
    end
  end
end