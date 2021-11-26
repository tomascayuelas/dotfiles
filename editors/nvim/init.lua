local fn = vim.fn
local f = require("utils")
Variable = require("utils/variable")
Option = require("utils/option")
Keybind = require("utils/keybind")
Shortcut = require("utils/keymap")

-- SETTINGS
require("settings/options")
require("settings/keymaps")

-- PLUGINS
vim.cmd([[packadd packer.nvim]])
require("plugins")

require("settings/commands")

