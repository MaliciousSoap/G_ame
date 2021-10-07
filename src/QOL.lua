

-- function sleep(n)
--     if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
--   end
--does not work as expected

--sets table index to itself, I refuse to explain this redundancy
function setSelf(table) 
    table.__index = table
end

--returns length of table
function length(T) -- Can be replaced by # operator
    local count = 0
    for uselessVar in pairs(T) do count = count + 1 end
    return count
end

--Sets string in table to nil, effectively removing it
function remove(tbl, string)
    
    for index in pairs(tbl) do
        if string  == tbl[index] then
            tbl[index] = nil
        end
    end

end

--combines metatable and set self
function initialize(ta_ble, metata_ble) 
    setmetatable(ta_ble, metata_ble)
    setSelf(ta_ble)
end



--Unknown 

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

 function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end