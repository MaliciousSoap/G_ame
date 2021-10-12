Run this file from main.lua with Alt+L 
    -> Need Love2d Installed. <https://love2d.org/>
    -> Might also need Love2d Support Extension. <pixelbyte-studios.pixelbyte-love2d>
    -> Shortcut Extension: Love Launcher Handles That. <janw.love-launcher>

    ->Love2d installer can be found in G_ame/LOVE/

Love2d General docs:
    love.graphics.draw(
        image,
        x,
        y,
        r,
        sx,
        sy
    )
    set the keys to nil to remove them from table


important code that I removed
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