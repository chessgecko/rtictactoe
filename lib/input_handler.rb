require_relative '../lib/output_handler'
require_relative '../lib/tic_tac_toe'

class InputHandler

  def self.receive_goes_first?(unparsed_position)
    return true if unparsed_position.scan(/y/).size > 0
    return false if unparsed_position.scan(/n/).size > 0
    OutputHandler.invalid_move_first_choice
    return receive_goes_first?(gets.chomp)
  end

  def self.receive_a_move(unparsed_move, game)
    return unparsed_move.scan(/\d/)[0].to_s.to_i if there_a_number?(unparsed_move, game)
    OutputHandler.invalid_move_choice
    return receive_a_move(gets.chomp, game)
  end

  def self.there_a_number?(unparsed_move, game)
    return unparsed_move.scan(/\d/).size > 0 && game.player_move_is_valid(unparsed_move.scan(/\d/)[0].to_s.to_i)
  end



end