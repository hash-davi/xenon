Collection = Class({})

function Collection:load(info)
	self.gap = 8
	self.x = info.width / 8 - self.gap
	self.y = 240

	self.items = {}
	for i = 1, 9 do
		table.insert(self.items, i)
	end
end

function Collection:render()
	for i, item in pairs(self.items) do
		local j = math.floor((i - 1) / 6)
		love.graphics.rectangle(
			"line",
			self.x + ((i - 1) % 6) * (self.x + self.gap * 2),
			self.y + j * (400 + self.gap),
			self.x,
			400 - self.gap
		)
		-- love.graphics.printf(
		-- 	tostring(i),
		-- 	self.x + ((i - 1) % 6) * (self.x + self.gap * 2),
		-- 	self.y + j * (400 + self.gap),
		-- 	400,
		-- 	"center"
		-- )
		-- love.graphics.printf(
		-- 	tostring(j),
		-- 	self.x + ((i - 1) % 6) * (self.x + self.gap * 2),
		-- 	self.y + 36 + j * (400 + self.gap),
		-- 	400,
		-- 	"center"
		-- )
	end
end
