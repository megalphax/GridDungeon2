selector = {}

function selector.load()
	char0 = love.graphics.newImage("img/char_0.png")
	char1 = love.graphics.newImage("img/char_2.png")
	char2 = love.graphics.newImage("img/char_1.png")
	midle = char0:getHeight()/2
end

selector.img = love.graphics.newImage("img/selector.png")

selector.y = (7*(48+5))/2 + 70

selector.pos = {}
selector.pos[1] = ((9*(48+5))/3) - 30
selector.pos[2] = (9*(48+5))/2, (9*(48+5))/2
selector.pos[3] = ((9*(48+5))-(9*(48+5))/3)+30
selector.currentPos = selector.pos[2]

function selector.update()
 
end

function selector.draw()
	love.graphics.print("CHOOSE YOUR CHARACTER", 40, 10, 0, 0.7, 0.7)
	love.graphics.print("PRESS 'SPACE' TO CONFIRM", 20, (7*(48+5)) - 60, 0, 0.8, 0.8 )
	love.graphics.draw(char1, selector.pos[2], (7*(48+5))/2, 0, 2, 2, midle, midle)
	love.graphics.draw(char0, selector.pos[1], (7*(48+5))/2, 0, 2, 2, midle, midle)
	love.graphics.draw(char2, selector.pos[3], (7*(48+5))/2, 0, 2, 2, midle, midle)

	love.graphics.draw(selector.img, selector.currentPos, selector.y, 0, 1.2, 1.2, midle, midle)
end

function selector.keypressed(key)
	if key == "space" then

		changeScene(game)

		if selector.currentPos == selector.pos[1] then
			player.img = char0
		elseif selector.currentPos == selector.pos[2] then
			player.img = char1
		elseif selector.currentPos == selector.pos[3] then
			player.img = char2
		end

	end

	if key == "right" then
		if selector.currentPos == selector.pos[1] then
			selector.currentPos = selector.pos[2]
		elseif selector.currentPos == selector.pos[2] then
			selector.currentPos = selector.pos[3]
		elseif selector.currentPos == selector.pos[3] then
			selector.currentPos = selector.pos[1]
		end
	end

	if key == "left" then
		if selector.currentPos == selector.pos[1] then
			selector.currentPos = selector.pos[3]
		elseif selector.currentPos == selector.pos[2] then
			selector.currentPos = selector.pos[1]
		elseif selector.currentPos == selector.pos[3] then
			selector.currentPos = selector.pos[2]
		end
	end

	if key == "escape" then
    	if fs == true then fs = false else fs = true end
		love.window.setFullscreen(fs)
    end
end