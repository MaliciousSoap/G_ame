require("templates")
require("QOL")

--Read readme.md before doing anything
local str = "F"
local i = 0
local sigmaTime = 0 


--Handles the initialization stuff; mostly file stream reading
function love.load() 
    imageTest = love.graphics.newImage("images/test.png")
end

--Better for updates cause not just called every tick, we know time between ticks
function love.update(deltaTime)

end

--Called every tick, automatic heap clearing
function love.draw()
    if love.keyboard.isDown("down") then   -- reduce the value
        
        love.graphics.draw(imageTest)
    end
end

