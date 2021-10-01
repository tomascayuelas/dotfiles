local validation = R 'nvim.utils.rusty.validation'

local e = API.nvim_eval
local input = API.nvim_input

local Pum = {}

--[[
-- Returns true if popup menu is visible
--]]
Pum.is_visible = function()
    return (e('pumvisible()') > 0)
end

Pum.directions = { next = '<c-n>', prev = '<c-p>' }

Pum.goto_item = function(options)
    local direction = options['direction']
    local keybind = options['keybind']
    local callback = options['callback']

    if (Pum.is_visible()) then
        input(Pum.directions[direction])
        return
    else
        if validation.string(keybind) then
            input(keybind)
        elseif validation.func(callback) then
            callback()
        end
    end
end

Pum.goto_next = function(options)
    options.direction = 'next'
    Pum.goto_item(options)
end

Pum.goto_prev = function(options)
    options.direction = 'prev'
    Pum.goto_item(options)
end

return Pum
