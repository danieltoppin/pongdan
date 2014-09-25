require 'rubygems'
require 'gosu'
Dir["./lib/*.rb"].each {|file| require file}

class GameWindow < Gosu::Window
	def initialize
		super 800, 600, false
		self.caption = 'Pong Game'
		@ball = Ball.new(self)
	end

	def draw
		@ball.draw
	end
	
end
window = GameWindow.new
window.show