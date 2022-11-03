local utils = require('amika.utils')
local mason = utils.load('mason')

mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
  },

  max_concurrent_installers = 4,
})
