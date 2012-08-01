require_relative '../lib/tic_tac_toe_board'
require_relative '../lib/ai'

class TicTacToe

  attr_accessor :board
  attr_accessor :ai

  def setup_game(player_moves_first)
    @board = Board.new
    @ai = AI.new
    make_computer_move if(!player_moves_first)
  end

  def get_board
    return @board.get_game_board
  end

  def make_player_move(position)
    @board.get_game_board[position] = @ai.get_player_id
  end

  def player_move_is_valid(position)

    return false if(position < 0 || position > 8)
    return false if(@board.get_game_board[position]!=0)
    return true
  end

  def make_computer_move
    @board.get_game_board[@ai.return_best_move(@board)] = @ai.get_computer_id
  end

  def detect_win
    return @ai.get_computer_id if(@board.check_for_win?(@ai.get_computer_id))
    return @ai.get_player_id if(@board.check_for_win?(@ai.get_player_id))
    return -1 if(!(@board.board_is_full?))
    return 0
  end

end
