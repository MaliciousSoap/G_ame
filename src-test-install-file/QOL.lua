

-- function sleep(n)
--     if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
--   end
--does not work as expected

function setSelf(table) 
    table.__index = table
end