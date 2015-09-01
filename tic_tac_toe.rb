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
	attr_accessor :arr,
								:board,
								:turn,
								:mark,
								:choices

	def initialize
		@arr = %w{1 2 3 4 5 6 7 8 9}
		@board = @arr[0] + "|" + @arr[1] + "|" + @arr[2] + "\n" +
						"-+-+-\n" +
						 @arr[3] + "|" + @arr[4] + "|" + @arr[5] + "\n" +
						"-+-+-\n" +
						 @arr[6] + "|" + @arr[7] + "|" + @arr[8] + "\n"
		@mark = mark
		@turn = 0
		@choices = []
	end

	def draw
		puts @board
		play
	end

	def play
		get_position
	end

	# Asks users for a number to mark
	def get_position
		puts "Please select where to put your letter."
		puts "Choose a number from 1 to 9."
		@position = gets.chomp.to_i
		error_choice ? @position : get_position
		puts "@position : #{@position}"
		put_mark
		turn_change
	end

	# Select x or o depending on player
	def what_mark
		return @turn % 2 == 0 ? @mark = "x" : @mark = "o"
	end

	# Sets array value to the current mark ("x" or "o") and stores players' choices
	def put_mark
		@choices[@turn] = @position - 1
		puts "choices : #{@choices}"
		puts "turn : #{@turn}"
		@arr[@position - 1] = what_mark
		puts "arr : #{@arr}"
		puts @board
		@turn += 1
	end

	def turn_change
		while	@turn < 9 do
			play
		end
	end

	def error_choice
		unless @position.between?(1,9)
			puts "ERROR!"
			puts "A number from 1 to 9 please."
		end

		@choices.each do |i|
			if @choices[i] == @position - 1
				puts "ERROR!"
				puts "You have already picked this number."
				get_position
			end
		end
	end
end

class Game
	attr_reader :game,
							:player1,
							:player2

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