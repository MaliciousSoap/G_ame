require("QOL")
--

coordinateTemplate = {}
coordinateTemplate.y = 0
coordinateTemplate.x = 0
setSelf(coordinateTemplate)  -- Because Lua is dumb that's why

imageTemplate = {}

objectTemplate = {}
setmetatable(objectTemplate,coordinateTemplate)
objectTemplate.sy = 1
objectTemplate.sx = 1
setSelf(objectTemplate)