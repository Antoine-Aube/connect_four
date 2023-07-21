class Turn
  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def set_cell(index_1, index_2)
    @board.board_grid[index_1][index_2].set_state(@player.piece)
  end
end