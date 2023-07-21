require 'spec_helper'

RSpec.describe Turn do
  describe "#initialize" do
    it "exists" do
      turn = Turn.new("player")

      expect(turn).to be_a Turn
    end

    it "has a player" do
      player = "Waiting for Player"
      turn = Turn.new(player)

      expect(turn.player).to eq(player)
    end
  end
end