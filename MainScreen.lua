MainScreen = Class({})

function MainScreen:render()
	love.graphics.clear(0, 0, 0, 0)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.printf("Xenon", WINDOW_WIDTH / 4, 200, WINDOW_WIDTH, "center")
end
