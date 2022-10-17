-- Plugins manager
require('usr.plugins')

-- Vim options
require('usr.options')

-- Set Colorscheme
require('usr.colorscheme')

-- Load general keymaps
-- Note: Plugin specific keymaps are in their corresponding plugin config file
require('usr.keymaps')

-- Load plugins configs
require('usr.plugin_config.project')
require('usr.plugin_config.telescope')
require('usr.plugin_config.treesitter')
require('usr.plugin_config.lsp')
require('usr.plugin_config.rust_tools')
require('usr.plugin_config.autopairs')
require('usr.plugin_config.cmp')
require('usr.plugin_config.lspsignature')
require('usr.plugin_config.lualine')
require('usr.plugin_config.gitsigns')
require('usr.plugin_config.nvim_tree')
require('usr.plugin_config.comment')
require('usr.plugin_config.neogen')
