local Module = {}


Module.setup = function()
  require('neoclip').setup({
    history = 100,
    enable_persistant_history = false
  })
end

return Module
