local Shortcut = require 'nvim.newutil.keymap'
local l = require 'nvim.utils.keybind'.get_lua_cmd_string
local c = require 'nvim.utils.keybind'.get_cmd_string
local n = require 'nvim.utils.keybind'.get_normal_cmd_string

---------------------------------------
--            CURSOR MODE
---------------------------------------
Shortcut:mode(''):options():noremap():next():keymaps(
    {
        -- Cursor Mode
        { 'j', 'h' },
        { 'k', 'j' },
        { 'l', 'k' },
        { ';', 'l' },
    })

--------------------------------------
--            NORMAL MODE
--------------------------------------
Shortcut:mode('n'):options():noremap():next():keymaps(
    {
        -- reload nvim configuration file
        { ',r', l 'R"nvim.utils.common.module".reload_package("nvim")' },

        -- move cursor to left/down/up/right window
        { '<leader>j', '<c-w>h' },
        { '<leader>k', '<c-w>j' },
        { '<leader>l', '<c-w>k' },
        { '<leader>;', '<c-w>l' },

        -- move to last cursor position in the jump list
        { [['']], '``' },

        -- to go to the start of the line
        { '0', '^' },

        -- centering the cursor after action
        { '{', '{zz' },
        { '}', '}zz' },

        -- jump to next matching char in the same line
        { '<leader>;', ';' },

        -- save the current buffer
        { '<leader>l', c 'w' },

        -- close the window
        { '<leader>q', c 'q' },

        -- open the file under the cursor in a split or selected window
        {
            'gf',
            function()
                require 'nvim.utils.nvim.file'.open_file_under_cursor()
            end,
        },

        -- open the file under the cursor in the same window
        { 'gF', 'gf' },

        -- copy until the end of the line
        { 'Y', 'y$' },

        -- copy current line and paste next line
        { '<leader>y', 'yyp' },

        -- indent left
        { '<', '<<' },

        -- indent right
        { '>', '>>' },

        -- to go enable spell checker
        { '<F6>', c 'setlocal spell! spelllang=en_us' },
    })


---------------------------------------
--            INSERT MODE
---------------------------------------
Shortcut:mode('i'):options():noremap():next():keymaps({
        -- put a semicolon EOL and go to next line
        { '<c-;>', n'A;' },

        -- add new line in insert mode
        { '<c-o>', n'o' },

        -- go to end of the line
        { '<c-e>', n'A' },

        -- go to beginning of the line
        { '<c-a>', n'I' },

        -- copy current line and paste next line
        { '<c-y>', n'yyp' },
})

---------------------------------------
--            VISUAL MODE
---------------------------------------
Shortcut:mode('x'):options():noremap():next():keymaps(
    {
        -- down arrow key
        { 'n', 'j' },

        -- up arrow key
        { 'e', 'k' },

        -- right arrow key
        { 'i', 'l' },

        -- word end
        { 'l', 'e' },
    })
