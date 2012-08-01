require_relative '../lib/tic_tac_toe'
require_relative '../lib/input_handler'
require_relative '../lib/output_handler'

class Runner

  def self.runGame
    OutputHandler.welcome_message
    while true
       run_a_new_game
    end
  end

  def self.run_a_new_game
    game = init_and_print
    game.setup_game(InputHandler.receive_goes_first?(gets.chomp))
    a_game_is_going(game)
  end

  def self.init_and_print
    game = TicTacToe.new
    OutputHandler.go_first_message
    return game
  end

  def self.a_game_is_going(game)
    while true
      print_the_board_simple_message_and_prompt_for_move(game)
      break if detect_end_of_game?(game.detect_win)
      game.make_computer_move
      break if detect_end_of_game?(game.detect_win)
    end
  end

  def self.print_the_board_simple_message_and_prompt_for_move(game)
    OutputHandler.print_the_game_board(game)
    OutputHandler.input_move_message
    game.make_player_move(InputHandler.receive_a_move(gets.chomp, game))
  end

  def self.detect_end_of_game? (win_detect_index)
      print OutputHandler.win_message if(win_detect_index == 2)
      print OutputHandler.lose_message if(win_detect_index == 1)
      print OutputHandler.draw_message if(win_detect_index == 0)
      return true if win_detect_index >= 0
  end


end

Runner.runGame



