class Turn
  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end
end