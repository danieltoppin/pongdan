class Score

	def initialize(window, xpos)
		@score = 0
		@locked = true
		@x = xpos
		@y = 20
		@font = Gosu::Font.new(window, 'System', 30)
	end

	def draw
		@font.draw("#{@score}", @x, @y, 1)
	end

	def increase
		unless is_locked?
			@score = @score + 1
		end
	end

	def unlock
		@locked = false
	end

	def lock
		@locked = true
	end

	def is_locked?
		@locked == true
	end

end