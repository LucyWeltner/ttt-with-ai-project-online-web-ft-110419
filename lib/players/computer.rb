module Players 
  class Computer < Player 
    def move(board)
      spots = []
      board.cells.each_with_index do |spot, index|
        if spot == " "
          spots << index.to_s
        end 
      end
      spots.sample
    end
  end 
end 
      