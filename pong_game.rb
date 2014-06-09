require 'rubygems'
require 'gosu'

class Ball
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@window = window
		@x, @y = 400, 200
		@vx, @vy = 5, 5
		@w, @h = 20, 20
		@image = Gosu::Image.new(@window, 'ball.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def bounce
		@vx -= 5
	end

	def move
		@x += @vx
		@y += @vy
		if @y > (@window.height - @h)
			@vy = -5
		end
		if @x > (@window.width - @w)
			@vx = -5
		end
		if @x < 0
			@vx = 5
		end
		if @y < 0
			@vy = 5
		end
	end
end

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

class GameWindow < Gosu::Window
	attr_accessor :width, :height

	def initialize
		@width = 800
		@height = 600
		super @width, @height, false
		self.caption = 'Pong Game'
		@ball = Ball.new(self)
		@left_paddle = Paddle.new(self, 20)
		@right_paddle = Paddle.new(self, 760)
	end

	def touching?(obj1, obj2)
		(obj1.x > (obj2.x - obj1.x)) and (obj1.y < (obj2.y + obj2.w)) and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h
	end

	def update
		@ball.move
		if button_down?(Gosu::KbW)
			@left_paddle.move_up
		end
		if button_down?(Gosu::KbZ)
			@left_paddle.move_down
		end
		if button_down?(Gosu::KbU)
			@right_paddle.move_up
		end
		if button_down?(Gosu::KbN)
			@right_paddle.move_down
		end
		if touching?(@left_paddle, @ball)
			@ball.bounce
		end
	end

	def draw
		@ball.draw
		@left_paddle.draw
		@right_paddle.draw
	end
end

window = GameWindow.new
window.show