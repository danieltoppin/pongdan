class Score
	def initialize(window, xpos)
		@value = 0
		@x = xpos
		@y = 20
		@font = Gosu::Font.new(window, 'System', 30)
	end

	def draw
		@font.draw("#{@value}", @x, @y, 1)
	end

	def increase
		@value = @value + 1
	end

end