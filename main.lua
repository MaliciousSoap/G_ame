local str
love = require('love')


--Handles the initialization stuff like initial file stream readin 
function love.load() 
    str = "H"
end


--Called every tick
function love.draw()
    
    love.graphics.print(str, 0, 0)
    str = str .. "E"

end

