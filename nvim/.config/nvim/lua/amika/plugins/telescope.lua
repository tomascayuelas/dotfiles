local utils = require 'amika.utils'

local telescope = utils.load('telescope')

telescope.load_extension('projects')
telescope.setup()

