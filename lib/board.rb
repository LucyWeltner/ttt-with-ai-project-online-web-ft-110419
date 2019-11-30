class Board
  attr_accessor :cells
  
  def initialize
    self.reset!
  end 
  
  def display
    3.times do |row|
      if row != 0
        puts "\n-----------"
      end
      3.times do |column|
        print " #{@cells[column+row*3]} |"
      end
    end
  end 
  
  def position(space)
    @cells[space.to_i - 1]
  end
  
  def update(space, player_obj)
    if valid_move?(space)
      @cells[space.to_i - 1] = player_obj.token
    end
  end 
  
  def full?
    !@cells.include?(" ")
  end
  
  def taken?(space)
    is_taken = true
    if self.position(space) == " "
      is_taken = false 
    end 
    is_taken 
  end
  
  def turn_count
    @cells.count{|space| space == "X" || space == "O"}
  end 
  
  def valid_move?(space)
    valid_move = false 
    if !self.taken?(space) && space.to_i < 10 && space.to_i > 0
      valid_move = true 
    end 
    valid_move
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
end