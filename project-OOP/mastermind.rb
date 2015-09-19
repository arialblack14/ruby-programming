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
		p = Player.new("Alex")
		p.hello
		board = Board.new
		board.start
	end

	def quit
		puts "Choose 'p' next time..."
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
	attr_reader :guess, :count_guess, :total_guesses, :secret

	def initialize
		@guess ||= "rrrr"
		@secret ||= "qqqq"
		@count_guess = 0
		@total_guesses = 12		
		@color_count = 0
		@right_spot = 0
	end


	def start
		puts "Would you like to be a code_(b)reaker or code_(m)aker?"
		ans = gets.chomp
		ans == "m" ? code_maker : code_breaker
	end

	def code_maker
		puts "What is your secret code?"
		@secret = gets.chomp
		cpu_guesses
	end

	def code_breaker
		@secret = 4.times.map { ['r', 'g', 'b', 'y', 'q', 'p'].sample }.join
		puts "Secret code has been generated."
		unless guessed
			12.times do
				puts "What is your guess...?"
				@guess = gets.chomp
				puts "Your guess is #{@guess}."
				check_guess @guess
			end
		end
	end

	def check_guess guess
		puts @guess
		puts @secret
		@count_guess += 1
		guessed
		positions
	end

	def guessed
		@guess == @secret ? (puts "win") : remaining_guesses
	end

	def remaining_guesses
		rem_guesses = @total_guesses - @count_guess
		puts rem_guesses.to_s + " guesses remaining..."
		if rem_guesses == 0
			puts "No more guesses!"
			exit
		end
	end

	def positions
		loop_count = 0
		@secret.split("").each do |color|
			temp = @guess.split("")
			if temp.include? color
				@color_count += 1

				if temp[loop_count] == color
					@right_spot += 1
				end
				@color_temp = @color_count
				@color = color
			end
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
	end

	def cpu_guesses
		unless guessed
			12.times do 
				@guess = 4.times.map { %w(r g b y q p).sample }.join
				check_guess @guess
			end
		end	
	end
end

g = Game.new
g.start