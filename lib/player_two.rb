class PlayerTwo  
    attr_reader :piece, :name
    attr_accessor :winner
    
    def initialize
      @piece = "@"
      @winner = false
      @name = name
    end 

    def get_player_name(name)
      @name = name
    end
end