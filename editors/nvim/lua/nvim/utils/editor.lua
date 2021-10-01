local Editor = {}

Editor.get_curr_char = function()
    local byte_index = V.nvim_win_get_cursor(0)[2]
    return V.nvim_get_current_line():sub(byte_index, byte_index)
end

Editor.is_curr_char_space = function()
    return string.find(Editor.get_curr_char(), '%s') ~= nil
end

return Editor
