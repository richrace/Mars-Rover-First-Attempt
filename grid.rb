# Grid class used to store the limits of the X Y space
class Grid
	# Only required readers
	attr_reader :xlimit, :ylimit

	# Initialises the Grid using the given values
	# will turn the params into integers
	# 0 is not an acceptable value for either limit
	# The limits must be bigger than 0.
	def initialize(xlimit, ylimit)
		@xlimit = xlimit.to_i
		@ylimit = ylimit.to_i
		raise RangeError, "Zero (0) is not acceptable as a grid" if @xlimit <= 0 || @ylimit <= 0
	end

end