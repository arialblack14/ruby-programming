class Player
	attr_reader = :first_player, 
								:second_player

	def initialize
		@first_player = first_player
		@second_player = second_player
	end
end

class Mark
	attr_reader		:first_player,
								:second_player
	attr_accessor :chozen

	def initialize
		@chozen = chozen		
	end

	def letter
		puts "Please choose your mark! X or O?"
		@chozen = gets.chomp if @chozen == :x || :o	
	end
end

class Game
	# attr_reader :first_player
	# attr_reader :second_player
	# attr_reader :chozen

	def initialize
		@first_player = Player.new
		@second_player = Player.new
		@chozen = Mark.new
	end

	def choose_letter
		@first_player.letter

	end
end


game = Game.new
p game.first_player.letter

