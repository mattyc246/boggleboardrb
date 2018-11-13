require 'rspec/given'
require 'pry'
require_relative './boggleboard'

RSpec.describe Boggle do

	Given(:dice) { [['A','A','E','E','G','N'],['E','L','R','T','T','Y'],['A','O','O','T','T','W'],['A','B','B','J','O','O'],['E','H','R','T','V','W'],['C','I','M','O','T','U'],['D','I','S','T','T','Y'],['E','I','O','S','S','T'],['D','E','L','R','V','Y'],['A','C','H','O','P','S'],['H','I','M','N','Q','U'],['E','E','I','N','S','U'],['E','E','G','H','N','W'],['A','F','F','K','P','S'],['H','L','N','N','R','Z'],['D','E','I','L','R','X']] }
	Given(:boggle) { Boggle.new(dice) }
	Given (:board) { ['T','A','E','O','E','R','U','T','I','R','S','H','K','R','I','T'] }
	Given (:word) { ["R","A","T"] }

	context '#initialize' do
		When(:results) { boggle.dice }
		Then { results == dice }
	end

	context '#shake_dice!' do
		When(:results) { boggle.shake_dice! }
		Then { results.count == 16 }
	end

	context '#validate_guess' do
		When (:results) { boggle.validate_guess(board, word) }
		Then { results == true }
	end 

	context '#find_starting_letters' do
		When (:results) { boggle.find_starting_letters(board, word) }
		Then { results == [5,9,13] }
	end

	context '#find_surrounding_letters' do
		Given (:index) { 5 }
		When (:results) { boggle.find_surrounding_letters(board, index) }
		Then { results == ['T','A','E','E','U','I','R','S'] }
	end

	context '#find_surrounding_indexes' do
		Given (:index) { 5 }
		When (:results) { boggle.find_surrounding_indexes(index) }
		Then { results == [0,1,2,4,6,8,9,10] }
	end

	context '#validate_letter' do
		Given (:letter) { "A" }
		Given (:surrounding) { ['T','A','E','E','U','I','R','S'] }
		When (:results) { boggle.validate_letter(letter, surrounding) }
		Then { results == true }
	end

  context '#next_letter' do
    Given (:index) { 5 }
    Given (:surrounding) { [0,1,2,4,6,8,9,10] }
    When (:results) { boggle.next_letter(index, surrounding) }
    Then { results == 8 }
  end
  
end