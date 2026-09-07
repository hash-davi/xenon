Header = Class({})

function Header:load()
	self.x = 0
	self.y = 0
	self.width = WINDOW_WIDTH
	self.height = self.y + 92
end

function Header:render()
	self:debug()

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setFont(Fonts["regular"])
	love.graphics.printf("My library", self.width / 4, self.y + 32, self.width / 2, "center")
	love.graphics.line(self.width / 2 - 128, self.height, self.width / 2 + 128, self.height)
end

function Header:debug()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.line(0, 0, 0, self.height)
	love.graphics.line(0, 0, self.width, 0)
	love.graphics.line(self.width, 0, self.width, self.height)
	love.graphics.line(self.width, self.height, 0, self.height)
end
