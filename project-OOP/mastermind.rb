class Game
	attr_reader :game

	def initialize
		@game = game		
	end

	def start
		puts "Welcome to MASTERMIND!"
		puts "Would you like to (p)lay or (q)uit?"
		choose
	end

	def choose
		ans = gets.chomp
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
		@guess = 1111
		@count_guess = 0
		@number = Random.rand(1111..6666)
	end

	def start
		puts "What is your guess...?"
		@guess = gets.chomp.to_i
		puts "Your guess is #{@guess}."
		check_guess @guess
	end

	def check_guess guess
		@guess == @number ? (puts "win") : (puts "lose")
		@count_guess += 1
		puts "You have " + (12 - @count_guess).to_s + " guesses remaining."
		reguess
	end

	def reguess
		start
	end
end

p = Player.new("Alex")
p.hello
g = Game.new
g.start
