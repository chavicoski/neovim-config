-- Set the colorscheme configuration
vim.o.background = 'dark'                                    -- 'dark' or 'light' mode (for gruvbox-material plugin)
vim.api.nvim_set_var('gruvbox_material_palette', 'mix')      -- 'original', 'mix', 'material'
vim.api.nvim_set_var('gruvbox_material_background', 'hard')  -- 'hard', 'medium', 'soft'
vim.api.nvim_set_var('gruvbox_material_enable_bold', 1)      -- Functions in bold (like original gruvbox)
vim.api.nvim_set_var('gruvbox_material_enable_italic', 1)    -- The font must support italic

-- Choose the colorscheme
local colorscheme = "gruvbox-material"

-- Set colorscheme with a protected call to show a prettier error message
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("[Error]: colorscheme " .. colorscheme .. " not found! (in colorscheme.lua)")
  return
end
