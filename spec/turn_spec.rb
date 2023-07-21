require 'spec_helper'

RSpec.describe Turn do
  describe "#initialize" do
    it "exists" do
      turn = Turn.new("player", "Board")

      expect(turn).to be_a Turn
    end

    it "has a player" do
      player = "Waiting for Player"
      turn = Turn.new(player, "Board")

      expect(turn.player).to eq(player)
    end

    it "has a board" do
      player = "Waiting for Player"
      board = Board.new
      turn = Turn.new(player, board)

      expect(turn.board).to eq(board)
    end
  end
end