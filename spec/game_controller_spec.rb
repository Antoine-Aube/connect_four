require 'spec_helper'

RSpec.describe GameController do
  describe "#initialize" do
    it "exists" do
      gc = GameController.new

      expect(gc).to be_a GameController
    end
  end
end