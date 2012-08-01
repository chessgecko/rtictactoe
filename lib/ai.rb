class AI

  COMPUTER_ID = 1
  PLAYER_ID = 2

  def return_best_move(board)
    return 0 if board.first_move?
    return main_recursive_function(0, board)
  end

  def main_recursive_function (depth, board)
    return 0 if board.board_is_full?
    return setup_computer_move(depth, board) if computers_turn_to_move?(depth)
    return -1 if find_immediate_win(2, board) != nil
    return players_recursive_choice(depth, board)
  end

  #UNTESTED
  def setup_computer_move(depth, board)
    dont_want_to_call_this_twice = find_immediate_win(1, board)
    return 1 if dont_want_to_call_this_twice != nil && depth != 0
    return dont_want_to_call_this_twice if dont_want_to_call_this_twice != nil && depth == 0
    return computers_recursive_choice(depth, board)
  end

  def players_recursive_choice(depth, board)
    counter, average, num_of_empty_squares = 0, 0,0
    board.get_game_board.each do |square|
      if !(square_is_empty?(square))
        counter+=1
      else
        temp = set_up_recurse_clean_up(depth, board, PLAYER_ID, counter)
        return -1 if temp == -1
        counter, num_of_empty_squares, average = counter+1, num_of_empty_squares+1, average + temp
      end
    end
    return average/num_of_empty_squares
end

  def computers_recursive_choice(depth, board)
    counter, highest_location, highest = 0, -9, -2
    board.get_game_board.each do |square|
      if !(square_is_empty?(square))
        counter +=1
      else
        temp = set_up_recurse_clean_up(depth, board, COMPUTER_ID, counter)
        highest_location, highest = counter, temp if temp > highest
        counter+=1
      end
    end
    depth == 0? highest_location : highest
  end

  def set_up_recurse_clean_up(depth, board, player_id, counter)
    board.get_game_board[counter] = player_id
    temp = main_recursive_function(depth+1, board)
    board.get_game_board[counter] = 0
    return temp
  end

  def computers_turn_to_move?(depth)
    return depth%2 == 0
  end

  def square_is_empty?(square)
    return square == 0
  end

  def find_immediate_win (player_id, board)
    counter = 0
    board.get_game_board.each do |square|
      return counter if square_is_empty?(square) && won_immediate?(counter, player_id, board)
      counter+=1
    end
    nil
  end

  def won_immediate?(counter, player_id, board)
    board.get_game_board[counter] = player_id
    temporary_bool = board.check_for_win?(player_id)
    board.get_game_board[counter] = 0
    return temporary_bool
  end

  def get_computer_id
    COMPUTER_ID
  end

  def get_player_id
    PLAYER_ID
  end

end