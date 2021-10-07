require("templates")
require("QOL")
require("objects")
require("io")

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
local cmd


--Handles the initialization stuff; mostly file stream reading
function love.load() 
--    imageTest = love.graphics.newImage("images/test.png")
    
    initialize(textLine1, textLineTemplate)
    initialize(textLine2, textLineTemplate)
    initialize(textLine3, textLineTemplate)
    initialize(textLine4, textLineTemplate)
   
    cmd = io.open("cmd.txt")
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
    local splitOne = split(textLine1.text, "+")
    --Text Analysis

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


    if ((heldKeys[1] == "lctrl" or heldKeys[1] == "rctrl") and heldKeys[2] == "backspace") then
        textLine1.text = nil 
    end

    
    love.graphics.printf("Input: "..textLine1.text, 0, 0, love.graphics.getWidth())
    love.graphics.printf("Held Keys: "..textLine2.text,0,100,love.graphics.getWidth())
    love.graphics.printf("Split Input: "..textLine3.text, 0, 200 , love.graphics.getWidth())
    love.graphics.printf("Output: "..textLine4.text, 0, 300 , love.graphics.getWidth())
    love.graphics.printf(cmd:read("*all"), 0, 400, love.graphics.getWidth())
end

