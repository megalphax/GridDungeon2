--main.lua
--author megalphax

require("gameover")
require("selector")
require("game")
require("menu")
require("win")

CurrentScene = nil

function love.load()
	prestige = 0
	s = 9*(48+5)
	love.math.setRandomSeed(os.time())
    love.window.setTitle("Grid Dungeon")
    font = love.graphics.newFont("img/font.TTF", 32)
    love.window.setMode(s, s)
    fs = false

    changeScene(menu)
end

function changeScene(scene)
	CurrentScene = scene 
	CurrentScene.load()
end

function love.update(dt)
	CurrentScene.update(dt)
end

function love.draw()

	love.graphics.setBackgroundColor(47/255,79/255,79/255)
	love.graphics.setFont(font)
	CurrentScene.draw()

end

function love.keypressed(key)
	CurrentScene.keypressed(key)

	if key == "escape" then
    	if fs == true then fs = false else fs = true end
		love.window.setFullscreen(fs)
    end

end