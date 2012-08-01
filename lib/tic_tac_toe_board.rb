class Board

  attr_accessor :gameBoard

  def initialize
    @gameBoard = [0,0,0,0,0,0,0,0,0]
  end

  def get_game_board
    @gameBoard
  end

  def set_board? (gameBoard)
    return false if(gameBoard.size != 9)
    @gameBoard = gameBoard
    return true
  end

  def board_is_full?
    return !(@gameBoard.include?(0))
  end

  def check_for_win?(player_number)
    return (check_for_horizontal_win?(player_number) || check_for_vertical_win?(player_number) || check_for_diagonal_win?(player_number))
  end

  def check_for_vertical_win?(player_number)
    counter = 0
    while counter<3
      return true if three_vertical_squares_contain_player_index?(player_number, counter)
      counter+=1
    end
    return false
  end

  def three_vertical_squares_contain_player_index?(player_number, counter)
    return @gameBoard[counter] == player_number && @gameBoard[counter+3] == player_number && @gameBoard[counter+6] == player_number
  end

  def check_for_horizontal_win?(player_number)
    counter = 0
    while counter<4
      return true if three_horizontal_squares_contain_player_index?(player_number, counter)
      counter+=1
    end
    return false
  end

  def three_horizontal_squares_contain_player_index?(player_number, i)
    return @gameBoard[i*3] == player_number && @gameBoard[i*3+1] == player_number && @gameBoard[i*3+2] == player_number
  end

  def check_for_diagonal_win?(player_number)
    return true if @gameBoard[0] == player_number && @gameBoard[4] == player_number && @gameBoard[8] == player_number
    return true if @gameBoard[2] == player_number && @gameBoard[4] == player_number && @gameBoard[6] == player_number
    return false
  end

  def first_move?
    @gameBoard.each do |square|
      return false if !(square_is_empty?(square))
    end
    return true
  end

  def square_is_empty? (square)
    return square == 0
  end


end