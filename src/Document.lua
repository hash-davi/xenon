Document = Class({})

function Document:init(info)
	self.x = info.x
	self.y = info.y
	self.width = info.width
	self.height = info.height

	self.visibility = true
	self.id = info.id
end

function Document:render()
	if self.visibility then
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	end
end

function Document:debug() end
