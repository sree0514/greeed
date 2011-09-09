require 'player'

describe Player do
  
  before(:each) do
    @player = Player.new
  end
   
  it "gets 1000 points if he throw 3 consecutive '1's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points.should == 1000
  end
  
  it "gets 200 points if he throw 3 consecutive '2's" do
    3.times { |i| @player.calculate_points(2,i) }
    @player.points.should == 200
  end
  
  it "gets 300 points if he throw 3 consecutive '3's" do
    3.times { |i| @player.calculate_points(3,i) }
    @player.points.should == 300
  end
  
  it "gets 400 points if he throw 3 consecutive '4's" do
    3.times { |i| @player.calculate_points(4,i) }
    @player.points.should == 400
  end
  
  it "gets 500 points if he throw 3 consecutive '5's" do
    3.times { |i| @player.calculate_points(5,i) }
    @player.points.should == 500
  end
  
  it "gets 600 points if he throw 3 consecutive '6's" do
    3.times { |i| @player.calculate_points(6,i) }
    @player.points.should == 600
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
    3.times { |i| @player.calculate_points(6,i) }
    @player.got_eligible_score?.should be_true
  end
  it "gets second chance again if he gets score for five rolls" do
    @player.calculate_points(1,0)
    @player.calculate_points(3,1)   
    @player.calculate_points(3,2)
    @player.calculate_points(3,3)
    @player.calculate_points(5,4)  
    @player.has_next_chance?.should be_true
  end
  
end










