class PlayerTwo  
    attr_reader :piece
    attr_accessor :winner
    
    def initialize
      @piece = "@"
      @winner = false
    end 
end