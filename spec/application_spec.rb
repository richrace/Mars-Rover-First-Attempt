require './util'
require './application'

# Uses one string as an input into the application to generate
# the solution
describe Application do
	describe "#run" do 

		# Using the wanted input and expected output from E-mail
		it "should run with example string" do
			app = Application.new
			app.run("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
			rover1 = app.rovers[0]
			rover2 = app.rovers[1]

			rover1.location[:x].should == 1
			rover1.location[:y].should == 3
			rover1.location[:d].should == 0 # 0 = North
			# Use mixin to get the direction as text
			app.get_direction(rover1.location[:d]).should == "N"

			rover2.location[:x].should == 5
			rover2.location[:y].should == 1
			rover2.location[:d].should == 90 # 90 = East
			# Use mixin to get the direction as text
			app.get_direction(rover2.location[:d]).should == "E"
		end

		# Add another rover to ensure it works for n number of rovers
		it "should run with one grid and 3 rovers" do
			app = Application.new
			app.run("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n2 2 S\nMLMMLMM")
			rover1 = app.rovers[0]
			rover2 = app.rovers[1]
			rover3 = app.rovers[2]

			rover1.location[:x].should == 1
			rover1.location[:y].should == 3
			rover1.location[:d].should == 0 # 0 = North
			# Use mixin to get the direction as text
			app.get_direction(rover1.location[:d]).should == "N"

			rover2.location[:x].should == 5
			rover2.location[:y].should == 1
			rover2.location[:d].should == 90 # 90 = East
			# Use mixin to get the direction as text
			app.get_direction(rover2.location[:d]).should == "E"

			rover3.location[:x].should == 4
			rover3.location[:y].should == 3
			rover3.location[:d].should == 0
			# Use mixin to get the direction as text
			app.get_direction(rover3.location[:d]).should == "N"
		end

	end

end