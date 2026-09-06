Class = require("libs.class")
require("MainScreen")

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.load()
	love.window.setTitle("Xenon")

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		resizable = true,
		fullscreen = false,
		vsync = true,
	})
end

function love.update(dt) end

function love.draw()
	MainScreen:render()
end
