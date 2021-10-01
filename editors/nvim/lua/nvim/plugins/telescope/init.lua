require 'telescope'.setup()
require 'telescope'.load_extension('fzf')

local Shortcut = require 'nvim.newutil.keymap'
local l = Keybind.get_lua_cmd_string

local builtin = function(function_name)
    local cmd = 'require"telescope.builtin".' .. function_name
    return l(cmd)
end

Shortcut:mode('n'):options():noremap():next():keymaps({
        ----------------------------------------------------------------------
        --                          FILES & BUFFER                          --
        ----------------------------------------------------------------------
        -- find a file in current working directory
        { '<leader>t', builtin 'find_files()' },

        -- find line in current working directory
        { '<leader>s', builtin 'live_grep()' },

        -- resumes the previous search
        { '<leader>r', builtin 'resume()' },

        -- find buffer
        { '<leader>p', builtin 'buffers()' },

        -- find line in current buffer
        { '<leader>f', builtin 'current_buffer_fuzzy_find()' },

        -- find word under the cursor in current buffer
        { '<leader>*', builtin 'grep_string()' },

        -- find help index
        { '<leader>x', builtin 'help_tags()' },

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------
        -- find references of word under the cursor
        { '<leader>o', builtin 'lsp_references()' },

        -- find diagnostics in the file
        { '<leader>d', builtin 'lsp_document_diagnostics()' },

        -- show code actions
        { '<leader>a', builtin 'lsp_range_code_actions()' },

        -- browse code definition
        { '<leader>c', builtin 'lsp_definitions()' },

        -- browse code implementation
        { '<leader>m', builtin 'lsp_implementations()' },
})

Shortcut:mode('i'):options():noremap():next():keymaps(
    {
        -- find register by containing value
        { '<c-r>', builtin 'registers()' },
    })

