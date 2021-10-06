require("templates")
require("QOL")
require("objects")

--Read readme.md before doing anything
local str = "F"
local i = 0
local sigmaTime = 0 
--
local text = ""
local textLine1 = {}
local textLines = {}
local textLineNum = 0
--



--Handles the initialization stuff; mostly file stream reading
function love.load() 
--    imageTest = love.graphics.newImage("images/test.png")
    setmetatable(textLine1,textLineTemplate)
    setSelf(textLine1)
end

--Better for updates cause not just called every tick, we know time between ticks
function love.update(deltaTime)

end

function love.textinput(t)
    textLine1:add(t)
end

--Check for function characters like backspace
function love.keypressed(key, scanCode, isHeld) 
    if key == "backspace" then
        textLine1:backspace()
        if isHeld then
            while (key == "backspace" and isHeld) do
                love.event.quit()
            end
        end
    end
    if key == "return" then 
        textLine1:add("\n")  --Add 1 cause lua sucks
    end
end

--Called every tick, automatic heap and canvas clearing
function love.draw()


    
    love.graphics.printf(textLine1.text, 0, 0, love.graphics.getWidth())
end

