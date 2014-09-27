require 'rubygems'
require 'gosu'
Dir["./lib/*.rb"].each {|file| require file}

class GameWindow < Gosu::Window
	attr_accessor :width, :height

	def initialize
		@width = 800
		@height = 600
		super @width, @height, false
		self.caption = 'Pong Game'
		@ball = Ball.new(self)
		@left_paddle = Paddle.new(self, 20) #postion on xaxis
	end

	def draw
		@ball.draw
	end

	def update
		@ball.move
	end
	
end
window = GameWindow.new
window.show