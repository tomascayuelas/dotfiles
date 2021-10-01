local cast = R 'nvim.utils.lua.cast'

local M = {}

function M.starts_with(str, starts_with_str)
    return string.sub(str, 1, string.len(starts_with_str)) == str
end

function M.contains(str, contains_str)
    return cast.toboolean(str:find(contains_str))
end

function M.split(str, separator)
    if separator == nil then separator = '%s' end
    local t = {}
    for match in string.gmatch(str, '([^' .. separator .. ']+)') do
        table.insert(t, match)
    end
    return t
end

return M
