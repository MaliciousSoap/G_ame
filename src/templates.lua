require("QOL")
local utf8 = require("utf8")  -- stole this no idea how this works
local byteoffset
--

coordinateTemplate = {
    y = 0,
    x = 0,
}
setSelf(coordinateTemplate)  -- Because Lua is dumb that's why

imageTemplate = {}

objectTemplate = {
    sy = 1,
    sx = 1
}
setmetatable(objectTemplate,coordinateTemplate)
setSelf(objectTemplate)

--Because backspace is a method as opposed to a function, when calling
--refer to it by saying <table>:backspace()
textLineTemplate = {
    text = ""
    backspace = function(self) -- self is not implied
    -- get the byte offset to the last UTF-8 character in the string.
        byteoffset = utf8.offset(self.text, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            self.text = string.sub(self.text, 1, byteoffset - 1)
        end
    end
}

setSelf(textLineTemplate)