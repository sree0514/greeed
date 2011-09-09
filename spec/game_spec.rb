require 'game'

describe Game do
  
  it "complets when a player gets 3000 points first " do
    player1 = double('player1')
    player2 = mock('player2')
    player1.stub(:points).and_return(0, 500, 1000, 1000)
    player1.stub(:turn).at_most(:twice)
    player2.stub(:turn)
    player1.should_receive(:has_next_chance?).any_number_of_times.and_return(true)
    player2.should_receive(:has_next_chance?).any_number_of_times.and_return(true)
    player2.stub(:points).and_return(0, 700, 700, 3500, 3500)
    @game = Game.new(player1, player2)
    @game.winner.should =~ /Winner is player2/
  end

end