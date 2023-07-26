# frozen_string_literal: true

require_relative "connect_four_2307/version"
require_relative "connect_four_2307/game_controller"

module ConnectFour2307
  class Error < StandardError; end
  # Your code goes here...

  def self.start
    GameController.new.start_game
  end
end
