require("templates")
require("QOL")

--Read readme.md before doing anything
local str
local i


--Handles the initialization stuff like initial file stream readin 
function love.load() 
    str = "F"
    i = 0
    imageTest = love.graphics.newImage("images/test.png")
end


--Called every tick, automatic heap clearing
function love.draw()
    love.graphics.draw(imageTest)
end

