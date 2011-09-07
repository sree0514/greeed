require 'player'
describe Player do
  before(:each) do
    @player = Player.new
  end
  it "gets 1000 points if he throw 3 consecutive '1's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 1000
  end
  it "gets 200 points if he throw 3 consecutive '2's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 200
  end
  it "gets 300 points if he throw 3 consecutive '3's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 300
  end
  it "gets 400 points if he throw 3 consecutive '4's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 400
  end
  it "gets 500 points if he throw 3 consecutive '5's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 500
  end
  it "gets 600 points if he throw 3 consecutive '6's" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 600
  end
  it "gets 100 points if he throw one '1'" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 100
  end
  it "gets 50 points if he throw one '5'" do
    3.times { |i| @player.calculate_points(1,i) }
    @player.points == 1000
  end
end