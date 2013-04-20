# Module used instead of class so can use it as Mixin.
# Module contains utility methods and constants for the 
# text 
module Util

	# Following constants are used for the Text North/South/
	# East/West (N,S,E,W) from inputs.
	NORTH = "N"
	SOUTH = "S"
	EAST = "E"
	WEST = "W"

	# Following constants used for movement options.
	FORWARD = "M"
	RIGHT = "R"
	LEFT = "L"

	# Following constants used for the degrees for North,
	# South, East, West
	DNORTH = 0
	DEAST = 90
	DSOUTH = 180
	DWEST = 270

	# Takes in a string and splits it into char array; will remove 
	# any white space. 
	# Used for getting movement input
	# E.g. "LMRRM" -> ["L","M","R","R","M"] 
	# Used for getting Rover starting point
	# E.g. "0 1 N" -> ["0","1","N"]
	# Note: it will convert ints to string when creating rovers
	# will need to convert to integer.
	def split_line(string)
		return string.delete(" ").scan(/./)
	end

	# Simple string splitter for splitting string inputs into 
	# lines.
	def split_string(string)
		return string.split(/\n/)
	end

	# Converts a String (One character input) into the degree to be
	# used by the rover for addition/substraction 
	# Input e.g. "N","S","E","W" i.e. the constants
	# Example conversion: Input string = "W"; output = 270
	def get_degree(string)
		# To make sure that 0 isn't used.
		degree = nil
		if string == NORTH 
			degree = DNORTH
		elsif string == EAST
			degree = DEAST
		elsif string == SOUTH
			degree = DSOUTH
		elsif string == WEST
			degree = DWEST
		end
		return degree
	end

	# Converts the degree (90) into a string representation, e.g. "N"
	# does the opposite from above (get_degree)
	# Example conversion: Input degree = 270; Output string = "W"
	def get_direction(degree)
		direction = nil
		if degree == DNORTH
			direction = NORTH
		elsif degree == DEAST
			direction = EAST
		elsif degree == DSOUTH
			direction = SOUTH
		elsif degree == DWEST
			direction = WEST
		end
		return direction
	end
end
