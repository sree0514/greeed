class Player
  attr_accessor :count
  attr_accessor :points
  attr_accessor :values
  MAX_REPEATS = 3
  
  def initialize 
    @count = 0
    @points = 0
    @values = Array.new(5)
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
  
  def has_next_chance?
    previous_value = 0
    count=1
    @values.each do |index, value| 
       if [2,3,4,6].include?(value)
         if @values[index] == @values[index+1] 
           count += 1
         else
           return false if count != MAX_REPEATS 
         end   
       end
    end
    true
  end
   
end
@player=Player.new
5.times { |i| @player.calculate_points(6,i) }
#puts @player.values[4] 
