local M = {}

function M.count(list)
    local count = 0

    for _, _ in ipairs(list) do count = count + 1 end

    return count
end

function M.concat(...)
    local args = { ... }

    if V.tbl_count(args) == 0 then error('No values passed') end

    if V.tbl_count(args) < 2 then error('Passed only one parameter') end

    local first = args[1]
    table.remove(args, 1)

    for _, tbl in ipairs(args) do
        for _, value in ipairs(tbl) do table.insert(first, value) end
    end

    return first
end

--[[
-- Returns true if there are any matching values
--
-- @param list { Array } list to find the value
-- @param filter_function { Function } match function
--]]
function M.any(list, match_function)
    for _, i in ipairs(list) do if match_function(i) then return true end end

    return false
end

return M
