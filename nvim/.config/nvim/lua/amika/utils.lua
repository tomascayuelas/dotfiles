Utils = {}

Utils.load = function (library)
  local statusOk, libraryLoaded = pcall(require, library)

  if not statusOk then
    return
  end

  return libraryLoaded
end

local function map(mode, shortcut, action)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(mode, shortcut, action, opts)
end

Utils.setKeymapG = function (shortcut, action)
  map('', shortcut, action)
end

Utils.setKeymapN = function (shortcut, action)
  map('n', shortcut, action)
end

Utils.setKeymapV = function (shortcut, action)
  map('v', shortcut, action)
end

Utils.setKeymapI = function (shortcut, action)
  map('i', shortcut, action)
end

Utils.setKeymapX = function (shortcut, action)
  map('x', shortcut, action)
end

return Utils
