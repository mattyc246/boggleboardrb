########## Boggle Board ##########
### Thought Process

# First initilize the boggle board with the dice given
# Start a new round which will result in shaking the dice and printing out the board
# Take in the user input of a word guess
# Find the indexes of all the beginning letters of the word
# Go and 

class Boggle

	attr_reader :dice

	def initialize(starting_dice)
		@dice = starting_dice
	end

	def play_round

	end

	def shake_dice!

		dice = @dice.shuffle

		board = []

		dice.each do |die|

			board << die.sample

		end

		return board


	end

	def print_board(board)

		puts ""
		puts "================="

		board.each_slice(4) do |row|

			puts "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} |"
			puts "================="

		end

		puts ""

	end

end

########### Driver Code ###########

dice = [['A','A','E','E','G','N'],
		['E','L','R','T','T','Y'],
		['A','O','O','T','T','W'],
		['A','B','B','J','O','O'],
		['E','H','R','T','V','W'],
		['C','I','M','O','T','U'],
		['D','I','S','T','T','Y'],
		['E','I','O','S','S','T'],
		['D','E','L','R','V','Y'],
		['A','C','H','O','P','S'],
		['H','I','M','N','Q','U'],
		['E','E','I','N','S','U'],
		['E','E','G','H','N','W'],
		['A','F','F','K','P','S'],
		['H','L','N','N','R','Z'],
		['D','E','I','L','R','X']]

boggle = Boggle.new(dice)
board = boggle.shake_dice!
boggle.print_board(board)