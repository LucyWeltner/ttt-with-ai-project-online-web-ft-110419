module Players
  class Human < Player
    def move(board)
      puts "Each space on the board is labeled 1-9. Pick a number between 1 and 9 to indicate where you'd like to move."
      input = gets
    end 
  end
end
    