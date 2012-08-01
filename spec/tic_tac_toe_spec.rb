require 'rspec'
require_relative '../lib/tic_tac_toe'

describe TicTacToe do

  it "should make a new tic tac toe game" do
    game = TicTacToe.new
    game.setup_game(true)
    game.board.first_move?.should == true
    game.setup_game(false)
    game.board.first_move?.should == false
  end

  it "should be able to make a move for the player" do
    game = TicTacToe.new
    game.setup_game(true)
    game.board.first_move?.should == true
    game.make_player_move(2)
    game.board.first_move?.should == false


  end


end