local add_options = function(option_type, id, options)
    if type(id) == 'table' then
        options = id
        id = 0
    end

    if type(options) ~= 'table' then
        error('options should be a type of "table"')
        return
    end

    for key, value in pairs(options) do
        if id == 0 then
            vim[option_type][key] = value
        else
            vim[option_type][id][key] = value
        end
    end
end

Option = {
    GLOBAL_OPTION = "o",
    WINDOW_OPTION = "wo",
    BUFFER_OPTION = "bo"
}

function Option:global(options)
    add_options(self.GLOBAL_OPTION, options)
end

function Option:window(id, options)
    add_options(self.WINDOW_OPTION, id, options)
end

function Option:buffer(id, options)
    add_options(self.BUFFER_OPTION, id, options)
end

return Option
