game = {}

function game.load()
    MAXRANDOM = 5
    loadClearObjects()
    setArrow()
    --rObjects()
    initPlayer()
    loadClearMap()
    debugmode = true
end

WALL_ID = 8

tileFloor= {}
tileFloor[1] = love.graphics.newImage("img/tile_0.png")
tileFloor[2] = love.graphics.newImage("img/redCase.png")
tileFloor[3] = love.graphics.newImage("img/blueCase.png")

tile = {}
tile[2] = love.graphics.newImage("img/goblin.png")
tile[3] = love.graphics.newImage("img/sword2.png")
tile[4] = love.graphics.newImage("img/shield.png")
tile[5] = love.graphics.newImage("img/healthPotion2.png")
tile[6] = love.graphics.newImage("img/coin.png")
tile[7] = love.graphics.newImage("img/spike.png")
tile[WALL_ID] = love.graphics.newImage("img/wall.png")
tile[21] = love.graphics.newImage("img/arrow_0.png")
tile[22] = love.graphics.newImage("img/arrow_1.png")
tile[23] = love.graphics.newImage("img/arrow_2.png")
tile[24] = love.graphics.newImage("img/arrow_3.png")

function loadClearMap()
	map = {}
	map =
	{  
		{0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,1,0,0,0,0},
	    {0,0,1,1,1,1,1,0,0},
	    {0,0,1,1,1,1,1,0,0},
	    {0,1,1,1,1,1,1,1,0},
	    {0,0,1,1,1,1,1,0,0},
	    {0,0,1,1,1,1,1,0,0},
	    {0,0,0,0,1,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0}
	}
end
loadClearMap()

function loadClearObjects()
	objects = {}
	objects = 
	{  
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0},
	    {0,0,0,0,0,0,0,0,0}
	}
end
loadClearObjects()

function r(i)
	local r = love.math.random(-MAXRANDOM,MAXRANDOM + prestige)
	if i == 0 then
		if r == WALL_ID then return 7 else return r end
	elseif i == 1 then
		return r
	end
end

function setArrow()
	objects[2][5] = 21
	objects[5][8] = 22
	objects[5][2] = 23
	objects[8][5] = 24

	objects[player.l][player.c] = 0
end

function rObjects()
	objects = 
	{
		{0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0},
		{0,0,r(0),r(0),0,r(0),r(0),0,0},
		{0,0,r(0),r(1),r(1),r(1),r(0),0,0},
		{0,0,0,r(1),r(1),r(1),0,0,0},
		{0,0,r(0),r(1),r(1),r(1),r(0),0,0},
		{0,0,r(0),r(0),0,r(0),r(0),0,0},
		{0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0}
	}

	setArrow()

	print("randomize objects...")
end

function initPlayer()
	player = {}
	 
	player.l = 5
	player.c = 5
	player.img = love.graphics.newImage("img/char_2.png")
	player.life = 10
	player.maxLife = 20
	player.shield = 0
	player.maxShield = 3
	player.sword = 0
	player.maxSword = 3
	player.level = 0

	function player.move(key)
 
    if key == "up" then
        local id = map[player.l-1][player.c]
        if id ~= 0 then
        	if objects[player.l - 1][player.c] ~= WALL_ID then
            	player.l = player.l - 1
            end
        end
    end
 
  	if key == "down" then
        local id = map[player.l+1][player.c]
        if id ~= 0 then
        	if objects[player.l + 1][player.c] ~= WALL_ID then
            	player.l = player.l + 1
            end
        end
   	end

   	if key == "left" then
        local id = map[player.l][player.c-1]
        if id ~= 0 then
        	if objects[player.l][player.c-1] ~= WALL_ID then
            	player.c = player.c - 1
            end
        end
    end
 
  	if key == "right" then
        local id = map[player.l][player.c+1]
        if id ~= 0 then
        	if objects[player.l][player.c+1] ~= WALL_ID then
            	player.c = player.c + 1
            end
        end
   	end

   	loadClearMap()
   	checkObjects()
 
	end

end

initPlayer()
 
function drawmap()
    local c, l
    for l = 1, 9 do
        for c = 1, 9 do
            local id = map[l][c]
           
            if id ~= 0 then
        		love.graphics.draw(tileFloor[id], (c-1)*(48+5), (l-1)*(48+5))
            end
        end
    end
end

function drawobjects()
    local c, l
    for l = 1, 9 do
        for c = 1, 9 do
            local id = objects[l][c]
           
            if id >= 2 then
            	if id == 3 or id == 5 or id == 2 or id == 4 or id == 6 then 
            		love.graphics.draw(tile[id], (c-1)*(48+5) +5, (l-1)*(48+5) +5, 0, 0.095, 0.095)
            	else
        			love.graphics.draw(tile[id], (c-1)*(48+5), (l-1)*(48+5))
        		end
            end
        end
    end
end

function checkObjects()
	-- life potion
	if objects[player.l][player.c] == 5 then
		player.life = player.life + 2
	end
	-- mob1
	if objects[player.l][player.c] == 2 then
		if player.sword == 0 then
			player.life = player.life - 5
			map[player.l][player.c] = 2
		else
			player.sword = player.sword - 1
			map[player.l][player.c] = 3
		end
		player.level = player.level + 1
	end
	-- shield
	if objects[player.l][player.c] == 4 then
		player.shield = player.shield + 1
	end
	-- sword
	if objects[player.l][player.c] == 3 then
		player.sword = player.sword + 1
	end
	-- spike
	if objects[player.l][player.c] == 7 then
		player.life = player.life - 1
		map[player.l][player.c] = 2
	end

	-- coins
	if objects[player.l][player.c] == 6 then
		player.level = player.level + 1
	end

	-- arrow
	if objects[player.l][player.c] == 21 then
		player.l = 8
		player.c = 5
		player.level = player.level + 1
		rObjects()
	end

	if objects[player.l][player.c] == 22 then
		player.l = 5
		player.c = 2
		player.level = player.level + 1
		rObjects()
	end

	if objects[player.l][player.c] == 23 then
		player.l = 5
		player.c = 8
		player.level = player.level + 1
		rObjects()
	end

	if objects[player.l][player.c] == 24 then
		player.l = 2
		player.c = 5
		player.level = player.level + 1
		rObjects()
	end

	if checkEnemy() then
		if player.shield == 0 then
			player.life = player.life - 3
			map[player.l][player.c] = 2
		else
			player.shield = player.shield - 1
			map[player.l][player.c] = 3
		end
	end

	objects[player.l][player.c] = 0
	if player.life > player.maxLife then player.life = player.maxLife end
	if player.shield > player.maxShield then player.shield = player.maxShield end
	if player.sword > player.maxSword then player.sword = player.maxSword end

	if player.life <= 0 then changeScene(gameOver) end

	if player.level >= 100 then prestige = prestige + 1; changeScene(win) end
end

function checkEnemy()
	if objects[player.l + 1][player.c] == 2 or
	 objects[player.l - 1][player.c] == 2 or
	 objects[player.l][player.c + 1] == 2 or
	 objects[player.l][player.c - 1] == 2 then
	 return true else
	 return false end
end
 
function game.update(dt)
 
end
 
function game.draw()
    love.graphics.setBackgroundColor(47/255,79/255,79/255)
    drawmap()
    drawobjects()
	love.graphics.draw(player.img, (player.c-1) *(48+5) + 4, (player.l-1) *(48+5) +5, 0, 0.1, 0.09)
	-----------------------------------------------
	--love.graphics.draw(tile[5], 1,1, 0, 0.6,0.6)
	love.graphics.draw(tile[5], 1,0, 0, 0.075)
	-----------------------------------------------
	love.graphics.print(player.life.."/"..player.maxLife, 40,1)
	love.graphics.draw(tile[4], 1,40, 0, 0.075,0.075)
	love.graphics.print(player.shield.."/"..player.maxShield, 40,40)
	---------------------------------------
	--love.graphics.draw(tile[3], 1,81, 0, 0.6,0.6)
	love.graphics.draw(tile[3], 1,77, 0, 0.075)
	---------------------------------------
	love.graphics.print(player.sword.."/"..player.maxSword, 40,80)
	love.graphics.print("LEVEL : "..player.level, 5, 425)
end
 
function game.keypressed(key)
    player.move(key) 
    --if key == "r" then
    --	rObjects()
    --end
    print(key)

    if debugmode then

    	if key == "kp1" then
    		player.life = 20
    		player.sword = 3
    		player.shield = 3
    	end

    	if key == "kp2" then
    		player.maxLife = 99999
    		player.life = 99999
    	end

    	if key == "kp3" then
    		player.level = player.level + 15
    	end

    	if key == "kp5" then
    		print("prestige : ".. prestige)
    	end

    end
end
