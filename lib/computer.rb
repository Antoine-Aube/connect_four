class Computer
  attr_reader :piece
  attr_accessor :winner
  
  def initialize
    @piece = "O"
    @winner = false
  end
end