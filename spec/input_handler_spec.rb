require "rspec"
require_relative '../lib/input_handler'
require_relative '../lib/tic_tac_toe'

describe InputHandler do

  it "knows if you want to go first" do

    InputHandler.receive_goes_first?("yes").should == true
    InputHandler.receive_goes_first?("n").should == false

  end

  it "knows where you want to move" do
      game = TicTacToe.new
      game.setup_game(false)
      InputHandler.receive_a_move("1",game).should == 1
  end

end