Class = require("libs.class")

Slab = require("libs.Slab.Slab")
require("src.MainScreen")

WINDOW_WIDTH = 1920
WINDOW_HEIGHT = 1080

function love.keyboard.wasPressed(key)
	return love.keyboard.keyspressed[key]
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	love.keyboard.keyspressed[key] = true
end

--function love.resize(w, h) end

function love.load(args)
	love.window.setTitle("Xenon")

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		resizable = false,
		fullscreen = false,
		vsync = true,
	})

	Fonts = {
		["regular"] = love.graphics.newFont("fonts/JetBrainsMono-Regular.ttf", 32),
	}

	Slab.Initialize(args)
	MainScreen:load()

	love.keyboard.keyspressed = {}
end

function love.update(dt)
	Slab.Update(dt)
	MainScreen:update(dt)
	love.keyboard.keyspressed = {}
end

function love.draw()
	Slab.Draw()
	MainScreen:render()
end
