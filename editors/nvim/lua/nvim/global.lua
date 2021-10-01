G = {}
---@diagnostic disable-next-line: undefined-global
V = vim
API = V.api
FN = V.fn
LSP = V.lsp
CMD = V.cmd

Option = require 'nvim.utils.option'
Variable = require 'nvim.utils.variable'
Keybind = require 'nvim.utils.keybind'
Command = require 'nvim.utils.command'
Editor = require 'nvim.utils.editor'
Pum = require 'nvim.utils.pum'
Log = require 'nvim.utils.common.log'
