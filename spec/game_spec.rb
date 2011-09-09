require 'game'

describe Game do
  
  it "complets when a player gets 3000 points first " do
    player1 = double('player')
    player2 = mock('player')
    player1.stub(:points).and_return(3500)
    player2.should_receive(:points).and_return(2800)
    @game = Game.new(player1, player2)
    @game.winner.should =~ /Winner is player1/
  end

end