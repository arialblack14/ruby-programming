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
	$winning_combo = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 4, 6]]
	attr_accessor :arr,
								:board,
								:turn,
								:mark,
								:choices,
								:game

	def initialize
		@arr = %w{1 2 3 4 5 6 7 8 9}
		@board = board
		@mark = mark
		@turn = 0
		@choices = []
		@choices1 = []
		@choices2 = []
		@game = game
	end

	def set_board arr
		@board = @arr[0] + "|" + @arr[1] + "|" + @arr[2] + "\n" +
						"-+-+-\n" +
						 @arr[3] + "|" + @arr[4] + "|" + @arr[5] + "\n" +
						"-+-+-\n" +
						 @arr[6] + "|" + @arr[7] + "|" + @arr[8] + "\n"
	end

	# Sets board so that @board uses @arr values
	def draw
		set_board @arr
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
		# puts "@position : #{@position}"
		put_mark
		turn_change
	end

	# Select x or o depending on player
	def what_mark
		return @turn % 2 == 0 ? @mark = "x" : @mark = "o"
	end

	# Stores players' choices in individual arrays
	def player_choices
		i, j = 0, 0
		@choices = if @turn % 2 == 0
								@choices1 << @position - 1
								# p @choices1
								check_win @choices1
								i += 1
							else
								@choices2 << @position - 1
								# p @choices2
								check_win @choices2
								j += 1
							end
		# puts @choices
		# puts "choices : #{@choices.sort}"
		# check_win @choices
	end

	def check_win choices
		# puts "winning_combo : #{$winning_combo}"
		$winning_combo.each do |check|
			if (check - choices).empty?
				puts @turn % 2 == 0 ? "Player 1, you win!!" : "Player 2, you win!!"
				set_board @arr
				puts "Bye bye..."
				exit
			end
		end
	end

	# Sets array value to the current mark ("x" or "o")
	def put_mark
		player_choices		
		# puts "turn : #{@turn}"
		@arr[@position - 1] = what_mark
		# puts "arr : #{@arr}"
		set_board @arr
		puts @board
		@turn += 1
	end

	def turn_change
		while	@turn < 9 do
			@turn % 2 == 0 ? "Player 1, it is your turn" : "Player 2, it is your turn" 
			play
		end
		puts "Replay maybe?"
		@game = Game.new
	end

	# Check for errors the arrays of choices for both players
	def check_choice choices
		choices.each do |i|
			if choices[i] == @position - 1
				puts "ERROR!"
				puts "You have already picked this number."
				get_position
			end
		end
	end

	def error_choice
		unless @position.between?(1,9)
			puts "ERROR!"
			puts "A number from 1 to 9 please."
		end
		check_choice @choices1
		check_choice @choices2
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
		puts "Bye bye!"
		exit
	end
end


game = Game.new
game.start