local Random = require('nvim.newutil.random')

Global = {}

function Global:save(key, value)
    if not value then
        value = key
        key = Random:get_random_int()
    end

    self[key] = value

    return key
end

function Global:get(key)
    return self[key]
end
