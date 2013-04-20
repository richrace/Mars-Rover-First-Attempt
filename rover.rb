require './util'

# Class that controls a Rover. Requires to have a grid to work out
# if the movement was valid.
#
# Stores the coordinates (X,Y) and the degree (N,S,E,W) as a hash
# for ease of use; could use an object but not necessary.
class Rover
	include Util
	
	# Only need readers
	attr_reader :location, :grid

	# Initialises the Rover setting the start location (X,Y) 
	# the degree (N,S,E,W) as an int (see Util module) 
	# and the grib the rover will be on.
	def initialize(x,y,d, grid)
		@location = {:x => x, :y => y, :d => d}
		@grid = grid
	end

	# Can be either array of actions split e.g. ["M","R","R"]
	# Or can be a single action e.g. "M"
	def move(move_direction)
		# Move forward! Constants can be found in Util
		if (move_direction == FORWARD) 
			if @location[:d] == DNORTH
				@location[:y] += 1
			elsif @location[:d] == DEAST
				@location[:x] += 1
			elsif @location[:d] == DSOUTH
				@location[:y] -= 1
			elsif @location[:d] == DWEST
				@location[:x] -= 1
			end	
		# Rotate Clockwise +90 degrees - Turn Right
		elsif (move_direction == RIGHT)
			@location[:d] += 90
		# Rotate Anti-clockwise -90 degrees - Turn left
		elsif (move_direction == LEFT)
			@location[:d] -= 90
		end

		# Lets ensure what we've done is valid and clean up the direction
		self.validate
	end

	# Validates the object to ensure it is on the grid
	# Will throw exceptions (RangeError) if the Rover is off the grid, or the 
	# degree isn't a multiple of 90
	#
	# Will correct the location degree 
	# E.g. if the value was 0 degrees and we rotated anti-clockwise 
	# it would become -90; we correct this to be 270
	def validate
		raise RangeError, "The specified location doesn't exist on the grid!" if @location[:x] > @grid.xlimit || @location[:y] > @grid.ylimit || @location[:x] < 0 || @location[:y] < 0
		raise RangeError, "The direction (d) shouldn't be more than 360!" if @location[:d] > 360
		raise RangeError, "The direction needs to be a multiple of 90!"  if (@location[:d] % 90) != 0
		# Reset the degree
		@location[:d] = DNORTH if @location[:d] == 360 
		# Set the degree as 270 (West) if turning left (anti-clockwise) 
		# from North (0)
		@location[:d] = DWEST if @location[:d] == -90
	end

end