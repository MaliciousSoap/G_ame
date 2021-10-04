require("templates")
require("QOL")
require("objects")

--Read readme.md before doing anything
local str = "F"
local i = 0
local sigmaTime = 0 
local text = ""
local text2 = {}
--



--Handles the initialization stuff; mostly file stream reading
function love.load() 
--    imageTest = love.graphics.newImage("images/test.png")
setmetatable(text2,textLineTemplate)
setSelf(text2)
end

--Better for updates cause not just called every tick, we know time between ticks
function love.update(deltaTime)

end

function love.textinput(t)
    text2.text = text2.text .. t
end

--Check for function characters like backspace
function love.keypressed(key) 
    if key == "backspace" then
        text2.backspace(text2.text)
    end
    if key == "enter" then 
    end
end

--Called every tick, automatic heap and canvas clearing
function love.draw()


    
    love.graphics.printf(text2.text, 0, 0, love.graphics.getWidth())
end

