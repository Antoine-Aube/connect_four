require_relative 'cell'

class Board
  attr_reader :board_grid

  def initialize
    @board_grid = generate_board
  end

  def generate_board
    board = {
      row_1: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new},
      row_2: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new},
      row_3: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new},
      row_4: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new},
      row_5: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new},
      row_6: {a: Cell.new, b: Cell.new, c: Cell.new, d: Cell.new, e: Cell.new, f: Cell.new, g: Cell.new}
    }
  end

  
  def render_board
    puts "ABCDEFG"
    
    @board_grid.each_value do |row|
      row.each_value do |cell|
        print "."
      end
      puts "\n"
    end
  end
end