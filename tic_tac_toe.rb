class Player
	attr_reader = :player1,
								:player2,
								:letter

	def initialize
		@player1 = player1
		@player2 = player2
	end

	def get_letter
		puts "Please choose a letter! X or O?"
		@letter = gets.chomp if error_choice		
	end

	def error_choice
		puts "Please choose x or o!" if @letter.downcase
																					 .include? ("x" || "o")
																					 || @letter.size > 1
	end
end

class Board
	def initialize
		
	end
end

class Game
	attr_reader :turn,
							:game

	def initialize
		@board = Board.new
		@game = game
		@turn = 0
	end

	def start_game
		puts "************************************"
		puts "** Welcome to the TicTacToe game! **"
		puts "************************************"
		turn_change
	end

	def turn_change
		@turn%2 == 0 ? @player1.play : @player2.play
		@turn++
	end

	def play
		
	end

	def end_game
		
	end
end


game = Game.new
p game.player1.choose_letter

