require("templates")
require("QOL")

--Read readme.md before doing anything
local str
local i
local amongus

--Handles the initialization stuff like initial file stream readin 
function love.load() 
    str = "F"
    i = 0
    amongus = love.graphics.newImage("among-us-logo.png")
end


--Called every tick, automatic heap clearing
function love.draw()
    coord1 =  {x = 1}
    setmetatable (coord1, coordinateTemplate)
    coord1.__index = coordinateTemplate

    

    
    i = i + 0.0001
    local i_temp = (1+i)*(1000*i)
    --love.graphics.circle("fill", 10, 10, 1+i)
    love.graphics.draw(
        amongus,
        0-i_temp, --X
        0, --Y
        0,  --Rotation
        0.1 + i ,  --Scale X
        0.2 -i        --Scale Y
    )

    love.graphics.print("X_Coord:" .. 0 - i_temp , 0, 0)
end

