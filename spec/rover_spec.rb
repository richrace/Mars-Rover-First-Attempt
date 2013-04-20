require './grid.rb'
require './rover.rb'

# Unit tests the for the Rover class.
describe Rover do
	describe "#initialize" do 

		it "should initialize with x,y,d and Grid params" do
			# Need to create a Grid first!
			grid = Grid.new(10,10)
			rover = Rover.new(1, 2, 90, grid)
			rover.location[:x].should == 1
			rover.location[:y].should == 2
			rover.location[:d].should == 90
		end
	end

	describe "#validate" do
		it "should raise exception as x and y are out of range" do
			rover = Rover.new(5,5, 90, Grid.new(4,4))
			lambda { rover.validate }.should raise_error(RangeError)
		end

		it "shouldn't raise an exception for direction being 360 or under" do
			rover = Rover.new(5,5,270, Grid.new(10,10))
			lambda { rover.validate }.should_not raise_error(RangeError)
			rover = Rover.new(5,5,360, Grid.new(10,10))
			lambda { rover.validate }.should_not raise_error(RangeError)
		end

		it "should raise an exception for direction being 450 (over 360)" do
			rover = Rover.new(5,5,450, Grid.new(10,10))
			lambda { rover.validate }.should raise_error(RangeError)
		end

		it "should raise an exception for direction not being a multiple of 90" do
			rover = Rover.new(5,5,100, Grid.new(10,10))
			lambda { rover.validate }.should raise_error(RangeError)
		end

		it "should set direction to 0 if it is 360 (reset to north)" do
			rover = Rover.new(5,5,360, Grid.new(10,10))
			rover.validate
			rover.location[:d].should == 0
		end

		it "should set direction to 270 if it is set as -90" do
			rover = Rover.new(5,5,-90, Grid.new(10,10))
			rover.validate
			rover.location[:d].should == 270
		end
	end

	describe "#move" do
		it "moves forward from starting point (0,0) should finish at (0,1); direction N" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,0, grid)
			rover.move("M")
			rover.location[:x].should == 0
			rover.location[:y].should == 1
		end

		it "moves forward from starting point (0,0) should finish at (1,0); direction E" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,90, grid)
			rover.move("M")
			rover.location[:x].should == 1
			rover.location[:y].should == 0
		end

		it "moves forward from starting point (0,1) should finish at (0,0); direction S" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,1,180, grid)
			rover.move("M")
			rover.location[:x].should == 0
			rover.location[:y].should == 0
		end

		it "moves forward from starting point (1,0) should finish at (0,0); direction W" do
			grid = Grid.new(5,5)
			rover = Rover.new(1,0,270, grid)
			rover.move("M")
			rover.location[:x].should == 0
			rover.location[:y].should == 0
		end

		it "should rotate clockwise to face East; starting direction 0 = N" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,0, grid)
			rover.move("R")
			rover.location[:d].should == 90
		end

		it "should rotate clockwise to face South; starting direction 90 = West" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,90, grid)
			rover.move("R")
			rover.location[:d].should == 180
		end

		it "should rotate clockwise to face West; starting direction 180 = S" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,180, grid)
			rover.move("R")
			rover.location[:d].should == 270
		end

		it "should rotate clockwise to face North; starting direction 270 = W" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,270, grid)
			rover.move("R")
			# Should be 0 not 360 as the validation method should tidy this up for us!
			rover.location[:d].should == 0
		end

		it "should rotate anti-clockwise to face West; starting direction 0 = N" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,0, grid)
			rover.move("L")
			# Our validation method should tidy this up so we don't get -90!
			rover.location[:d].should == 270
		end

		it "should rotate anti-clockwise to face South; starting direction 270 = W" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,270, grid)
			rover.move("L")
			rover.location[:d].should == 180
		end

		it "should rotate anti-clockwise to face East; starting direction 180 = S" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,180, grid)
			rover.move("L")
			rover.location[:d].should == 90
		end

		it "should rotate anti-clockwise to face North; starting direction 90 = E" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,90, grid)
			rover.move("L")
			rover.location[:d].should == 0
		end

		it "should fail when moving forward from starting point (0,0) direction West" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,270, grid)
			lambda { rover.move("M") }.should raise_error
		end

		it "should fail when moving forward from starting point (0,0) direction South" do
			grid = Grid.new(5,5)
			rover = Rover.new(0,0,180, grid)
			lambda { rover.move("M") }.should raise_error
		end

		it "should fail when moving forward from starting point (5,5) direction North" do
			grid = Grid.new(5,5)
			rover = Rover.new(5,5,0, grid)
			lambda { rover.move("M") }.should raise_error
		end

		it "should fail when moving forward from starting point (5,5) direction East" do
			grid = Grid.new(5,5)
			rover = Rover.new(5,5,90, grid)
			lambda { rover.move("M") }.should raise_error
		end
	end
end
