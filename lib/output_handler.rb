require_relative '../lib/tic_tac_toe'

class OutputHandler

  def self.welcome_message
    str = "Welcome to unbeatable tic-tac-toe\n"
    print str
    return str
  end

  def self.go_first_message
    str= "Would you like to go first? (y/n): \n"
    print str
    return str
  end

  def self.input_move_message
    str =  "please input the valid square you would like to move\n to. (must be visible on the board): \n"
    print str
    return str
  end

  def self.invalid_move_first_choice
    str = "please input a y or a n to indicate whether or not you would like to move first: \n"
    print str
    return str
  end

  def self.invalid_move_choice
    str =  "please input a number that you see on the grid"
    print str
    return str
  end

  def self.print_the_game_board(game)
    board, i = game.get_board(), 0
    while i<3
      print "#{board[i*3]} #{board[i*3+1]} #{board[i*3+2]} \n"
      i+=1
    end
  end

  def self.win_message
    str = "you win!!!!!!!!!, this is impossible and unreachable\n"
    print str
    return str
  end

  def self.lose_message
    str = "you lose, too easy\n"
    print str
    return str
  end

  def self.draw_message
    str = "meh... a draw\n"
    print str
    return str
  end

end