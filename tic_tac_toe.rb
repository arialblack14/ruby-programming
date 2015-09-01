class Player
	attr_reader = :id,
							  :player

	def initialize id
		@id = id
		puts "What is your name player #{@id + 1}?"
		@player = gets.chomp
	end
end

class Board
	attr_reader 	:turn
	attr_accessor :arr,
								:board,
								:mark

	def initialize
		@arr = %w{1 2 3 4 5 6 7 8 9}
		@board = @arr[0] + "|" + @arr[1] + "|" + @arr[2] + "\n" +
						"-+-+-\n" +
						 @arr[3] + "|" + @arr[4] + "|" + @arr[5] + "\n" +
						"-+-+-\n" +
						 @arr[6] + "|" + @arr[7] + "|" + @arr[8] + "\n"
		@mark = ["x","o"]
		@turn = 0
	end

	def draw
		puts @board
		play
	end

	def play
		get_position
	end

	def get_position
		puts "Please select where to put your letter."
		puts "Choose a number from 1 to 9."
		@position = gets.chomp.to_i
		put_mark
		puts @board
		turn_change
	end

	def what_mark
		return @turn % 2 == 0 ? @mark[0] : @mark[1] # Select x or o depending on player
		@turn += 1
	end

	def put_mark
		@arr[@position - 1] = what_mark unless error_choice
	end

	def turn_change
		9.times do
			play
		end
	end

	def error_choice
		unless @position.between?(1,9)
			puts "ERROR!"
			puts "A number from 1 to 9 please."
		end
	end
end

class Game
	attr_reader :turn,
							:game,
							:player1,
							:player2,
							:mark0,
							:mark1

	def initialize
		puts "************************************"
		puts "** Welcome to the TicTacToe game! **"
		puts "************************************"
		puts
		@player1 = Player.new(0)
		@mark0 = "x"
		@player2 = Player.new(1)
		@mark1 = "o"
		@board = Board.new
	end

	def start
		puts "Let the game begin!"
		@board.draw
	end

	def end
		
	end
end


game = Game.new
game.start