require './grid'

# Ensures the the Grid should only accept Numbers
describe Grid do
	describe "#initialize" do 
		it "should accept 1 2 as valid params" do
			grid = Grid.new(1,2)
			grid.xlimit.should == 1
			grid.ylimit.should == 2
		end

		it "should accept '2' '4' as valid params" do
			grid = Grid.new('2','4')
			grid.xlimit.should == 2
			grid.ylimit.should == 4
		end

		it "should accept floats 1.3 2.6 but strip the point" do
			grid = Grid.new(1.3,2.6)
			grid.xlimit.should == 1
			grid.ylimit.should == 2
		end

		it "should raise exception if passed A 4 as params" do
			lambda { Grid.new("A", 4) }.should raise_error
		end

		it "should raise exception if passed 4 A as params" do
			lambda { Grid.new(4, "A") }.should raise_error
		end

		it "should raise exception if passed -2 4 as params" do
			lambda { Grid.new(-2, 4) }.should raise_error
		end

		it "should raise exception if passed 4 -2 as params" do
			lambda { Grid.new(4, -2) }.should raise_error
		end
	end
end
