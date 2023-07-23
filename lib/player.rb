class Player 
  attr_reader :piece
  attr_accessor :winner
  
  def initialize
    @piece = "x"
    @winner = false
  end
end