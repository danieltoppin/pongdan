require 'rubygems'
require 'gosu'

class Ball
	def initialize(window)
		@window = window
		@x = 400
		@y = 200
		@speed = 10
		@vx = @speed
		@vy = @speed
		@w = 20
		@h = 20
		@image = Gosu::Image.new(@window, 'ball.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move
		@x = @x + @vx
		@y = @y + @vy
		if @y > (@window.height - @h)
			@vy = -@speed
		end
		if @x > (@window.width - @w)
			@vx = -@speed
		end
		if @x < 0
			@vx = @speed
		end
		if @y < 0
			@vy = @speed
		end
	end
end

class GameWindow < Gosu::Window
	attr_accessor :width, :height

	def initialize
		@width = 800
		@height = 600
		super @width, @height, false
		self.caption = 'Pong Game'
		@ball = Ball.new(self)
	end

	def update
		@ball.move
	end

	def draw
		@ball.draw
	end
end

window = GameWindow.new
window.show