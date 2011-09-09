require 'dice'

class Player
  
  attr_accessor :count
  attr_accessor :points
  attr_accessor :values
  attr_accessor :eligible_flag
  MAX_REPEATS = 3
  ELIGIBLE_SCORE = 300
  
  def initialize 
    @count = 0
    @points = 0
    @eligible_flag = 0
    @values = Hash.new(5)
  end
  
  def calculate_points(value, iteration)
    @values[iteration] = value
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
  
  def got_eligible_score?
    @eligible_flag = 1 if @points >= ELIGIBLE_SCORE
    return true if @eligible_flag == 1
    false
  end

  def has_next_chance?
    count = 0
    @values.each do |k, v| 
       if [2,3,4,6].include?(v)
         count += 1
         if k > 0
           count = 2 if k == 1 && @values[k] == @values[k-1]
           return false if k == 4 && count != MAX_REPEATS
           count = 0 if @values[k] == @values[k-1] && count == MAX_REPEATS
           return false if @values[k] != @values[k-1]  && count == 3   
         end
       end
    end
    true
  end
   
end
@player=Player.new
@player.calculate_points(5,0)
@player.calculate_points(6,1)   
@player.calculate_points(3,2)
@player.calculate_points(3,3)
@player.calculate_points(3,4)  
#puts @player.has_next_chance? 
