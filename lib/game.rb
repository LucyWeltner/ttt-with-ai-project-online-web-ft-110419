class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2 
  end 
  
  def win_conditions
    winning_moves = []
    3.times do |i|
      row = [i*3,i*3+1,i*3+2]
      winning_moves << row
    end
    3.times do |i|
      column = [i, i+3, i+6]
      winning_moves << column
    end
    winning_moves << [0, 4, 8]
    winning_moves << [2, 4, 6]
    winning_moves 
  end
  
  def current_player
    if @board.turn_count%2 == 0 
      return @player_1
    else 
      return @player_2 
    end 
  end
  
  def won?
    winning_states = win_conditions
    win = false
    winning_states.each do |state|
      if @board.cells[state[0]] == @board.cells[state[1]] && @board.cells[state[1]] == @board.cells[state[2]] && @board.cells[state[0]] != " "
        return state
      end
    end 
    win 
  end
  
  def draw?
    draw = false
    if !won? && @board.full?
      draw = true 
    end 
  end
  
  def over?
    over = false
    if draw? || won?
      over = true 
    end 
    over 
  end 
  
  def winner 
    if won?
      state = won?
      return @board.cells[state[0]]
    else 
      return nil 
    end
  end
  
  def turn 
    space = current_player.move(@board)
    @board.update(space, current_player)
  end
  
  def play 
    while !over?
      turn 
    end
    if winner != nil
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end
end