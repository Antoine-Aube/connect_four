class Cell 
  attr_reader :state

  def initialize
    @state = "."
  end

  def set_state(player_piece)
    @state = player_piece
  end
end