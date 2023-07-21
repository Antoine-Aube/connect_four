require 'spec_helper'

RSpec.describe Turn do
  describe "#initialize" do
    it "exists" do
      turn = Turn.new("player")

      expect(turn).to be_a Turn
    end
  end
end