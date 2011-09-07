class Player
  attr_accessor :count
  attr_accessor :points
  MAX_REPEATS = 3
  def initialize 
    @count = 0
    @points = 0
  end
  
  def calculate_points(value, iteration)
    @previous_value = value if iteration == 0
    if @previous_value == value || value == 1 || value == 5
      @count += 1
      if value == 1
        @points += 100
        @points += 700 if @count == MAX_REPEATS
      end
      @points += 200 if(@count == MAX_REPEATS && value == 2)
      @points += 300 if(@count == MAX_REPEATS && value == 3)
      @points += 400 if(@count == MAX_REPEATS && value == 4)
      if value == 5
        @points += 50
        @points += 350 if @count === MAX_REPEATS
      end 
      @points += 600 if(@count == MAX_REPEATS && value == 6)
    end
    @previous_value = value
  end 
   
end
@player=Player.new
#@player.calculate_points(1,1)
#puts @player.calculate_points(1,2)
 3.times { |i| @player.calculate_points(3,i)}
  puts @player.points