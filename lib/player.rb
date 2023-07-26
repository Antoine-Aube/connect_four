
class Player 
  attr_reader :piece, :name
  attr_accessor :winner
  
  def initialize(piece)
    @piece = piece
    @winner = false
    @name = nil
  end

  def get_player_name(name)
    @name = name
  end
end