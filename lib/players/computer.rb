require "pry"
module Players 
  class Computer < Player 
    def move(board)
      spots = []
      board.cells.each_with_index do |spot, index|
        if spot == " "
          spots << (index + 1).to_s
        end 
      end
      p spots
      spots.sample
      # rand(1..9).to_s
    end
  end 
end 
      