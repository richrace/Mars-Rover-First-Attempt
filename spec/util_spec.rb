require './util'

# Tests to ensure the common methods are correct
describe Util do
	before(:all) do
		class TempObj
			include Util
		end
	end

	describe "#split_line" do
		it "should return array of 2 elements" do
			util = TempObj.new
			util.split_line("AB").length.should == 2
			util.split_line("A B").length.should == 2
			util.split_line("A  B").length.should == 2
			util.split_line(" A   B  ").length.should == 2
		end

		it "should return array of 4" do
			util = TempObj.new
			util.split_line("MML").length.should == 3
			util.split_line("0 4 N").length.should == 3
			util.split_line("M R R ").length.should == 3
		end
	end

	describe "#split_string" do
		it "should return an array of lines for instructions" do
			util = TempObj.new
			util.split_string("0 5\n0 0 N\nMLMMMRL").length.should == 3
			util.split_string("0 2 E\nMLRLLM").length.should == 2
		end
	end

	describe "#get_degree" do
		it "should get degree of 0 for North input (N)" do
			util = TempObj.new
			util.get_degree("N").should == 0
		end

		it "should get degree of 90 for East input (E)" do
			util = TempObj.new
			util.get_degree("E").should == 90
		end

		it "should get degree of 180 for South input (S)" do
			util = TempObj.new
			util.get_degree("S").should == 180
		end

		it "should get degree of 270 for West input (W)" do
			util = TempObj.new
			util.get_degree("W").should == 270
		end
	end

	describe "#get_direction" do
		it "should get direction of North (N) for input of 0" do
			util = TempObj.new
			util.get_direction(0).should == "N"
		end

		it "should get direction of East (E) for input of 90" do
			util = TempObj.new
			util.get_direction(90).should == "E"
		end

		it "should get direction of South (S) for input of 180" do
			util = TempObj.new
			util.get_direction(180).should == "S"
		end

		it "should get direction of West (W) for input of 270" do
			util = TempObj.new
			util.get_direction(270).should == "W"
		end
	end
end
