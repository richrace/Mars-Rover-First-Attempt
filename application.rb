require './util'
require './grid'
require './rover'

# Contains the main control loop
class Application
	include Util

	# cur_rover is used to perform routes; only need reader for all variables
	attr_reader :rovers, :cur_rover, :grid

	def initialize
		# Need to create new Array
		@rovers = []
	end

	# Expects string in form of the example:
	# "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
	# 
	# Will split the string into lines, the split the string
	# into chars to use. 
	# Format of the string is important. 
	# 2 Characters (0 1) sets the grid numbers. 
	# 3 Characters (O 1 N) sets the Rover
	# N Characters (L/R/M) sets the route.
	def run(string)
		# Use Input mixin to help manage this.
		lines = self.split_string(string)
		lines.each do | line |
			chars = self.split_line(line)
			# Perform this check first as you can have 2 or 3 commands.
			if (chars.include? FORWARD) || (chars.include? RIGHT) || (chars.include? LEFT) 
				chars.each {|command| @cur_rover.move(command)} unless @cur_rover.nil?
			# Setup of Grid
			elsif chars.length == 2
				@grid = Grid.new(chars[0].to_i, chars[1].to_i)
			# Setup of Rover
			elsif chars.length == 3
				# Ensure the grid exists
				unless @grid.nil?
					# Convert N,E,S,W Char to an integer for use.
					degree = self.get_degree(chars[2])
					# Check the conversion has worked.
					unless degree.nil?
						@cur_rover = Rover.new(chars[0].to_i, chars[1].to_i, degree, @grid)						
						@rovers << @cur_rover
						# Lets print the output of the new Rover
						puts "\nRover #{@rovers.length} Starting position: X: #{@cur_rover.location[:x]} Y: #{@cur_rover.location[:y]} D: #{self.get_direction(@cur_rover.location[:d])}"
					end
				end
			end
		end
		# Finished running lets output the values of our rovers
		@rovers.each_with_index { | rover, index | puts "\nRover #{index+1} X: #{rover.location[:x]} Y: #{rover.location[:y]} D: #{self.get_direction(rover.location[:d])}" }
	end
end