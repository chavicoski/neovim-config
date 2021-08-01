-- Plugins manager
require('plugins')

-- General config
vim.g.mapleader = ' '         -- Set <leader> key to <space>
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show numbers relative to current postition
vim.opt.smartindent = true    -- Insert indents automatically
vim.opt.shiftwidth = 4        -- Size of ident
vim.opt.tabstop = 4           -- Number of spaces per tab
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.wrap = false          -- Disable line wrap
vim.opt.termguicolors = true  -- True color support
vim.opt.scrolloff = 4         -- Lines of context when scrolling

-- Colorscheme
vim.o.background = 'dark'                                   -- 'dark' or 'light' mode (for gruvbox-material plugin)
vim.api.nvim_set_var('gruvbox_material_background', 'hard') -- 'hard', 'medium', 'soft'
vim.api.nvim_set_var('gruvbox_material_enable_bold', 1)     -- Functions in bold (like original gruvbox)
vim.api.nvim_set_var('gruvbox_material_enable_italic', 1)   -- The font must support italic
vim.cmd([[colorscheme gruvbox-material]])

-- Load general keymaps. Plugin specific keymaps are in their corresponding plugin config file
require('keymaps')

-- Load plugins configs
require('configs.treesitter')
require('configs.lspconfig')
require('configs.rust_tools')
require('configs.autopairs')
require('configs.compe')
require('configs.lspsignature')
require('configs.lualine')
require('configs.gitsigns')
require('configs.nvim_tree')
