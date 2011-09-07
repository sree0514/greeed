class Player
  attr_accessor :count
  attr_accessor :points
  def initialize 
    @count = 0
    @points = 0
  end
  def calculate_points(value, iteration)
    @previous_value = value if iteration == 0
    if @previous_value == value || iteratin == 0 || value == 1 || value == 5
      @count += 1
      case value
        when 1
          @points += 100
          @points += 700 if @count == 3
        when 2
          @points += 200 if @count == 3
        when 3
          @points += 300 if @count == 3
        when 4
          @points += 400 if @count == 3
        when 5
          @points += 50
          @points += 350 if @count == 3
        when 6 
          @points += 600 if @count == 3
        end 
     end
    end
end