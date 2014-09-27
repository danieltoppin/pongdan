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
	def bounce
		@vx = -1 * @vx
	end

	def move
		@x += @vx
		@y += @vy

		if hit_top_wall
			@vy = 5
		end

		if hit_bottom_wall
			@vy = -5
		end

		if hit_left_wall
			@vx = 5
		end

		if hit_right_wall
			@vx = -5
		end
	end

	def hit_top_wall
		@y < 0
	end

	def hit_bottom_wall
		@y > (@window.height - @h)
	end

	def hit_left_wall
		@x < 0
	end

	def hit_right_wall
		@x > (@window.width - @w)
	end

	
end