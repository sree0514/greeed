require 'dice'

describe Dice, "roll" do
  
  it "retuns a value between 1 to 5" do
    (1..5) === Dice.roll.should
  end  
  
end