require 'rubygems'
require 'gosu'
Dir["./lib/*.rb"].each {|file| require file }

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
		@left_score = Score.new(self, 20)
		@right_score = Score.new(self, 760)
	end

	def touching?(obj1, obj2)
		obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h
	end

	def update
		@ball.move
		if button_down?(Gosu::KbW)
			@left_paddle.move_up
		end
		if button_down?(Gosu::KbS)
			@left_paddle.move_down
		end
		if button_down?(Gosu::KbP)
			@right_paddle.move_up
		end
		if button_down?(Gosu::KbL)
			@right_paddle.move_down
		end
		if touching?(@right_paddle, @ball)
			@right_score.unlock
			@left_score.lock
			@ball.bounce
		end
		if touching?(@left_paddle, @ball)
			@left_score.unlock
			@right_score.lock
			@ball.bounce
		end
		if @ball.hit_left_wall
			@right_score.increase
			@left_score.unlock
			@right_score.lock
		end

		if @ball.hit_right_wall
			@left_score.increase
			@right_score.unlock
			@left_score.lock
		end
	end

	def draw
		@ball.draw
		@left_paddle.draw
		@right_paddle.draw
		@right_score.draw
		@left_score.draw
	end
end

window = GameWindow.new
window.show