class Board
  attr_accessor :cells
  
  def initialize
    self.reset!
  end 
  
  def display
    3.times do |row|
      if row != 0
        p "\n-----------"
      end
      3.times do |column|
        p "#{@cells[column]} | "
      end
    end
  end 
  
  def position(space)
    @cells[space.to_i - 1]
  end
  
  def update(space, player_obj)
    space1 = position(space)
    space1 = player_obj.token
  end 
  
  def full?
    !@cells.include?(" ")
  end
  
  def taken?(space)
    is_taken = true
    if @cells[space - 1] == " "
      is_taken = false 
    end 
    is_taken 
  end
  
  def turn_count
    @cells.count{|space| space == "X" || space == "O"}
  end 
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
end