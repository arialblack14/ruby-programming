class Player
	attr_reader = :player

	def initialize
		puts "What is your name player1?"
		@player = gets.chomp
	end

	def get_letter
		puts "Please choose a letter! X or O?"
		@letter = gets.chomp if error_choice		
	end

	def error_choice
		if @letter.size > 1
			puts "Only one letter please."
		end
		if @letter.downcase.include? ("x" || "o")
			puts "Please choose x or o!"
		end
	end
end

class Board
	attr_accessor :board,
								:arr

	def initialize
		@arr = %w{1 2 3 4 5 6 7 8 9}
		@board = @arr[0] + "|" + @arr[1] + "|" + @arr[2] + "\n" +
						"-+-+-\n" +
						 @arr[3] + "|" + @arr[4] + "|" + @arr[5] + "\n" +
						"-+-+-\n" +
						 @arr[6] + "|" + @arr[7] + "|" + @arr[8] + "\n"
	end

	def draw
		puts @board
	end
end

class Game
	attr_reader :turn,
							:game,
							:player1,
							:player2

	def initialize
		@player1 = Player.new
		@player1 = Player.new
		@board = Board.new
		@turn = 0
	end

	def start
		puts "************************************"
		puts "** Welcome to the TicTacToe game! **"
		puts "************************************"
		puts
		puts "It is your turn #{player1}"
		turn_change
	end

	def turn_change
		@turn%2 == 0 ? @player1.play : @player2.play
		@turn +=1
	end

	def play
		
	end

	def end
		
	end
end

board = Board.new
board.draw
#game = Game.new
#p game.start

