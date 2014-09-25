class Ball
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@window = window
		@x, @y = 400, 270
		@vx, @vy = 5, 5
		@w, @h = 20, 20
		@image = Gosu::Image.new(@window, 'ball.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end
end