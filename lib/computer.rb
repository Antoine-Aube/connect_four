class Computer
  attr_reader :piece
  attr_accessor :winner
  
  def initialize
    @piece = "o"
    @winner = false
  end
end