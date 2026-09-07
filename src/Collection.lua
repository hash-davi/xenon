Collection = Class({})

function math.gcd(a, b)
	if b == 0 then
		return a
	else
		return math.gcd(b, a % b)
	end
end

function Collection:load(info)
	self.gap = 16
	self.x = info.width / 8 -- self.gap
	self.y = 240
	self.width = (6 * info.width) / 8
	self.height = info.height - self.y

	self.items = {}
	for i = 1, 17 do
		table.insert(self.items, i)
	end
end

function Collection:render()
	self:debug()

	local n = math.gcd(self.width, self.gap)
	local l = (self.width - self.gap * (n - 1)) / n

	for i, item in pairs(self.items) do
		local j = math.floor((i - 1) / n)
		love.graphics.rectangle(
			"line",
			self.x + ((i - 1) % n) * (l + self.gap),
			self.y + j * (400 + self.gap),
			l,
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

function Collection:debug()
	love.graphics.setColor(0, 0, 1, 1)
	love.graphics.line(self.x, self.y, self.x, self.y + self.height) -- Top-left to Bottom-left
	love.graphics.line(self.x, self.y, self.x + self.width, self.y) -- Top-left to Top-right
	love.graphics.line(self.x + self.width, self.y, self.x + self.width, self.y + self.height) -- Top-right to Bottom-right
	love.graphics.line(self.x + self.width, self.y + self.height, self.x, self.y + self.height) -- Bottom-right to Bottom-left
end
