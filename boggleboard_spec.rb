require 'rspec/given'
require 'pry'
require_relative './boggleboard'

Rspec.describe Boggle do

	Given(:dice) { [['A','A','E','E','G','N'],['E','L','R','T','T','Y'],['A','O','O','T','T','W'],['A','B','B','J','O','O'],['E','H','R','T','V','W'],['C','I','M','O','T','U'],['D','I','S','T','T','Y'],['E','I','O','S','S','T'],['D','E','L','R','V','Y'],['A','C','H','O','P','S'],['H','I','M','N','Q','U'],['E','E','I','N','S','U'],['E','E','G','H','N','W'],['A','F','F','K','P','S'],['H','L','N','N','R','Z'],['D','E','I','L','R','X']] }
	Given(:boggle) { Boggle.new(dice) }
	Given (:board) { ['T','A','E','O','E','R','U','T','I','R','S','H','K','R','I','T'] }

	context '#initialize' do
		When(:results) { boggle.dice }
		Then { results == dice }
	end

	context '#shake_dice!' do
		When(:results) { boggle.shake_dice! }
		Then { results.count == 16 }
	end

	context '#find_starting_letters' do
		Given (:word) { "RAT" }
		When (:results) { boggle.find_starting_letters(board, word) }
		Then { results == [5,9,13] }
	end

	context '#find_surrounding' do
		Given (:letter) { "R" }
		When (:results) { boggle.find_surrounding(board, current_letter) }
		Then { results == ['T','A','E','E','U','I','R','S'] }
	end
end