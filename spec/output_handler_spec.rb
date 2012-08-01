require "rspec"
require_relative '../lib/output_handler'


describe OutputHandler do

  it "make sure the output strings remain unchanged" do
    OutputHandler.welcome_message.should == "Welcome to unbeatable tic-tac-toe\n"
    OutputHandler.go_first_message.should == "Would you like to go first? (y/n): \n"
    OutputHandler.input_move_message.should == "please input the valid square you would like to move\n to. (must be visible on the board): \n"
    OutputHandler.invalid_move_first_choice.should == "please input a y or a n to indicate whether or not you would like to move first: \n"
    OutputHandler.invalid_move_choice.should == "please input a number that you see on the grid"
    OutputHandler.win_message.should == "you win!!!!!!!!!, this is impossible and unreachable\n"
    OutputHandler.lose_message.should == "you lose, too easy\n"
    OutputHandler.draw_message.should == "meh... a draw\n"


  end
end