require 'active_support/inflector'

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
		@name = name || "Strager"
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
		@secret = 4.times.map { ['r', 'g', 'b', 'y', 'q', 'p'].sample }.join
		puts @secret
		@color_count = 0
		@right_spot = 0
	end

	def start
		puts "What is your guess...?"
		@guess = gets.chomp
		puts "Your guess is #{@guess}."
		check_guess @guess
	end

	def check_guess guess
		@count_guess += 1
		guessed
		positions
		reguess
	end

	def guessed
		@guess == @secret ? (puts "win") : remaining_guesses
	end

	def remaining_guesses
		puts "You have " + (@total_guesses - @count_guess).to_s + " guesses remaining."
	end

	def reguess
		start
	end

	def positions
		p @guess.split("")
		p @secret.split("")
		loop_count = 0
		@secret.split("").each do |color|
			temp = @guess.split("")
			if temp.include? color
				@color_count += 1
				puts "color_count : " + @color_count.to_s

				if @secret.split("").to_a.index(loop_count) == 
				   @guess.split("").to_a.index(loop_count)
					@right_spot += 1
					puts "right_spot : " + @right_spot.to_s
				end
			end
			p @guess.split("").to_a.index(color)
			p @secret.split("").to_a.index(loop_count)
			loop_count += 1
		end

		unless @guess == @secret
			puts "Right color(s) found : #{@color_count}."
			puts "#{@right_spot} colour(s)" + " in the right place."
		else
			puts "Congrats!! You win!"
			exit
		end
		@right_spot = 0
		@color_count = 0
		remaining_guesses
	end

	def index_color thing
		thing += 1
	end
end

class CodeBreaker < Player
end

p = CodeBreaker.new("Alex")
p.hello
g = Game.new
g.start
