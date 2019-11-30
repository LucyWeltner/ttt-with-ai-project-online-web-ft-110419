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
        print " #{@cells[column]} |"
      end
    end
  end 
  
  def position(space)
    @cells[space.to_i - 1]
  end
  
  def update(space, player_obj)
    position(space) = player_obj.token
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
    index = self.position(space)
    if !self.taken?(index) && index
      valid_move = true 
    end 
    valid_move
  end
  
  def update(space, player)
    if valid_move?(space)
      update(space, player)
    end 
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
end