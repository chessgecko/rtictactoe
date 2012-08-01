require "rspec"
require_relative '../lib/ai'
require_relative '../lib/tic_tac_toe_board'

describe AI do


  it "should detect a win one move deep for the computer and move there" do
    game_logic = AI.new
    game_board = Board.new
    game_board.set_board?([1,1,0,2,0,0,0,0,0]).should == true
    game_logic.return_best_move(game_board).should == 2

    game_board.set_board?([1,2,0,1,2,0,0,0,0]).should == true
    game_logic.return_best_move(game_board).should == 6

    game_board.set_board?([0,2,1,2,1,0,0,0,0]).should == true
    game_logic.return_best_move(game_board).should == 6


  end

  it "can look one move deep down the tree to block things" do
    game_logic = AI.new
    game_board = Board.new

    game_board.set_board?([2,2,0,1,0,0,0,0,0])
    game_logic.return_best_move(game_board).should == 2

    game_board.set_board?([1,1,2,0,2,0,0,0,0])
    game_logic.return_best_move(game_board).should == 6

    game_board.set_board?([2,0,0,2,1,0,0,0,0])
    game_logic.return_best_move(game_board).should == 6


  end



  it "can look two moves deep and set up forks" do

    game_logic = AI.new
    game_board = Board.new

    game_board.set_board?([1,2,0,0,0,0,0,0,0])
    game_logic.return_best_move(game_board).should == 3

    game_board.set_board?([1,0,0,0,0,0,0,0,2])
    game_logic.return_best_move(game_board).should == 2

    game_board.set_board?([0,0,2,1,2,0,0,1,0])
    game_logic.return_best_move(game_board).should == 6

  end

  it "can perform moves that are high up the tree" do

    game_logic = AI.new
    game_board = Board.new

    game_board.set_board?([0,0,0,0,0,0,0,0,2]).should == true
    game_logic.return_best_move(game_board).should == 4

    game_board.set_board?([0,0,0,0,0,0,0,0,0]).should == true
    game_logic.return_best_move(game_board).should == 0

  end

  it "should make sure all the little methods still work" do

    game_logic = AI.new

    game_logic.computers_turn_to_move?(1).should == false
    game_logic.computers_turn_to_move?(0).should == true

    game_logic.square_is_empty?(1).should == false
    game_logic.square_is_empty?(0).should == true


  end
end