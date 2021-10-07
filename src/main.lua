require("templates")
require("QOL")
require("objects")

--Read readme.md before doing anything
local str = "F"
local i = 0
local sigmaTime = 0 
local debugVar
--
local text = ""
local textLine1 = {}
local textLine2 = {}
local textLine3 = {}
local textLine4 = {}
local textLines = {}
local textLineNum = 0
--
local heldKeys = {}
--



--Handles the initialization stuff; mostly file stream reading
function love.load() 
--    imageTest = love.graphics.newImage("images/test.png")
    
    initialize(textLine1, textLineTemplate)
    initialize(textLine2, textLineTemplate)
    initialize(textLine3, textLineTemplate)
    initialize(textLine4, textLineTemplate)
    
end

--Better for updates cause not just called every tick, we know time between ticks
function love.update(deltaTime)

end

function love.textinput(t)
    textLine1:add(t)
end

--Check for function characters like backspace, 
function love.keypressed(key, scanCode, isHeld) --IsHeld does not work as expected
    heldKeys [length(heldKeys) + 1] = key

    if key == "backspace" then
        textLine1:backspace()
    end

    if key == "return" then 
        textLine1:add("\n")  --Add 1 cause lua sucks
    end
    
end

--Removes key from heldKeys index
function love.keyreleased(key) 
    remove(heldKeys,key)
end

--Called every tick, automatic heap and canvas clearing
function love.draw()
    --Text Analysis

    debugVar = dump(split(textLine1.text, "+"))
    textLine4.text  = split(textLine1.text,"+")[1] + split(textLine1.text,"+")[2]

    --
    textLine2.text = dump(heldKeys)
    textLine3.text = debugVar
    
    love.graphics.printf(textLine1.text, 0, 0, love.graphics.getWidth())
    love.graphics.printf(textLine2.text,0,100,love.graphics.getWidth())
    love.graphics.printf(textLine3.text, 0, 200 , love.graphics.getWidth())
    love.graphics.printf(textLine4.text, 0, 300 , love.graphics.getWidth())
end

