require "rspec"
require_relative '../lib/tic_tac_toe_board'

describe Board do


  it "can set the game board" do

    game = Board.new
    game.set_board?([0,0,0,0,0,0,0,0,0]).should == true
  end

  it "returns 0 when the entire board is full" do
    game = Board.new
    game.set_board?([1,1,2,2,2,1,1,2,1]).should == true #this is an actual drawn position
    game.board_is_full?().should == true
  end

  it "can checks if the game is won for a player vertically" do

    game = Board.new
    game.set_board?([1,2,2,1,0,0,1,0,0]).should == true
    game.check_for_win?(1).should == true
    game.check_for_win?(2).should == false

    game.set_board?([1,2,1,1,2,1,1,2,1]).should == true
    game.check_for_win?(1).should == true
    game.check_for_win?(2).should == true

    game.set_board?([1,1,2,2,2,1,1,2,1]).should == true #this is an actual drawn position
    game.check_for_win?(1).should == false
    game.check_for_win?(2).should == false
  end

  it "can checks if the game is won for a player horizontally" do
    game = Board.new
    game.set_board?([2,2,2,1,0,0,1,0,0]).should == true
    game.check_for_win?(2).should == true
    game.check_for_win?(1).should == false

    game = Board.new
    game.set_board?([2,2,0,1,1,1,2,2,2]).should == true
    game.check_for_win?(2).should == true
    game.check_for_win?(1).should == true

  end

  it "can check for diagonal victories" do
    game = Board.new
    game.set_board?([1,2,2,2,1,0,0,0,1]).should == true
    game.check_for_win?(1).should == true
  end

  it "should make sure all the little methods work" do
    game_board = Board.new

    game_board.set_board?([0,0,0,0,0,0,0,0,0]).should == true
    game_board.first_move?.should == true
    game_board.set_board?([1,0,0,0,0,0,0,0,0]).should == true
    game_board.first_move?.should == false

    game_board.board_is_full?.should == false
    game_board.set_board?([1,1,2,2,2,1,1,2,1]).should == true #this is an actual drawn position
    game_board.board_is_full?.should == true

    game_board.set_board?([1,1,2,2,2,1,1,2,1]).should == true #this is an actual drawn position
    game_board.first_move?.should == false
    game_board.set_board?([0,0,0,0,0,0,0,0,0]).should == true #this is an actual drawn position
    game_board.first_move?.should == true


  end

end