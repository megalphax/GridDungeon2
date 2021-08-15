--win.lua

win = {}

function win.load()

end

function win.update()

end

function win.draw()
	love.graphics.print("YOU ARE LEVEL 100 !!!", 60, 1, 0, 0.8, 0.8)
	love.graphics.print("AND YOU.....", 30, 50, 0, 0.8, 0.8)
	love.graphics.print("ARE", 20, 80, 0, 0.6, 0.6)
	love.graphics.print("NOT THE KING (my bad, srry)", 45, 100, 0, 0.6, 0.6)

	love.graphics.print("PRESS SPACE TO RESTART", 25, 250, 0, 0.8, 0.8)
end

function win.keypressed(key)
	if key == "space" then
		changeScene(menu)
	end
end