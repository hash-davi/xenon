Class = require("libs.class")
require("MainScreen")

WINDOW_WIDTH = 1920
WINDOW_HEIGHT = 1080

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

--function love.resize(w, h) end

function love.load()
	love.window.setTitle("Xenon")

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		resizable = false,
		fullscreen = false,
		vsync = true,
	})

	Fonts = {
		["regular"] = love.graphics.newFont("fonts/JetBrainsMono-Regular.ttf", 32),
	}

	MainScreen:load()
end

function love.update(dt) end

function love.draw()
	MainScreen:render()
end
