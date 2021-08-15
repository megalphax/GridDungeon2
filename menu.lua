--menu.lua

menu = {}

function menu.load()
	if key == "escape" then
    	if fs == true then fs = false else fs = true end
		love.window.setFullscreen(fs)
    end
end

function menu.update()

end

function menu.draw()
	love.graphics.print("WELCOME TO THE GRID DUNGEON !", 50, 10, 0, 0.5, 0.7)
	love.graphics.print("REACH THE LEVEL 100 TO WIN", 65, 50, 0, 0.5, 0.7)
	love.graphics.print("AND BECOME THE KING OF THE GRID WORLD", 20, 80, 0, 0.5, 0.5)
	love.graphics.print("(BECAUSE THAT'S F#CKING COOL !)", 85, 100, 0, 0.4, 0.3)

	love.graphics.print("PLAY WITH ARROW KEY", 95, 190, 0, 0.5, 0.7)

	love.graphics.print("PRESS SPACE TO START", 90, 270, 0, 0.5, 0.7)
end

function menu.keypressed(key)
	if key == "space" then
		changeScene(selector)
	end
end