local utils = require('amika.utils')
local notify = utils.load('notify')

notify.setup({
  stages = "slide",
  on_open = nil,
  on_close = nil,
  render = "default",
  timeout = 5000,
  max_width = nil,
  max_height = nil,
  background_colour = "Normal",
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
