MainScreen = Class({})

require("Header")
require("Collection")

function MainScreen:load()
	self.x = 0
	self.y = 0
	self.width = WINDOW_WIDTH
	self.height = WINDOW_HEIGHT

	Header:load()
	Collection:load({ width = self.width })
end

function MainScreen:render()
	love.graphics.clear(0, 0, 0, 0)

	MainScreen:debug()

	Header:render()

	Collection:render()
end

function MainScreen:debug()
	love.graphics.setColor(0, 1, 0, 1)
	love.graphics.line(0, 0, 0, self.height)
	love.graphics.line(0, 0, self.width, 0)
	love.graphics.line(self.width, 0, self.width, self.height)
	love.graphics.line(self.width, self.height, 0, self.height)
end
