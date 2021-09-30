require("templates")
require("QOL")
require("objects")

--Read readme.md before doing anything
local str = "F"
local i = 0
local sigmaTime = 0 
local text = ""
--



--Handles the initialization stuff; mostly file stream reading
function love.load() 
    imageTest = love.graphics.newImage("images/test.png")
end

--Better for updates cause not just called every tick, we know time between ticks
function love.update(deltaTime)

end

function love.textinput(t)
    text = text .. t
end

--Called every tick, automatic heap and canvas clearing
function love.draw()


    -- Player WASD and Arrow Movement
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then   -- reduce the value
        player.y = player.y + player.speed
    end 
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a")then
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d")then
        player.x = player.x + player.speed
    end
    --
    love.graphics.draw(
        imageTest,
        player.x,
        player.y,
        player.r,
        player.sx,
        player.sy)
    --
    love.graphics.printf(text, 0, 0, love.graphics.getWidth())
end

