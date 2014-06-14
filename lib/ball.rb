class Ball
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@window = window
		@x, @y = 400, 270
		@vx, @vy = 3, 3
		@w, @h = 20, 20
		@image = Gosu::Image.new(@window, 'ball.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def bounce
		@vx -= 5 * @vx
	end

	def move
		@x += @vx
		@y += @vy
		if @y > (@window.height - @h)
			@vy = -3
		end
		if @x > (@window.width - @w)
			@vx = -3
		end
		if @x < 0
			@vx = 3
		end
		if @y < 0
			@vy = 3
		end
	end
end