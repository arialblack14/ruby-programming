class Player
	attr_reader = :id,
								:player

	def initialize id
		@id = id
		puts "What is your name player #{@id}?"
		@player = gets.chomp
	end

	def play
		get_letter if @letter.nil?
		get_position
	end

	def get_position
		puts "Please select where to put your mark."
		puts "Choose a number from 1 to 9."
		@position = gets.chomp.to_i 
		if @position.between?(1,9)
			@board.arr[@position - 1] = @letter
			puts @board
		end
	end

	def get_letter
		puts "Please choose a letter! X or O?"
		@letter = gets.chomp 
		@letter unless error_choice
		puts "#{@player} has chosen #{@letter}"
	end

	def error_choice
		if @letter.length > 1
			puts "Only one letter please."
			get_letter
		end

		unless @letter.downcase == "x" || 
					 @letter.downcase == "o"
			puts "ERROR!"
			get_letter
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
		puts "************************************"
		puts "** Welcome to the TicTacToe game! **"
		puts "************************************"
		puts
		@player1 = Player.new(1)
		@player2 = Player.new(2)
		@board = Board.new
		@turn = 0
	end

	def start
		puts "Let the game begin!"
		@board.draw
		turn_change
	end

	def turn_change
		@turn % 2 == 0 ? @player1.play : @player2.play
		@turn +=1
	end

	def end
		
	end
end


game = Game.new
game.start