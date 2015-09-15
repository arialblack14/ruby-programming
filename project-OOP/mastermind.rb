class Game
	attr_reader :game

	def initialize
		@game = game		
	end

	def start
		puts "Welcome to MASTERMIND!"
		puts "Would you like to (P)lay or (Q)uit?"
		choose
	end

	def choose
		ans = gets.chomp.downcase
		ans == "p" ? play : quit
	end

	def play
		board = Board.new
		board.start
	end

	def quit
		puts "Bye!"
		exit
	end
end

class Player
	attr_reader :name

	def initialize name
		@name = name
	end

	def hello
		puts "Hello #{@name}"
	end
end

class Board
	attr_reader :guess, :count_guess, :total_guesses

	def initialize
		@guess = "rrrr"
		@count_guess = 0
		# Picks 1 each time from the array 
		# and joins in the end
		@total_guesses = 12
		@secret = 4.times.map { ['r', 'g', 'b', 'y'].sample }.join
		# puts @secret
		@color_count = 0
	end

	def start
		puts "What is your guess...?"
		@guess = gets.chomp
		puts "Your guess is #{@guess}."
		check_guess @guess
	end

	def check_guess guess
		@count_guess += 1
		@guess == @secret ? (puts "win") : remaining_guesses
		reguess
	end

	def remaining_guesses
		puts "You have " + (@total_guesses - @count_guess).to_s + " guesses remaining."
	end

	def reguess
		start
	end

	def positions guess
		@secret.split.each do |color|
			if @guess.split.include? color
				@color_count += 1
				if @guess.split.index(color) == 
					 @secret.split.index(color)
					 @right_spot
				end
			end
			puts "A color is in #{@color_count} spots."
			puts "A color is in the right spot."
		end
		guess		
	end
end

class CodeBreaker < Player
end

p = CodeBreaker.new("Alex")
p.hello
g = Game.new
g.start
