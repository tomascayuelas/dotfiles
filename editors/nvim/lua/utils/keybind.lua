local Keybind = {}

Keybind.add_global_keybinds = function(keybinds)
    for _, keybind in pairs(keybinds) do
        keybind[4] = keybind[4] or {}

        vim.api.nvim_set_keymap(keybind[1], keybind[2], keybind[3], keybind[4])
    end
end

Keybind.add_buffer_keybinds = function(keybinds)
    for _, keybind in pairs(keybinds) do
        keybind[5] = keybind[5] or {}

        vim.api.nvim_buf_set_keymap(keybind[1], keybind[2], keybind[3], keybind[4], keybind[5])
    end
end

Keybind.remove_global_keybinds = function(keybinds)
    for _, keybind in pairs(keybinds) do
        vim.api.nvim_del_keymap(keybind[1], keybind[2])
    end
end

Keybind.get_lua_cmd_string = function(cmd)
    return '<cmd>lua ' .. cmd .. '<CR>'
end

Keybind.get_cmd_string = function(cmd)
    return '<cmd>' .. cmd .. '<cr>'
end

Keybind.get_normal_cmd_string = function(cmd)
    return '<esc>' .. cmd
end

Keybind.g = Keybind.add_global_keybinds
Keybind.b = Keybind.add_buffer_keybinds
Keybind.ug = Keybind.remove_global_keybinds
Keybind.luaCmd = Keybind.get_lua_cmd_string
Keybind.cmd = Keybind.get_cmd_string
Keybind.normalCmd = Keybind.get_normal_cmd_string

return Keybind
