Header = Class({})

function Header:load()
	self.x = 0
	self.y = 0
	self.width = WINDOW_WIDTH
	self.height = WINDOW_HEIGHT
end

function Header:render()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setFont(Fonts["regular"])
	love.graphics.printf("My library", self.width / 4, self.y + 32, self.width / 2, "center")
	love.graphics.line(self.width / 2 - 128, self.y + 92, self.width / 2 + 128, self.y + 92)
end
