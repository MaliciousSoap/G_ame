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
local backspaceHeldTicks = 0 


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
    if key == "backspace" then
        backspaceHeldTicks = 0
    end
end

--Called every tick, automatic heap and canvas clearing
function love.draw()
    --If Backspace held then go fast backspace
    if (has(heldKeys, "backspace")) then
        backspaceHeldTicks = backspaceHeldTicks + 1
        if backspaceHeldTicks > 20 then
            textLine1:backspace()
        end
    end





    local splitOne = split(textLine1.text, "+")
   
    --Debugging Split Input as Dump
    debugVar = dump(splitOne)
    --
    if nilCheck(splitOne) then
        local sum = 0
        --textLine4.text = "it worked" --  = 
        for counter = 1, #splitOne do
            sum = tonumber(splitOne[counter]) + sum

        end
        textLine4.text = sum
    else
       -- textLine4.text = "Error"
    end
   
    --
    textLine2.text = dump(heldKeys)
    textLine3.text = debugVar
    
    love.graphics.printf("Input: "..textLine1.text, 0, 0, love.graphics.getWidth())
    love.graphics.printf("Held Keys: "..textLine2.text,0,100,love.graphics.getWidth())
    love.graphics.printf("Split Input: "..textLine3.text, 0, 200 , love.graphics.getWidth())
    love.graphics.printf("Output: "..textLine4.text, 0, 300 , love.graphics.getWidth())
end

