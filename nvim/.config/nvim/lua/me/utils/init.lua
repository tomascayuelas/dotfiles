M = {}
LAZY_PLUGIN_SPEC = {}

M.prequire = function(library)
  local statusOk, libraryLoaded = pcall(require, library)

  if not statusOk then
    print("library not loaded: " .. library)
    return
  end

  return libraryLoaded
end

M.spec = function(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

return M
