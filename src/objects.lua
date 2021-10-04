require("QOL")
require("Templates")

player = {
    
}
player.speed = 5
player.health = 100
setmetatable(player, objectTemplate)
setSelf(player)