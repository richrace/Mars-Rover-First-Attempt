Introduction
================================

The Ruby code has been developed on Mac OS/X 10.8.2 with RVM Version 1.16.8, 
Ruby Version 1.9.3p194 and RSpec version is 2.11.1.

There is no main method within the code.

To test the application use "rspec" from the root directory; this will run 
the tests.

A simple test that proves the application works can be found in the 
"simple_spec.rb" file.

The full example can be found in the "application_spec.rb" file, this is outputs
the data on the screen when running the tests.


Design 
================================

The design is based on two main objects: Rover and Grid

The Rover class contains the movement method and validation (to ensure the move 
is valid). Within the Rover class it uses a Hash to store the location. The 
location contains the X,Y coordinates and the Degree (direction - North, South,
East, West). 

An object could have been used for the location but didn't offer any advantages 
other than moving 2 of the validation checks into it. Then you would have to add
an extra line of code to ensure that the location object to be validated.

The Grid class contains the limits of the grid. This makes sense to use an
object as the limits (X,Y) are set once per grid and should not change.

The Util module is used to allow it be used as a Mixin as it is needed in 
most of the classes.

The Application class contains the main control loop for analysing a string. 
This runs as a standalone loop (no main) to allow there to future development.
Future development could be introducing a Command Line Interface that creates
the string in the required format or reading in a file.


Assumptions
================================

It is assumed that the input will always stay in the same format:
	1. Grid Size
	2. Rover
	3. Movement
	4. Repeat steps 2 and 3 and always finish on step 3

The input would be passed as a string (if reading from file/CLI) to the 
application class. Splitting the above by new lines (\n)

Spaces are not important in this implementation but rather the number of 
characters. For example: 
	- The Grid Size is always 2 characters - not containing R, L or M
	- The Rover is always 3 characters - not containing R, L or M
	- Movement can be any amount as along as it contains R, L and/or M
