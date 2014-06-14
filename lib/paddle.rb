class Paddle
	attr_reader :x, :y, :w, :h

	def initialize(window, xpos)
		@window = window
		@w, @h = 20, 60
		@x, @y = xpos, (@window.height/2) - (@h / 2)
		@image = Gosu::Image.new(@window, 'paddle.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move_up
		unless @y < 0
			@y -= 5
		end
	end

	def move_down
		unless @y > (@window.height - @h)
			@y += 5
		end
	end
end