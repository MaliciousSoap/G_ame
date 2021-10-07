

-- function sleep(n)
--     if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
--   end
--does not work as expected

function setSelf(table) 
    table.__index = table
end

function length(T)
    local count = 0
    for uselessVar in pairs(T) do count = count + 1 end
    return count
end

function remove(tbl, string)
    
    for index in pairs(tbl) do
        if string  == tbl[index] then
            tbl[index] = nil
        end
    end

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