require './rover'
require './grid'

# Unit Test that does the Example Test case step by step to 
# Ensure it works. See application_spec for an automated solution
describe "Simple" do

	it "Should do the example given; simple step by step with degree" do
		grid = Grid.new(5,5)

		rover1 = Rover.new(1,2,0, grid) 
		rover1.move("L")
		rover1.move("M")
		rover1.move("L")
		rover1.move("M")
		rover1.move("L")
		rover1.move("M")
		rover1.move("L")
		rover1.move("M")
		rover1.move("M")

		rover2 = Rover.new(3,3,90, grid) 
		rover2.move("M")
		rover2.move("M")
		rover2.move("R")
		rover2.move("M")
		rover2.move("M")
		rover2.move("R")
		rover2.move("M")
		rover2.move("R")
		rover2.move("R")
		rover2.move("M")

		rover1.location[:x].should == 1
		rover1.location[:y].should == 3
		rover1.location[:d].should == 0 # 0 = North

		rover2.location[:x].should == 5
		rover2.location[:y].should == 1
		rover2.location[:d].should == 90 # 90 = East

	end

end