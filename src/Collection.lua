Collection = Class({})

require("src.Document")

function math.gcd(a, b)
	if b == 0 then
		return a
	else
		return math.gcd(b, a % b)
	end
end

function Collection:load(info)
	self.gap = 6
	self.x = info.width / 8 -- self.gap
	self.y = 240
	self.width = (6 * info.width) / 8
	self.height = info.height - self.y

	ScrollSpeed = 0

	local n = math.gcd(self.width, self.gap)
	local l = (self.width - self.gap * (n - 1)) / n

	self.top = self.y
	self.bottom = 0

	self.items = {}
	for i = 1, 16 do
		local j = math.floor((i - 1) / n)
		table.insert(
			self.items,
			Document({
				x = self.x + ((i - 1) % n) * (l + self.gap),
				y = self.y + j * (400 + self.gap),
				width = l,
				height = 400,
				id = i,
			})
		)
		self.bottom = math.max(self.bottom, self.y + j * (400 + self.gap) + 400)
	end
end

function love.wheelmoved(x, y)
	ScrollSpeed = ScrollSpeed - y * 128
end

function Collection:update(dt)
	Slab.BeginWindow("Collection", {
		X = self.x,
		Y = self.y,
		W = self.width,
		H = self.height,
		Border = 0,
		AllowResize = false,
		AllowMove = false,
		NoSaveSettings = true,
		AutoSizeWindow = false,
		ShowMinimize = false,
		ResetLayout = true,
	})
	Slab.Text("teste")
	-- if #self.items > 0 then
	-- 	for i, doc in pairs(self.items) do
	-- 		doc.y = doc.y - ScrollSpeed * dt
	-- 	end
	--
	-- 	for i, doc in pairs(self.items) do
	-- 		if doc.y + doc.height < self.top then
	-- 			doc.visibility = false
	-- 		else
	-- 			doc.visibility = true
	-- 		end
	-- 	end
	-- end
	--
	-- ScrollSpeed = ScrollSpeed - ScrollSpeed * math.min(dt * 8, 1)
	Slab.EndWindow()
end

function Collection:render()
	self:debug()

	for i, item in pairs(self.items) do
		item:render()
	end
end

function Collection:debug()
	love.graphics.setColor(0, 0, 1, 1)
	love.graphics.line(self.x, self.y, self.x, self.y + self.height) -- Top-left to Bottom-left
	love.graphics.line(self.x, self.y, self.x + self.width, self.y) -- Top-left to Top-right
	love.graphics.line(self.x + self.width, self.y, self.x + self.width, self.y + self.height) -- Top-right to Bottom-right
	love.graphics.line(self.x + self.width, self.y + self.height, self.x, self.y + self.height) -- Bottom-right to Bottom-left
end
