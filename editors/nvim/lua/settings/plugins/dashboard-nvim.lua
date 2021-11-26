local Module = {}

Module.setup = function()
  Variable.g({
    dashboard_default_executive = "telescope"
  })
end

return Module
