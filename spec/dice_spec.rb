require 'dice'
describe Dice, "role" do
  it "retuns a value between 1 to 5" do
    (1..5) === Dice.new.role.should
  end  
end