require 'player'

describe Player do
  
  before(:each) do
    @player = Player.new
  end
   
  it "gets 1000 points if he throw 3 consecutive '1's" do
    Dice.should_receive(:roll).and_return(2, 1, 1, 1, 3)
    @player.throw_dice.should == 1000
  end
  
  it "gets 200 points if he throw 3 consecutive '2's" do
    Dice.should_receive(:roll).and_return(1, 1, 2, 2, 2)
    @player.throw_dice.should  == 400
  end
  
  it "gets 300 points if he throw 3 consecutive '3's" do
    Dice.should_receive(:roll).and_return(3, 3, 3, 4, 4)
    @player.throw_dice.should === 300
  end
  
  it "gets 400 points if he throw 3 consecutive '4's" do
    Dice.should_receive(:roll).and_return(2, 4, 4, 4, 4)
    @player.throw_dice.should == 400
  end
  
  it "gets 500 points if he throw 3 consecutive '5's" do
    Dice.should_receive(:roll).and_return(2, 3, 5, 5, 5)
    @player.throw_dice.should == 500
  end
  
  it "gets 600 points if he throw 3 consecutive '6's" do
    Dice.should_receive(:roll).and_return(6, 6, 6, 6, 6)
    @player.throw_dice.should == 600
  end
  
  it "gets 100 points if he throw one '1'" do
    @player.calculate_points(1,3)
    @player.points.should == 100
  end

  it "gets 50 points if he throw one '5'" do
    @player.calculate_points(5,5)
    @player.points.should == 50
  end
  
  it "gets eligible to count his score, if he get 300 score" do
    Dice.should_receive(:roll).and_return(2, 3, 5, 5, 5)
    @player.throw_dice.should == 500
    @player.has_got_eligible_score?.should be_true
  end
  
  it "gets second chance again if he gets score for five rolls" do
    Dice.should_receive(:roll).and_return(5, 3, 3, 3, 1)
    @player.throw_dice.should == 450  
    @player.has_next_chance?.should be_true
  end
  
  it "loose the accumulated score if he gets Zero points in roll" do
    Dice.should_receive(:roll).and_return(2, 4, 4, 4, 6)
    @player.turn
    @player.turn_points.should == 400  
  end
  
end



