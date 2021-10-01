local escape_pattern = function(text)
    return text:gsub('([^%w])', '%%%1')
end

return { escape_pattern = escape_pattern }
