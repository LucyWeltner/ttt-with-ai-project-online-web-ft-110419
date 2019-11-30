class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(board = Board.new, player1 = Players::Human.new("X"), player2 = Players::Human.new("O"))
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
    winning_states = self.win_conditions
    winning_states.each do |state|
      win = false
      if @board[state][0] == @board[state][1] && @board[state][1] == @board[state][2]
        win = true
      end
    end 
    win 
  end
end