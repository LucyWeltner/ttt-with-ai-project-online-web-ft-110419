require "pry"
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
    puts "\nThis is the current board state\n"
    @board.display
  end
  
  def play 
    while !over?
      turn 
    end
    if winner != nil
      puts "\n"
      puts "Congratulations #{winner}!"
    else 
      puts "\n"
      puts "Cat's Game!"
    end
    puts "Would you like to play again? Press y for yes or n for no"
    input = gets.chomp! 
    if input == "y" || input == "Y"
      start 
    end
  end
  
  def start 
    puts "Hello, welcome to Tic Tac Toe!"
    puts "What type of game do you want to play? Type 0 for 0 player (all virtual), 1 for 1 for one player, and 2 for two player."
    type_of_game = gets.chomp!
    until type_of_game == "1" || type_of_game == "0" || type_of_game == "2"
      puts "Please type 0, 1 or 2"
      type_of_game = gets.chomp!
    end 
    if type_of_game == "0" 
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new) 
      new_game.play
    else
      puts "Would you like to go first? Press Y for yes or N for no."
      first = gets.chomp!
      until first == "Y" || first == "y" || first == "N" || first == "n"
        puts "Please enter Y if you would like to go first or N if you would like to go second."
        first = gets.chomp!
      end 
      if type_of_game == "1"
        if first == "Y" || first == "y" 
          new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          new_game.play
        else 
          new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          new_game.play
        end
      end
      if type_of_game == "2"
        if first == "Y" || first == "y" 
          new_game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
          new_game.play
        else 
          new_game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
          new_game.play
        end
      end 
    end
  end
end