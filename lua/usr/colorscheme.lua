-- Set the colorscheme configuration
vim.o.background = 'dark'                                   -- 'dark' or 'light' mode (for gruvbox-material plugin)
vim.api.nvim_set_var('gruvbox_material_background', 'hard') -- 'hard', 'medium', 'soft'
vim.api.nvim_set_var('gruvbox_material_enable_bold', 1)     -- Functions in bold (like original gruvbox)
vim.api.nvim_set_var('gruvbox_material_enable_italic', 1)   -- The font must support italic
vim.cmd([[colorscheme gruvbox-material]])
