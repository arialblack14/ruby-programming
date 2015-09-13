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
	attr_reader :guess, :count_guess

	def initialize
		@guess = "rrrr"
		@count_guess = 0
		# Picks 1 each time from the array and joins in the end
		@secret = 4.times.map { ['r', 'g', 'b', 'y'].sample }.join
		#puts @secret
	end

	def start
		puts "What is your guess...?"
		@guess = gets.chomp
		puts "Your guess is #{@guess}."
		check_guess @guess
	end

	def check_guess guess
		@guess == @secret ? (puts "win") : (puts "lose")
		@count_guess += 1
		puts "You have " + (12 - @count_guess).to_s + " guesses remaining."
		reguess
	end

	def reguess
		start
	end
end

class CodeBreaker < Player
end

p = CodeBreaker.new("Alex")
p.hello
g = Game.new
g.start
