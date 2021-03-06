########## Boggle Board ##########
### Thought Process

# First initilize the boggle board with the dice given
# Start a new round which will result in shaking the dice and printing out the board
# Take in the user input of a word guess
# Find the indexes of all the first letter of the word in the board
# Go and check the first one, if the second letter of the word is not found surrounding it
# Move onto the next starting letter
# Until you reach the end of the board, if the word does not match anywhere it is not valid


class Boggle

	attr_reader :dice

	def initialize(starting_dice)
		@dice = starting_dice
		@adjacent = {

			0 => [1,4,5],
			1 => [0,2,4,5,6],
			2 => [1,3,5,6,7],
			3 => [2,6,7],
			4 => [0,1,5,8,9],
			5 => [0,1,2,4,6,8,9,10],
			6 => [1,2,3,4,7,9,10,11],
			7 => [2,3,6,10,11],
			8 => [4,5,9,12,13],
			9 => [4,5,6,8,10,12,13,14],
			10 => [5,6,7,9,11,13,14,15],
			11 => [6,7,10,14,15],
			12 => [8,9,13],
			13 => [8,9,10,12,14],
			14 => [9,10,11,13,15],
			15 => [10,11,14]

		}
	end

	def play_round

    guess = ""

    until guess == ['Q','U','I','T']
      
      game_state = true
      # Start by shaking the dice to get the new board
      new_board = shake_dice!
      # Display the board on the screen
      print_board(new_board)
      # Take the user input of a word
      guess = word_guess
      # Validate that the first letter is even found inside the board
      validate_guess(new_board, guess)
      # Get all the possible starting points of the word in the board
      starting_letters = find_starting_letters(new_board, guess)

      until game_state == false
        # Start with the first starting point and check if the word can be matched there or not
        starting_letters.each do |letter|

          puts letter
          # If it can, return a win, if it cannot check the next starting point
          # If all the starting points have been checked and the word cannot be made anywhere then the guess is not valid

          # CHECKING LOGIC
          # Given the first index, get all the surrounding letters and indexes
          # Check that the second letter in the word is within those surrounding letters
          # If it is and the number of occurances if greater than 1, note checking more than 1 may be necessary
          # If it is and the number of occurances is only 1 then get the new surrounding letters and indexes
          # If the final letter in the guess is found in the surrounding indexes, return a win
          # Otherwise move onto the next occurance (if there is one)
          # If the occurance is only 1 and the next letter is not in the surrounding then move onto the next starting point
        end

        game_state = false
        puts "Your guess is not valid! Try again!"

      end

    end

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

	def word_guess
   
		puts "== Make a guess on a word =="
		new_word = gets.chomp
    split_word = new_word.split("")
    return split_word

	end

	def validate_guess(board, guess)

		return true if board.include?(guess[0])

	end

	def find_starting_letters(board, word)

		indexes = []

		board.each_with_index {|l,i| indexes << i if l == word[0]}
		
		return indexes

	end

  def find_surrounding_letters(board, index)

    surr_indexes = @adjacent[index]

    surr_letters = []

    surr_indexes.each { |i| surr_letters << board[i] }

    return surr_letters

  end

  def find_surrounding_indexes(index)

    surr_indexes = @adjacent[index]

    return surr_indexes

  end

  def validate_letter(letter, surrounding)

    return true if surrounding.include?(letter)

  end

  def find_next_index(letter, arr)

    return arr.index(letter)

  end

  def next_letter(index, indexes)

    next_letter = indexes[index]
    return next_letter

  end
		
end

# ########## Driver Code ###########

# dice = [['A','A','E','E','G','N'],
# 		['E','L','R','T','T','Y'],
# 		['A','O','O','T','T','W'],
# 		['A','B','B','J','O','O'],
# 		['E','H','R','T','V','W'],
# 		['C','I','M','O','T','U'],
# 		['D','I','S','T','T','Y'],
# 		['E','I','O','S','S','T'],
# 		['D','E','L','R','V','Y'],
# 		['A','C','H','O','P','S'],
# 		['H','I','M','N','Q','U'],
# 		['E','E','I','N','S','U'],
# 		['E','E','G','H','N','W'],
# 		['A','F','F','K','P','S'],
# 		['H','L','N','N','R','Z'],
# 		['D','E','I','L','R','X']]

# boggle = Boggle.new(dice)
# board = boggle.shake_dice!
# boggle.play_round
