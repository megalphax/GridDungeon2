gameOver = {}

function gameOver.load()
	IMGdead = love.graphics.newImage("img/dead.png")
end

function gameOver.update()

end

function gameOver.draw()
	love.graphics.print("YOU ARE DEAD LOL.", 5, 1)
	love.graphics.print("YOU WERE LEVEL : "..player.level..".", 5, 40)
	love.graphics.print("PRESS 'SPACE' TO CONTINUE", 5, 310, 0, 0.8, 0.8)
	love.graphics.draw(IMGdead, 371/2, 371/2, 0, 2, 2, IMGdead:getHeight()/2, IMGdead:getWidth()/2)
end

function gameOver.keypressed(key)
	if key == "space" then
		changeScene(menu)
	end
end